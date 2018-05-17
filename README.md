# Getting And Cleaning Data Course Project - Coursera Class Project
## The files
This submission contains the following files:
- README.md: this file
- CodeBook.md: the codebook explaining the tidy data
- run_analysis.R: the R script that cleans [the data referenced in the exercise](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip) as per the assignment

## Steps towards clean data
The detailed steps are explained in run_analysis.R, this is an overview

### Step 0 - read the data in
Reads the data from the various files into data.frames (and adds a few names already)

### Step 1 - Merge data
The data for one observation is spread over several data.frames as read from the files. This sections binds together the columns - subjects, yTrain/yTest containing the activities (coded - later *activityLabels* will be used to replace the integers by clear names) and finally the measurements. In a second step training and test data is joined.

### Step 2 - reduce to only means and standard deviations
The final dataset should only contain means and standard deviations, so everything is removed (using *grep*)

### Step 3 - perform join to descriptive activity names
Now the data.frame is joined with the activityLabels data to get descriptive labels. This is only performed now because it changes the order or rows.

### Step 4 - make the data "long"
The data currently contains many observation (taking on of the mean/std devivations measured as one observation) - we are going to make this long, such that one measurement is in one row only.

The result is the first tidy dataset. this is the long form as mentioned in the rubric as either long or wide form is acceptable	 

### Step 5 - create a second tiny data set with means of each variable
Uses (d)plyr to calculate means of each variable/observation

## Why is the original data not clean?
