## This script reads, cleans and analyzes data from an experiment (Reyes-Ortiz et al. 2012) using smart-phone equiped accelerometers to track the movement of 30 subjects peforming their "activites of daily living".
## The dataset can be accessed http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

## Load required libraries

library(plyr)
library(dplyr)
library(tidyr)

## Read and clean:
## Read in data and labels

activity_labels <- read.table("UCI HAR Dataset/activity_labels.txt")
feature_labels <- read.table("UCI HAR Dataset/features.txt", colClasses = c("NULL", "character"))

X_test <- read.table("UCI HAR Dataset/test/X_test.txt")
Y_test <- read.table("UCI HAR Dataset/test/Y_test.txt")
subject_test <- read.table("UCI HAR Dataset/test/subject_test.txt")

X_train <- read.table("UCI HAR Dataset/train/X_train.txt")
Y_train <- read.table("UCI HAR Dataset/train/Y_train.txt")
subject_train <- read.table("UCI HAR Dataset/train/subject_train.txt")

## Transform activity codes to descriptive name and add subject and activity variables for both data sets

activity_labels_test <- join(Y_test, activity_labels)
X_test$activity <- activity_labels_test[,2]
X_test$subject <- subject_test[,1]

activity_labels_train <- join(Y_train, activity_labels)
X_train$activity <- activity_labels_train[,2]
X_train$subject <- subject_train[,1]

## Merge test and training data

dataset <- rbind(X_test, X_train)

## Label variables

names(dataset) <- c(feature_labels[,1], "activity", "subject")

## Extract only mean, standard deviation, activity and subject variables

dataset <- dataset[,c(grep("mean()|std()", x = names(dataset), value = TRUE), "activity", "subject")]

## Tidy variable names

names(dataset) <- gsub("[[:punct:]]", "", names(dataset))
names(dataset) <- gsub("mean", "Mean", names(dataset))
names(dataset) <- gsub("std", "SD", names(dataset))

## Analysis:
## Create a new data set with the average of each variable for each activity and each subject

datatbl <- tbl_df(dataset)
datatbl %>%
	group_by(subject, activity) %>%
        summarise_each(funs(mean)) %>%
        arrange(subject) -> datatbl

## Output:
## Write tidy data to file

write.table(datatbl, file = "activities_of_daily_living_means.txt", row.name=FALSE)