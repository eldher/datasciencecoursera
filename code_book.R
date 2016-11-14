
# data book
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
