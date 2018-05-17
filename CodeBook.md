# Activity Data Code Book

The data is based on this [website](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones).

## activityData dataset

Field name|Description
----------|-----------
subject|Identifies the subject that carried out the activities. There are 30 subjects
activity|Identifies the activity as string. There are six different activities (LAYING, SITTING, STANDING, WALKING, WALKING_DOWNSTAIRS, WALKING_UPSTAIRS)
measurement|Gives the measurement that is done (the variable - only those are present for which mean and standard deviation are in the file).
mean|The mean of the variable
std|The standard deviation of the variable

## meanActivityData dataset
Field name|Description
----------|-----------
subject|Identifies the subject that carried out the activities. There are 30 subjects
activity|Identifies the activity as string. There are six different activities (LAYING, SITTING, STANDING, WALKING, WALKING_DOWNSTAIRS, WALKING_UPSTAIRS)
measurement|Gives the measurement that is done (the variable - only those are present for which mean and standard deviation are in the file).
mean_mean|The mean of the mean variable across the combination of subject and activity (if subject = "All" mean_mean contains the mean of the mean of the variable across all activities; if activity = = "All" mean_mean contains the mean of the mean of the variable across all subjects
mean_std|As mean_mean, but for the standard deviation.

The measurements in the data set are listed in the following table. The description of each measurement can be found on the [website](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones) the data is based on:
|measurement
1|fBodyAccJerkX
2|fBodyAccJerkY
3|fBodyAccJerkZ
4|fBodyAccMag
5|fBodyAccX
6|fBodyAccY
7|fBodyAccZ
8|fBodyBodyAccJerkMag
9|fBodyBodyGyroJerkMag
10|fBodyBodyGyroMag
11|fBodyGyroX
12|fBodyGyroY
13|fBodyGyroZ
14|tBodyAccJerkMag
15|tBodyAccJerkX
16|tBodyAccJerkY
17|tBodyAccJerkZ
18|tBodyAccMag
19|tBodyAccX
20|tBodyAccY
21|tBodyAccZ
22|tBodyGyroJerkMag
23|tBodyGyroJerkX
24|tBodyGyroJerkY
25|tBodyGyroJerkZ
26|tBodyGyroMag
27|tBodyGyroX
28|tBodyGyroY
29|tBodyGyroZ
30|tGravityAccMag
31|tGravityAccX
32|tGravityAccY
33|tGravityAccZ
