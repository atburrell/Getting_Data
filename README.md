Getting_Data
============

## Getting and Cleaning Data Course Project

This repository includes an R script for importing and cleaning a data set collected from the accelerometers from the Samsung Galaxy S smartphone. The data was selected by Coursera for the Getting and Cleaning Data course and is described and provided in the following links:

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

Instructions for this particular project are listed below:

You should create one R script called run_analysis.R that does the following. 
- Merges the training and the test sets to create one data set.
- Extracts only the measurements on the mean and standard deviation for each measurement. 
- Uses descriptive activity names to name the activities in the data set
- Appropriately labels the data set with descriptive variable names. 
- Creates a second, independent tidy data set with the average of each variable for each activity and each subject.

## Script Description Part 1

The included script run_analysis.R is broken into four sections according to the instructed goals. The first section marked as Part 1 includes code to read the training and testing data before combining it into a complete data frame for use. Each set is broken into three files (X, Y and subject) and variable descriptions are contained in a second set of two files (activity and feature). For each set, the following actions are performed:

- activity and feature names are stored for use, where feature format is cleaned for easier reading
- subject data is read in as numeric
- y data is read in as factors, where factors are replaced by activity names
- x data is read in as numeric, with column names taken from the feature file
- all three data frames are combined using cbind, new data set  includes subject, activity, and measurements

This is repeated for both training and test sets. These are combined using rbind to generate a master data set that contains all training and test data.

## Script Description Part 2

Part 2 of the R script subsets for only mean and standard deviation measurements. This is accomplished by generating a logical vector using grepl to search for relevant column names, and then using that vector to parse the master data set.

## Script Description Part 3

Part 3 simplifies the cleaned data set so that the final data set includes only the average measurement for the average of each variable for each activity and each subject. This final data set is written to a txt file "tidy_dataset.txt" for submission. This section uses the R package reshape2 for the melt and dcast functions. The data is first melted into long form by subject and activity. When converted back to wide form using dcast, the mean for each subject/activity are stored in the finished dataframe. It is written to file in the working directory.