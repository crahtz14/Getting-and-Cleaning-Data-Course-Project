---
title: "README"
output: html_document
---

## Getting and Cleaning Data Course Project README

In this project, data on 30 subjects undertaking 6 activities collected by University of California at Irvine (UCI) researchers is collected, cleaned, and summarized to elicit estimates of the mean and standard deviation of a variety of measures. 

This repository contains the following files:

* `README.md`, which provides an overview of the datset and how it was created
* `FinalData.txt`, which contains a cleaned, tidy dataset
* `CodeBook.md`, which is the code book describing the contents of the datset
    * The data
    * Its variables
    * The transformations undertaken to generate `FinalData.txt`
* `run_analysis.R`, which is the script used to create `FinalData.txt`

## Study Design

UCI researchers developed the raw dataset as part of the [Human Activity Recognition Using Smartphones Data Set](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones). They provided the below description on how they collected their data.

> The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label  the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data  and 30% the test data. 

> The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain.

## Project Information

The training and test data were merged together into a combined dataset, allowing for estimates of the mean and standard deviation to be extracted for each measurement. Averages of each activity undertaken by each subject were then taken and written into a new, tidy dataset. This process resulted in 66 variables being extracted across 30 subjects undertaking 6 activities. 

The R script titled `run_analysis.R` is used to create the final dataset. It reads the source dataset created by UCI and transforms it by implementing the following steps:

1. Read the raw data and merge the training and test datasets
2. Extract estimates of the mean and standard deviation for each measurement
3. Apply descriptive activity names and variable names to the merged dataset
4. Estimate the average of each variable for each activity and subject
5. Write the data set to`FinalData.txt`

The script requires the `dplpyr` package to run successfully. The final dataset can be viewed in this repository as `FinalData.txt` or by running `View(FinalData)' in R following the completion of `run_analysis.R`.