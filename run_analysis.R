library(reshape2)
# (0) Read Data In
# ------------
# activityLabels: classname <-> activityname
activityLabels <- read.table("data/activity_labels.txt", header = FALSE)
# features: list of all features
features <- read.table("data/features.txt", header = FALSE)
# xTrain: trainings set
xTrain <- read.table("data/train/X_train.txt", header = FALSE)
names(xTrain) <- features[,2]
# yTrain: trainings label
yTrain <- read.table("data/train/Y_train.txt", header = FALSE)
# xTrain: test set
xTest <- read.table("data/test/X_test.txt", header = FALSE)
names(xTest) <- features[,2]
# yTrain: test label
yTest <- read.table("data/test/Y_test.txt", header = FALSE)
# subjects of activity (train)
subjectTrain <- read.table("data/train/subject_train.txt", header = FALSE)
names(subjectTrain) <- "subject"
# subjects of activity (test)
subjectTest <- read.table("data/test/subject_test.txt", header = FALSE)
names(subjectTest) <- "subject"

# (1) Merge Data
# --------------

# bind the columns of training and test data, respectively
# ... and get good column names
train <- cbind(subjectTrain, yTrain, xTrain)
test <- cbind(subjectTest, yTest, xTest)

# merge training and test data into one datases
allData <- rbind(train, test)

# (2) Extract only mean and standard deviations
# ---------------------------------------------

# retrieve only the features that we want (1 and 2 are subject and V1 -> to be merged with activity label)
meanOrStdFeatures <- c(c(1,2), grep("-mean\\(\\)", names(allData)),
                       grep("-std\\(\\)", names(allData)))
allData <- allData[, meanOrStdFeatures]

# (3) Get descriptive activity names
# ----------------------------------

# now merge with activityLabels
allData <- merge(activityLabels, allData, by.x = "V1", by.y = "V1")
# .. reorder a little and remove V1
allData <- allData[c("subject", "V2", colnames(allData)[4:length(colnames(allData))])]
names(allData)[2] <- "activity"

# (4) Apprioriate labels for data set
# -----------------------------------

# already done as part of the above

# now we make it long, assuming that one observation consists of
# - subkject
# - activity
# - variable (e.g. fBodyAccJerkX, i.e. including the axis if it exists)
# ... and variables are
# - mean
# - std
# (will not use x, y, z, becaue there are also variables without)

# need a row id for later
allData$ID <- seq.int(nrow(allData))
# melt into a long dataset
allData <- melt(allData, id=c("ID", "subject", "activity"))
# get the type (mean or std) ...
allData$type <- ifelse(grepl("std", allData$variable), "std", "mean")
# ... remove mean/std from the variable name ...
allData$variable <- gsub("-mean\\(\\)-*", "", allData$variable)
allData$variable <- gsub("-std\\(\\)-*", "", allData$variable)
# and split the table into two ...
t_std <- allData[allData$type == "std", ]
t_mean <- allData[allData$type == "mean", ]
# ... and merge again ...

allData <- merge(t_mean, t_std, by.x = c("ID", "subject", "activity", "variable"),
                 by.y = c("ID", "subject", "activity", "variable"))
# Rename columns and remove some
names(allData)[c(4, 5, 7)] <- c("measurement", "mean", "std")
activityData <- allData[-c(1, 6, 8)]
# done!

# (5) Create an independent tidy data set with average of
#     each variable per activity and subset
# -------------------------------------------------------
library(plyr)
library(dplyr)
# means per combination of subject & activity
meanActivityData <- ddply(activityData, .(subject, activity, measurement), summarize,
                          mean_mean = mean(mean), mean_std = mean(std))

# not sure this is needed, further summaries
# mean per subject, averaged over all activities
meanActivityDataPerActitity <- select(
  ddply(activityData, .(activity, measurement), summarize, subject = "All", mean_mean = mean(mean), mean_std = mean(std)),
  subject, activity, measurement, everything())
# mean per activity, averaged over all subjects
meanActivityDataPerSubject <- select(
  ddply(activityData, .(subject, measurement), summarize, activity = "All", mean_mean = mean(mean), mean_std = mean(std)),
  subject, activity, measurement, everything())

