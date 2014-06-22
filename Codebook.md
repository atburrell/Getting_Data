CodeBook
========================================================

This codebook describes variables used in the run_analysis.R script included in this repository.

## Source Data

Data has been selected by Coursera for this training project and a copy has been stored for use at 

 https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

The unzipped contents include data sets and a read me which describes the included material as follows:

- 'features_info.txt': Shows information about the variables used on the feature vector.
- 'features.txt': List of all features.
- 'activity_labels.txt': Links the class labels with their activity name.
- 'train/X_train.txt': Training set.
- 'train/y_train.txt': Training labels.
- 'test/X_test.txt': Test set.
- 'test/y_test.txt': Test labels.

## Script Variables

Variables used in the script are listed below:

- activity: activity names read from activity_labels.txt
- feature: feature names read from reatures.txt
- x_train/x_test: subject data read from x_train.txt or x_test.txt
- y_train/y_test: activity factors read from y_train.txt or y_test.txt
- subject_train/subject_test: subject labels read from subject_train.txt or subject_test.txt
- train_set: data frame combining training subject label, activity name and measurement data
- test_set: data frame combining test subject label, activity name and measurement data
- train_test: master data frame combining all measurement data and labels from train_set and test_set
- logical: vector to sort data frame for mean measurements and standard deviations
- train_test_cleaned: data frame subsetted by the logical vector for only mean measurements and standard deviations
- train_test_melted: data frame from cleaned data converted to long form
- train_test_reshaped: data frame containing only the mean for each subject/activity recast from train_test_melted