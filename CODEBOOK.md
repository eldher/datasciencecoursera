
# Code book for UCI HAR 
Every numerical variable is the result from taking the column mean for each. Grouped by subject and activity.

|       Variable                                 |    Description              |    Domain              |    Element    |    Component                 |    Axis    |
|------------------------------------------------|-----------------------------|------------------------|---------------|------------------------------|------------|
|    subject                                     |       Subject ID            |                        |               |                              |            |
|    activity_desc                               |       Activity Description  |                        |               |                              |            |
|    tBodyAcc_mean_X                             |    Mean of                  |    Time Domain         |    Body       |    Linear Acceleration       |    X       |
|    tBodyAcc_mean_Y                             |    Mean of                  |    Time Domain         |    Body       |    Linear Acceleration       |    Y       |
|    tBodyAcc_mean_Z                             |    Mean of                  |    Time Domain         |    Body       |    Linear Acceleration       |    Z       |
|    tBodyAcc_std_X                              |    Standard Deviation of    |    Time Domain         |    Body       |    Linear Acceleration       |    X       |
|    tBodyAcc_std_Y                              |    Standard Deviation of    |    Time Domain         |    Body       |    Linear Acceleration       |    Y       |
|    tBodyAcc_std_Z                              |    Standard Deviation of    |    Time Domain         |    Body       |    Linear Acceleration       |    Z       |
|    tGravityAcc_mean_X                          |    Mean of                  |    Time Domain         |    Gravity    |    Linear Acceleration       |    X       |
|    tGravityAcc_mean_Y                          |    Mean of                  |    Time Domain         |    Gravity    |    Linear Acceleration       |    Y       |
|    tGravityAcc_mean_Z                          |    Mean of                  |    Time Domain         |    Gravity    |    Linear Acceleration       |    Z       |
|    tGravityAcc_std_X                           |    Standard Deviation of    |    Time Domain         |    Gravity    |    Linear Acceleration       |    X       |
|    tGravityAcc_std_Y                           |    Standard Deviation of    |    Time Domain         |    Gravity    |    Linear Acceleration       |    Y       |
|    tGravityAcc_std_Z                           |    Standard Deviation of    |    Time Domain         |    Gravity    |    Linear Acceleration       |    Z       |
|    tBodyAccJerk_mean_X                         |    Mean of                  |    Time Domain         |    Body       |    Linear Jerk               |    X       |
|    tBodyAccJerk_mean_Y                         |    Mean of                  |    Time Domain         |    Body       |    Linear Jerk               |    Y       |
|    tBodyAccJerk_mean_Z                         |    Mean of                  |    Time Domain         |    Body       |    Linear Jerk               |    Z       |
|    tBodyAccJerk_std_X                          |    Standard Deviation of    |    Time Domain         |    Body       |    Linear Jerk               |    X       |
|    tBodyAccJerk_std_Y                          |    Standard Deviation of    |    Time Domain         |    Body       |    Linear Jerk               |    Y       |
|    tBodyAccJerk_std_Z                          |    Standard Deviation of    |    Time Domain         |    Body       |    Linear Jerk               |    Z       |
|    tBodyGyro_mean_X                            |    Mean of                  |    Time Domain         |    Body       |    Angular Acceleration      |    X       |
|    tBodyGyro_mean_Y                            |    Mean of                  |    Time Domain         |    Body       |    Angular Acceleration      |    Y       |
|    tBodyGyro_mean_Z                            |    Mean of                  |    Time Domain         |    Body       |    Angular Acceleration      |    Z       |
|    tBodyGyro_std_X                             |    Standard Deviation of    |    Time Domain         |    Body       |    Angular Acceleration      |    X       |
|    tBodyGyro_std_Y                             |    Standard Deviation of    |    Time Domain         |    Body       |    Angular Acceleration      |    Y       |
|    tBodyGyro_std_Z                             |    Standard Deviation of    |    Time Domain         |    Body       |    Angular Acceleration      |    Z       |
|    tBodyGyroJerk_mean_X                        |    Mean of                  |    Time Domain         |    Body       |    Angular Jerk              |    X       |
|    tBodyGyroJerk_mean_Y                        |    Mean of                  |    Time Domain         |    Body       |    Angular Jerk              |    Y       |
|    tBodyGyroJerk_mean_Z                        |    Mean of                  |    Time Domain         |    Body       |    Angular Jerk              |    Z       |
|    tBodyGyroJerk_std_X                         |    Standard Deviation of    |    Time Domain         |    Body       |    Angular Jerk              |    X       |
|    tBodyGyroJerk_std_Y                         |    Standard Deviation of    |    Time Domain         |    Body       |    Angular Jerk              |    Y       |
|    tBodyGyroJerk_std_Z                         |    Standard Deviation of    |    Time Domain         |    Body       |    Angular Jerk              |    Z       |
|    tBodyAccMag_mean                            |    Mean of                  |    Time Domain         |    Body       |    Linear Magnitude          |            |
|    tBodyAccMag_std                             |    Standard Deviation of    |    Time Domain         |    Body       |    Linear Magnitude          |            |
|    tGravityAccMag_mean                         |    Mean of                  |    Time Domain         |    Gravity    |    Linear Magnitude          |            |
|    tGravityAccMag_std                          |    Standard Deviation of    |    Time Domain         |    Gravity    |    Linear Magnitude          |            |
|    tBodyAccJerkMag_mean                        |    Mean of                  |    Time Domain         |    Body       |    Linear Jerk Margnitude    |            |
|    tBodyAccJerkMag_std                         |    Standard Deviation of    |    Time Domain         |    Body       |    Linear Jerk Margnitude    |            |
|    tBodyGyroMag_mean                           |    Mean of                  |    Time Domain         |    Body       |    Angular Magnitude         |            |
|    tBodyGyroMag_std                            |    Standard Deviation of    |    Time Domain         |    Body       |    Angular Magnitude         |            |
|    tBodyGyroJerkMag_mean                       |    Mean of                  |    Time Domain         |    Body       |    Angular Jerk Magnitude    |            |
|    tBodyGyroJerkMag_std                        |    Standard Deviation of    |    Time Domain         |    Body       |    Angular Jerk Magnitude    |            |
|    fBodyAcc_mean_X                             |    Mean of                  |    Frequency Domain    |    Body       |    Linear Acceleration       |    X       |
|    fBodyAcc_mean_Y                             |    Mean of                  |    Frequency Domain    |    Body       |    Linear Acceleration       |    Y       |
|    fBodyAcc_mean_Z                             |    Mean of                  |    Frequency Domain    |    Body       |    Linear Acceleration       |    Z       |
|    fBodyAcc_std_X                              |    Standard Deviation of    |    Frequency Domain    |    Body       |    Linear Acceleration       |    X       |
|    fBodyAcc_std_Y                              |    Standard Deviation of    |    Frequency Domain    |    Body       |    Linear Acceleration       |    Y       |
|    fBodyAcc_std_Z                              |    Standard Deviation of    |    Frequency Domain    |    Body       |    Linear Acceleration       |    Z       |
|    fBodyAcc_meanFreq_X                         |    Mean of                  |    Frequency Domain    |    Body       |    Linear Acceleration       |    X       |
|    fBodyAcc_meanFreq_Y                         |    Mean of                  |    Frequency Domain    |    Body       |    Linear Acceleration       |    Y       |
|    fBodyAcc_meanFreq_Z                         |    Mean of                  |    Frequency Domain    |    Body       |    Linear Acceleration       |    Z       |
|    fBodyAccJerk_mean_X                         |    Mean of                  |    Frequency Domain    |    Body       |    Linear Jerk               |    X       |
|    fBodyAccJerk_mean_Y                         |    Mean of                  |    Frequency Domain    |    Body       |    Linear Jerk               |    Y       |
|    fBodyAccJerk_mean_Z                         |    Mean of                  |    Frequency Domain    |    Body       |    Linear Jerk               |    Z       |
|    fBodyAccJerk_std_X                          |    Standard Deviation of    |    Frequency Domain    |    Body       |    Linear Jerk               |    X       |
|    fBodyAccJerk_std_Y                          |    Standard Deviation of    |    Frequency Domain    |    Body       |    Linear Jerk               |    Y       |
|    fBodyAccJerk_std_Z                          |    Standard Deviation of    |    Frequency Domain    |    Body       |    Linear Jerk               |    Z       |
|    fBodyAccJerk_meanFreq_X                     |    Mean of                  |    Frequency Domain    |    Body       |    Linear Jerk               |    X       |
|    fBodyAccJerk_meanFreq_Y                     |    Mean of                  |    Frequency Domain    |    Body       |    Linear Jerk               |    Y       |
|    fBodyAccJerk_meanFreq_Z                     |    Mean of                  |    Frequency Domain    |    Body       |    Linear Jerk               |    Z       |
|    fBodyGyro_mean_X                            |    Mean of                  |    Frequency Domain    |    Body       |    Angular Acceleration      |    X       |
|    fBodyGyro_mean_Y                            |    Mean of                  |    Frequency Domain    |    Body       |    Angular Acceleration      |    Y       |
|    fBodyGyro_mean_Z                            |    Mean of                  |    Frequency Domain    |    Body       |    Angular Acceleration      |    Z       |
|    fBodyGyro_std_X                             |    Standard Deviation of    |    Frequency Domain    |    Body       |    Angular Acceleration      |    X       |
|    fBodyGyro_std_Y                             |    Standard Deviation of    |    Frequency Domain    |    Body       |    Angular Acceleration      |    Y       |
|    fBodyGyro_std_Z                             |    Standard Deviation of    |    Frequency Domain    |    Body       |    Angular Acceleration      |    Z       |
|    fBodyGyro_meanFreq_X                        |    Mean of                  |    Frequency Domain    |    Body       |    Angular Acceleration      |    X       |
|    fBodyGyro_meanFreq_Y                        |    Mean of                  |    Frequency Domain    |    Body       |    Angular Acceleration      |    Y       |
|    fBodyGyro_meanFreq_Z                        |    Mean of                  |    Frequency Domain    |    Body       |    Angular Acceleration      |    Z       |
|    fBodyAccMag_mean                            |    Mean of                  |    Frequency Domain    |    Body       |    Linear Magnitude          |            |
|    fBodyAccMag_std                             |    Standard Deviation of    |    Frequency Domain    |    Body       |    Linear Magnitude          |            |
|    fBodyAccMag_meanFreq                        |    Mean of                  |    Frequency Domain    |    Body       |    Linear Magnitude          |            |
|    fBodyBodyAccJerkMag_mean                    |    Mean of                  |    Frequency Domain    |    Body       |    Linear Jerk Margnitude    |            |
|    fBodyBodyAccJerkMag_std                     |    Standard Deviation of    |    Frequency Domain    |    Body       |    Linear Jerk Margnitude    |            |
|    fBodyBodyAccJerkMag_meanFreq                |    Mean of                  |    Frequency Domain    |    Body       |    Linear Jerk Margnitude    |            |
|    fBodyBodyGyroMag_mean                       |    Mean of                  |    Frequency Domain    |    Body       |    Angular Magnitude         |            |
|    fBodyBodyGyroMag_std                        |    Standard Deviation of    |    Frequency Domain    |    Body       |    Angular Magnitude         |            |
|    fBodyBodyGyroMag_meanFreq                   |    Mean of                  |    Frequency Domain    |    Body       |    Angular Magnitude         |            |
|    fBodyBodyGyroJerkMag_mean                   |    Mean of                  |    Frequency Domain    |    Body       |    Angular Jerk Magnitude    |            |
|    fBodyBodyGyroJerkMag_std                    |    Standard Deviation of    |    Frequency Domain    |    Body       |    Angular Jerk Magnitude    |            |
|    fBodyBodyGyroJerkMag_meanFreq               |    Mean of                  |    Frequency Domain    |    Body       |    Angular Jerk Magnitude    |            |
|    angle_args_tBodyAccMean_gravity             |    Mean of                  |                        |    Body       |                              |            |
|    angle_args_tBodyAccJerkMean_gravityMean     |    Mean of                  |                        |    Body       |                              |            |
|    angle_args_tBodyGyroMean_gravityMean        |    Mean of                  |                        |    Body       |                              |            |
|    angle_args_tBodyGyroJerkMean_gravityMean    |    Mean of                  |                        |    Body       |                              |            |
|    angle_args_X_gravityMean                    |    Mean of                  |                        |               |                              |    X       |
|    angle_args_Y_gravityMean                    |    Mean of                  |                        |               |                              |    Y       |
|    angle_args_Z_gravityMean                    |    Mean of                  |                        |               |                              |    Z       |

Table markdown generated using [Table Generator](http://www.tablesgenerator.com/markdown_tables)
