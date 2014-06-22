############################## Part 1 ##############################################

## Step 1: Read in training data set from three files, combine into useful data frame.
## Read in activity names and features. Data unzipped to directory "UCI HAR Dataset"
activity <- read.table("UCI HAR Dataset/activity_labels.txt", header=FALSE, colClasses="character")
feature <- read.table("UCI HAR Dataset/features.txt", header=FALSE, colClasses="character")

## Change feature formatting
feature[,2] <- gsub("-", "_", feature[,2])
feature[,2] <- gsub("\\(\\)", "", feature[,2])


## read in training set
subject_train <- read.table("UCI HAR Dataset/train/subject_train.txt", header=FALSE, colClasses="numeric")
y_train <- read.table("UCI HAR Dataset/train/y_train.txt", header=FALSE, colClasses="factor")
x_train <- read.table("UCI HAR Dataset/train/X_train.txt", col.names=feature[,2], colClasses="numeric") ## col names from feauture

## rename levels of train_y with descriptive labels from second column of activity_labels.txt
levels(y_train[,1]) <- activity[,2]

## combine three training reads into one dataframe
train_set <- cbind(subject_train, y_train, x_train)
names(train_set)[1:2] <- c("subject", "activity")

## Step 2: Read in test data set from three files, combine into useful data frame.
## Data unzipped to directory "UCI HAR Dataset"

## read in test set
subject_test <- read.table("UCI HAR Dataset/test/subject_test.txt", header=FALSE, colClasses="numeric")
y_test <- read.table("UCI HAR Dataset/test/y_test.txt", header=FALSE, colClasses="factor")
x_test <- read.table("UCI HAR Dataset/test/X_test.txt", col.names=feature[,2], colClasses="numeric") ## col names from feauture

## rename levels of train_y with descriptive labels from second column of activity_labels.txt
levels(y_test[,1]) <- activity[,2]

## combine three test reads into one dataframe
test_set <- cbind(subject_test, y_test, x_test)
names(test_set)[1:2] <- c("subject", "activity")

## Combine train and test data sets into one
train_test <- rbind(train_set, test_set)

############################## Part 2 ##############################################
## Instructions: Extracts only the measurements on the mean and standard deviation for each measurement. 

## create logical vector for column sorting
logical <- c(grepl(("_mean_"),colnames(train_test)) | grepl(("_std_"),colnames(train_test)))
## subset using logical vector, then add back subject and activity
train_test_cleaned <- cbind(train_test[,1:2], train_test[,logical])


############################## Part 3 ##############################################
## Instructions: Creates a second, independent tidy data set with the average of each
## variable for each activity and each subject. Write it to a txt file for submission.

## use reshape2 package for data manipulation
library(reshape2)

## melt the data frame to long form, using subject & activity as id columns
train_test_melted <- melt(train_test_cleaned, id.vars=c("subject", "activity"))
## dcast using mean of each subject/activity
train_test_reshaped <- dcast(train_test_melted, subject + activity ~ variable, mean)

## Write reshaped data to txt file for submission
write.csv(train_test_reshaped, file="tidy_dataset.txt", row.names=FALSE)
