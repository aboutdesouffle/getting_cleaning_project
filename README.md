===================================
###Getting and cleaning data course project, Sept 2014
===================================

This script reads, cleans and performs a brief analysis on a dataset from from an experiment (Reyes-Ortiz et al. 2012) using smart-phone equiped accelerometers to track the movement of 30 subjects peforming their "activites of daily living" (ADL).

The dataset was accessed at the  [UCI Machine Learning Repository](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones) on 19-Sept-2014.

This readme provides a short walkthrough of the script procedure.

####The Data

The original dataset is split arbitrarily into two subject groups, "test" and "train", each with its own directory and seperate set of data files. 

x_test and x_train contain a set of variables (cf. the features_info.txt for more information on the specifics of each variable) based on the smart-phone recording apparatuses, y_test and y_train contain the "ADL code" variable (1-6, see activity_labels.txt), and the subject_test and subject_train contain the subject code variable (1-30, for each subject).

Note: Both subject group directorys contains a sub-directory of raw inertial signals. These are unused in this project.

####Reading and Cleaning

The script begins by reading in and combining the data with read.table, base R subsetting and rbind.

ADL codes are then transformed to english and the variables are assigned names based on the features list included with the data.

The data is then subset to only include mean and standard deviation values. The remaining variables have their column names tidyed (easier to read, puncuation removed).

####Analysis

The script then uses to dplyr to take the mean of each variable by subject and activity class.

####Output

The dataset produced from this analysis is then written out to a text document.