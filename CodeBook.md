---
title: "Getting and Cleaning Data Course Project Codebook"
output: html_document
---

## The Data Source:
You can find the original data and its description hosted by the University of California at Irvine at the below links. 

* Data: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip  
* Description: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

## The Data
Experiments were undertaken by 30 volunteers within an age range of 19-48, performing various activities while wearing a smartphone: walking, walking upstairs, walking downstairs, sitting, standing, and laying. The experiments were video-recorded and information from the smartphone's accelerometer and gyroscope were taken.   

The dataset contains the following files:

* 'README.txt'
* 'features_info.txt': Shows information about the variables used on the feature vector.
* 'features.txt': List of all features.
* 'activity_labels.txt': Links the class labels with their activity name.
* 'train/X_train.txt': Training set.
* 'train/y_train.txt': Training labels.
* 'test/X_test.txt': Test set.
* 'test/y_test.txt': Test labels.

The following files are available for the train and test data. Their descriptions are equivalent:

* 'train/subject_train.txt': Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30.
* 'train/Inertial Signals/total_acc_x_train.txt': The acceleration signal from the smartphone accelerometer X axis in standard gravity units 'g'. Every row shows a 128 element vector.
* 'train/Inertial Signals/body_acc_x_train.txt': The body acceleration signal obtained by subtracting the gravity from the total acceleration.
* 'train/Inertial Signals/body_gyro_x_train.txt': The angular velocity vector measured by the gyroscope for each window sample. The units are radians/second.

## Code Outline

The code completes the following steps:  

1. Read the raw data and merge the training and test datasets
2. Extract estimates of the mean and standard deviation for each measurement
3. Apply descriptive activity names and variable names to the merged dataset
4. Estimate the average of each variable for each activity and subject
5. Write the data set to`FinalData.txt`

## How run_analysis.R implements the steps outlines above

* The dplyr library is required
* Load the training and test data sets, features file, and activity labels file
* Extract the mean and standard deviation for each measurement, discarding the rest
* Replace the activity identifiers (originally set to integers 1-6) with descriptive activity names
* Replace variable names with descriptive variable names in lowercase (e.g. tBodyAcc-mean()-X replaced with time_body_accelerometer_mean_x)
    * Characters were set to lowercase, separated by underscores per the [tidyverse style guide](https://style.tidyverse.org/syntax.html#object-names)
    * Special characters (e.g. (, ), -) were removed
    * The initial f and t characters were expanded to frequency and time
    * Acc, Gryo, and Mag were expanded to accelerometer, gyroscope, and magnitude
    * Replaced BodyBody with body as it's a [typo per the coursera blog](https://www.coursera.org/learn/data-cleaning/peer/FIZtT/getting-and-cleaning-data-course-project/discussions/threads/yD2gtalxEeelRgqEwi0dZA/replies/tKU-ZKr_EeeANQrOhBtvUA)
* A final dataset was then created with the average of each variable for each activity and each subject.
    * The final dataset can be seen via `View(FinalData)` or in the resulting text file "FinalData.txt"