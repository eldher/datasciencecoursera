# Final Project 
# Eldher Hernandez
# 2016-11-13

library(data.table)
library(dplyr)

rm( list = ls(all = T))
working_dir= "C:/0501/@coursera/data science JHU/getting_data/data/UCI HAR Dataset"
setwd(working_dir)

feat <- read.delim("features.txt",sep=" ", header = F, stringsAsFactors = F,
                   col.names = c("n","var"))[2]

feat$var <- gsub("\\(\\)","",feat$var)
feat$var[grep("bandsEnergy",feat$var)] <-
    gsub(",","_to_",grep("bandsEnergy",feat$var, value = T))
feat$var <- gsub(",","_",feat$var)
feat$var <- gsub("-","_",feat$var)
feat$var <- gsub("\\(","_args_",feat$var)
feat$var <- gsub("\\)","",feat$var)

# load train data using fread for best performance
LoadData <- function(tdata){
    dt <- fread(paste0(tdata,"/X_",tdata,".txt"),sep=" ", header = F)
    names(dt) <- feat$var    
    dt$subject <- fread(paste0(tdata,"/subject_",tdata,".txt"))
    dt$activity <- fread(paste0(tdata,"/y_",tdata,".txt"))
    return(dt)
}

train <- LoadData("train")
test <- LoadData("test")
join <- rbind(train,test)

# cleans colum names to avoid problems with dplyr select()
valid_column_names <- make.names(names=names(join), unique=TRUE, allow_ = TRUE)
names(join) <- valid_column_names

join_ms <- select(join,matches("mean|std|subject|activity"))
activity_labels <- fread("activity_labels.txt",sep = " ", header = F, col.names = c("activity","activity_desc"))
join_ms <- left_join(join_ms,activity_labels)
join_ms$activity <- NULL

join_ms <- select(join_ms,subject,activity_desc,everything())
join_tidy <- join_ms %>% group_by(subject,activity_desc) %>% summarise_all(funs(mean))
write.table(join_tidy,"har_tidy.txt",row.names = F)
