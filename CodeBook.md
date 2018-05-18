# Activity Data Code Book

## Original data source and description

The data is based on this [website](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones).

Basic description of the original dataset from the [website](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones):

The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain.

This data is cleaned and reduced according to the requirements in the assignment. The result are two datasets which are described in the following:

## activityData dataset

Field name|Description
----------|-----------
subject|Identifies the subject that carried out the activities. There are 30 subjects in the dataset, each performed each of the activities several times 
activity|Identifies the activity as string. There are six different activities (LAYING, SITTING, STANDING, WALKING, WALKING_DOWNSTAIRS, WALKING_UPSTAIRS).
measurement|Labels the measurement that is done (the feature - only those are present for which mean and standard deviation are in the file).
mean|The mean of the feature variable
std|The standard deviation of the feature variable

## meanActivityData dataset
Field name|Description
----------|-----------
subject|Identifies the subject that carried out the activities. There are 30 subjects
activity|Identifies the activity as string. There are six different activities (LAYING, SITTING, STANDING, WALKING, WALKING_DOWNSTAIRS, WALKING_UPSTAIRS)
measurement|Labels the measurement that is done (the feature - only those are present for which mean and standard deviation are in the file).
mean_mean|The mean of the mean feature variable across the combination of subject and activity (if subject = "All", then mean_mean contains the mean of the mean of the variable across all activities; if activity = "All", then mean_mean contains the mean of the mean of the feature variable across all subjects
mean_std|As mean_mean, but for the mean of the standard deviation.

## The measurements in the data

The measurements in the (clean) data sets are listed in the following table. The description of each measurement can be found on the [website](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones) the data is based on:

Nr|measurement
--|-----------
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
