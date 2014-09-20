+++++++++++++++++++++
Codebook for Getting and Cleaning Data Course Project
+++++++++++++++++++++

The output dataset is contained in a single file "activities_of_daily_living_means.txt" with 180 observations and 81 variables.

The first row of values in the file is the variable names, so make sure you have "header = TRUE" when reading in data.

Variables 1 and 2 are the subject and activity, respectively.

For variables 3:81, I quote (sic) from the original dataset's' features_info.txt: "The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 

These signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.""

Variables 3:81 in "activities_of_daily_living_means.txt" are a subset of the original variable set, including only the estimates of standarad deviation (SD) and mean. For each of these variables, originally there was a set of values per variable for each acitivty per subject. This dataset collapses that set of values to just the *mean* data for each subject doing at each level of activity. .

The variables are as follows:
"subject" ## 30, each number representing 1 subject 
"activity" ## 6, in english, representing a different level of activity
"tBodyAccMeanX" ## Mean of body acceleration mean x axis for given subject and activity
"tBodyAccMeanY" ## Mean of body acceleration mean y axis for given subject and activity
etc
