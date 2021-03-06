# Getting and Cleaning Data Course Project

This project is about how I obtained, cleaned, mergeed and summarized the [Human Activity Recognition Using Smartphones Dataset](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones). A detailed problem description is available at UCI site. I'll try to keep things as simple as possible, following instructions from the project statement, we need a R script that:

1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement.
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive variable names.
5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

This will be peer-reviewed project. This repo contains these files:

1. _run_analysis.R_: the main script to load, clean, summarize and output a tidy dataset from Human Activity Recognition.
2. _code_book.R_: is the script to get the Code Book for variable names in the final tidy dataset.
3. _har_tidy.txt_: final tiydy dataset for Human Activity Recognition
4. _code_book.txt_: code book with detailed info for each variable.

To run the script, first download the dataset, unzip it, and place _run_analysis.R_ in the same folder. Packages *data.table* and *dplyr* are required. From now on, I will be giving the details of each step in the script. 

First, clear the workspace and load the required packages and set the working directory.

```R
rm( list = ls(all = T))

library(data.table)
library(dplyr)

working_dir= "C:/0501/@coursera/data science JHU/getting_data/data/UCI HAR Dataset"
setwd(working_dir)
```
## Loading features names

Here we load the 561 features names, replacing paranthesis "()" and commas "," with underscores `_`.
For the variables with "bandsEnergy", I did something different: the comma character was replaced with the string `_to_`. This is step is no needed, but it is useful for practice. Variable names are almost self explanatory so there is no need to do anything else. We make sure this meets condition [4]

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

Using _fread_ instead of _read.delim_ resulted in lower loading time and automatic column recognition. I coded a function to take advantage of folder/files names.

```R
LoadData <- function(tdata){

    dt <- fread(paste0(tdata,"/X_",tdata,".txt"),sep=" ", header = F)
    names(dt) <- feat$var
    
    dt$subject <- fread(paste0(tdata,"/subject_",tdata,".txt"))
    dt$activity <- fread(paste0(tdata,"/y_",tdata,".txt"))
    return(dt)
}
```

Now, load the two sets and joins them. This meets condition [1] 
```R
train <- LoadData("train")
test <- LoadData("test")
join <- rbind(train,test)
```
As stated, we will only need variables on the mean and standard deviation, so filtering the column names reduces the table to only 180 variables. This meets condition [2]. I had some issues with _dplyr::select()_, and found a solution to avoid duplicate colnames. 

```R
valid_column_names <- make.names(names=names(join), unique=TRUE, allow_ = TRUE)
names(join) <- valid_column_names

join_ms <- select(join,matches("mean|std|subject|activity"))
```
## Adding activity descriptions from labels.

Now, we add activity description using the file _activity_labels.txt_, and drop the encoded column. So [3] is done.

```R
activity_labels <- fread("activity_labels.txt",sep = " ", header = F, col.names = c("activity","activity_desc"))
join_ms <- left_join(join_ms,activity_labels)
join_ms$activity <- NULL
join_ms <- select(join_ms,subject,activity_desc,everything())  # reorder columns
```

## Aggregation by subject and activities.
Finally, grouping by subject and activity description and calculating means for each variable using _dyplr_, we get a smaller output, meeting condition [5]. Writes output as .txt file.
```R
join_tidy <- join_ms %>% group_by(subject,activity_desc) %>% summarise_all(funs(mean))
write.table(join_tidy,"har_tidy.txt",row.names = F)
```

## Is it tidy?
Yes. This dataset didn't need reshaping, because each variable came in its column. Also, contains one observation (subject,activity,mean(~allmeasures)) by row, and each cell contains only one datum.

Any question or improvement will be considered.

## Appendix: Code book
This code will generate a data table with details of the variables in the final tidy dataset. Must be run after run_analysis.R with all data in the workspace.
*Note:* each variable is the *column mean* for every subject and activity pair. 

```R
# code book
dbook <- as.data.table( names(join_tidy))
dbook <- rename(dbook,var = V1)
dbook$aggr <- "" 
dbook$aggr[grep("[Mm]ean",dbook$var)] <- "Mean of "
dbook$aggr[grep("std",dbook$var)] <- "Standard Deviation of "
dbook$domain <- "" 
dbook$domain[grep("^t",dbook$var)] <- "Time Domain "
dbook$domain[grep("^f",dbook$var)] <- "Frequency Domain "
dbook$component <- "" 
dbook$component[grep("Acc_",dbook$var)] <- "Linear Acceleration "
dbook$component[grep("AccJerk_",dbook$var)] <- "Linear Jerk "
dbook$component[grep("AccMag_",dbook$var)] <- "Linear Magnitude "
dbook$component[grep("AccJerkMag_",dbook$var)] <- "Linear Jerk Margnitude"
dbook$component[grep("Gyro_",dbook$var)] <- "Angular Acceleration "
dbook$component[grep("GyroJerk_",dbook$var)] <- "Angular Jerk "
dbook$component[grep("GyroMag_",dbook$var)] <- "Angular Magnitude "
dbook$component[grep("GyroJerkMag_",dbook$var)] <- "Angular Jerk Magnitude "
dbook$element <- ""
dbook$element[grep("Body",dbook$var)] <- "Body "
dbook$element[grep("Gravity",dbook$var)] <- "Gravity "
dbook$axis <- ""
dbook$axis[grep("_X",dbook$var)] <- "X"
dbook$axis[grep("_Y",dbook$var)] <- "Y"
dbook$axis[grep("_Z",dbook$var)] <- "Z"
write.table(dbook,"code_book.txt",row.names = F)
```

