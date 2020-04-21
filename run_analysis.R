## Source data
## https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

## This R script completes the following steps:
## 1. Read the raw data and merge the training and test datasets
## 2. Extract estimates of the mean and standard deviation for each measurement
## 3. Apply descriptive activity names and variable names to the merged dataset
## 4. Estimate the average of each variable for each activity and subject
## 5. Write the data set to`FinalData.txt`

library("dplyr")
## Step 1 - downloading and merging all X data, Y data, and Subject data into X, Y, and S sets
zipFileURL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
zipFile <- "UCI Har Dataset.zip"

# Download and unzip file if need be
if (!file.exists(zipFile)) {
        download.file(zipFileURL, zipFile, mode ="wb")
}
Path <- "UCI Har Dataset"
if (!file.exists(Path)){
        unzip(zipFile)
}

## X's contain our various features (measures)
Xtrain <- read.table("UCI HAR Dataset/train/X_train.txt")
Xtest <- read.table("UCI HAR Dataset/test/X_test.txt")
AllX <- rbind(Xtrain, Xtest)

## S's contain our subjects
Strain <- read.table("UCI HAR Dataset/train/subject_train.txt")
Stest <- read.table("UCI HAR Dataset/test/subject_test.txt")
AllSubject <- rbind(Strain, Stest)

## Y's contain our values for activities
Ytrain <- read.table("UCI HAR Dataset/train/y_train.txt")
Ytest <- read.table("UCI HAR Dataset/test/y_test.txt")
AllY <- rbind(Ytrain, Ytest)

## Step 2: Extract Measurements on Mean and STD
features <- read.table("UCI HAR Dataset/features.txt")
## Select rows containing mean and STD info from features
featurerows <- grep("-mean\\(\\)|-std\\(\\)", features[, 2])

## Subsetting X to only contain the mean and STD "features"
AllX <- AllX[, featurerows]
## Setting column heads of X to match features and making all names lowercase
names(AllX) <- features[featurerows, 2]
names(AllX) <- tolower(names(AllX))
names(AllX) <- gsub("^t", "time_", names(AllX))
names(AllX) <- gsub("^f", "frequency_", names(AllX))
names(AllX) <- gsub("acc", "accelerometer_", names(AllX))
names(AllX) <- gsub("gyro", "gyroscope_", names(AllX))
names(AllX) <- gsub("mag", "magnitude_", names(AllX))
names(AllX) <- gsub("bodybody", "body", names(AllX))
names(AllX) <- gsub("body", "body_", names(AllX))
names(AllX) <- gsub("gravity", "gravity_", names(AllX))
names(AllX) <- gsub("jerk", "jerk_", names(AllX))
names(AllX) <- gsub("\\(|\\)", "", names(AllX))
names(AllX) <- gsub("\\-", "_", names(AllX))
names(AllX) <- gsub("\\__", "_", names(AllX))

## Step 3: Provide column headers for activities (e.g. laying) and subjects
## Replacing all underscores and making everything lowercase for measures
## Also providing a descriptive column name
activities <- read.table("UCI HAR Dataset/activity_labels.txt")
activities[, 2] = gsub("_", "", tolower(as.character(activities[, 2])))
AllY[,1] = activities[AllY[,1], 2]
names(AllY) <- "activity"
names(AllSubject) <- "subject"

## Step 4:  Estimate the average of each variable for each activity and each subject
CombinedData <- cbind(AllSubject, AllY, AllX)
FinalData <- CombinedData %>%
        group_by(subject, activity) %>%
        summarise_all(mean)
## Step 5: Create a .txt file containing our final, tidy data
write.table(FinalData, "FinalData.txt", row.name=FALSE)
View(FinalData)
