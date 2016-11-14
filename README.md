# Readme for Final Peer Review Project

The code for Peer-graded Assignment: *Getting and Cleaning Data Course Project*

I tried to keep things as simple as possible, following instructions given. So this code does:

1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement.
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive variable names.
5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

First, clear the workspace and load needed packages, set working dir. Downloaded and unzipped in folder, replace with your own.

```R
rm( list = ls(all = T))

library(data.table)
library(dplyr)

working_dir= "C:/0501/@coursera/data science JHU/getting_data/data/UCI HAR Dataset"
setwd(working_dir)
```

The first step was to load the 561 features names, replacing paranthesis "()" and commas "," with underscores "_"
The variables with "bandsEnergy" the comma character was replaced with the string "_to_"

```R
feat <- read.delim("features.txt",sep=" ", header = F, stringsAsFactors = F,
                   col.names = c("n","var"))[2]

feat$var <- gsub("\\(\\)","",feat$var)
feat$var[grep("bandsEnergy",feat$var)] <-
    gsub(",","_to_",grep("bandsEnergy",feat$var, value = T))
feat$var <- gsub(",","_",feat$var)
feat$var <- gsub("-","_",feat$var)
feat$var <- gsub("\\(","_args_",feat$var)
feat$var <- gsub("\\)","",feat$var)
```

## Loading training and testing data sets.

Coded a function to load both data sets. Using _fread_ instead of _read.delim_ resulted in lower loading time and automatic column recognition. The function works well taking advantage of folder/files names.

```R
LoadData <- function(tdata){

    dt <- fread(paste0(tdata,"/X_",tdata,".txt"),sep=" ", header = F)
    names(dt) <- feat$var
    
    dt$subject <- fread(paste0(tdata,"/subject_",tdata,".txt"))
    dt$activity <- fread(paste0(tdata,"/y_",tdata,".txt"))
    return(dt)
}
```

Now, simply load the two sets and join them
```R
train <- LoadData("train")
test <- LoadData("test")
join <- rbind(train,test)
```
As stated, we will only need variables on the mean and standard deviation, so, I filtered column names, but was having some troubles. Find this solution to avoid duplicate names. Also, not forget the subject and activity variables.

```R
valid_column_names <- make.names(names=names(join), unique=TRUE, allow_ = TRUE)
names(join) <- valid_column_names

join_ms <- select(join,matches("mean|std|subject|activity"))
```

Now, we add activity description using the labels, and drop the encoded column.

```R
activity_labels <- fread("activity_labels.txt",sep = " ", header = F, col.names = c("activity","activity_desc"))
join_ms <- left_join(join_ms,activity_labels)
join_ms$activity <- NULL
join_ms <- select(join_ms,subject,activity_desc,everything())  # reorder columns
```

Finally, calculate means by each variable, grouped by subject and activity description, using dyplr. Write tidy output.
```R
join_tidy <- join_ms %>% group_by(subject,activity_desc) %>% summarise_all(funs(mean))
```
