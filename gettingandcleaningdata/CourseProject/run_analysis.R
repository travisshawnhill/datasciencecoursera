## Getting and Cleaning Data, Course Project

## Script uses 'reshape2' package to melt data, install/load package to start
if (!library(reshape2)) {
    install.packages("reshape2")
}

library(reshape2)

## Determine if dataset is in working directory, if not, download and unzip

filename <- "getdata_dataset.zip"
if (!file.exists(filename)){
    fileURL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip "
    download.file(fileURL, filename, method="curl")
    unzip(filename) 
}  

## Import data from all sources

features <- read.table('./UCI HAR Dataset/features.txt',header=FALSE)
activityType <- read.table('./UCI HAR Dataset/activity_labels.txt',header=FALSE)
subjectTrain <- read.table('./UCI HAR Dataset/train/subject_train.txt',header=FALSE) 
xTrain <- read.table('./UCI HAR Dataset/train/x_train.txt',header=FALSE)
yTrain <- read.table('./UCI HAR Dataset/train/y_train.txt',header=FALSE)
subjectTest <- read.table('./UCI HAR Dataset/test/subject_test.txt',header=FALSE)
xTest <- read.table('./UCI HAR Dataset/test/x_test.txt',header=FALSE)
yTest <- read.table('./UCI HAR Dataset/test/y_test.txt',header=FALSE)

## Clean up variable names from xTrain and xTest

features[,2] <- gsub("\\()","", features[,2])
features[,2] <- gsub('-meanFreq', 'MeanFrequency', features[,2])
features[,2] <- gsub('-mean', 'Mean', features[,2])
features[,2] <- gsub('-std', 'StdDev', features[,2])


## Assign descriptive column names to data
## (Requirement 4)

colnames(activityType) <- c('activity','activityType')
colnames(xTrain) <- features[,2] 
colnames(yTrain) <- "activity"
colnames(subjectTrain) <- "subjectId"
colnames(xTest) <- features[,2] 
colnames(yTest) <- "activity"
colnames(subjectTest) <- "subjectId"

## Extracts only the measurements on the mean and standard deviation for each measurement
## (Requirement 2)

featuresStdMean <- grepl("Mean|Std", features[,2])
xTrain <- xTrain[, featuresStdMean]
xTest <- xTest[, featuresStdMean]

## Merge the training and the test sets to create one data set
## (Requirement 1)

trainingData <- cbind(yTrain,subjectTrain,xTrain)
testData <- cbind(yTest,subjectTest,xTest)
combineData <- rbind(trainingData,testData)

## Convert activity variable into factor with labels and levels from activityType, and
## use descriptive activity names to name the activities in the data set
## (Requirement 3)

combineData$activity <- factor(combineData$activity, levels = activityType[,1], labels = activityType[,2])

## Melt the data to produce a tidy dataset, then use dcast to find means of all variables
## (all columns except for 'activity' and 'subjectId')

meltData <- melt(combineData, id=c("activity", "subjectId"))
tidyData <- dcast(meltData, subjectId + activity ~ variable, mean)

## Write the tidy data created above to a file for upload
## (Requirement 5)

write.table(tidyData, file = "./tidyData.txt", row.names = FALSE)