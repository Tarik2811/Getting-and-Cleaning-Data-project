** Getting and Cleaning Data Project **
 
## Source of Data  
Data Set information is located at the following link:http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones   
  
Source data path for this project is https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip  
  
  
## Attribute Information  
For each record in the dataset it is provided:   
- Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration.   
- Triaxial Angular velocity from the gyroscope.   
- A 561-feature vector with time and frequency domain variables.   
- Its activity label.   
- An identifier of the subject who carried out the experiment.  
  
Section 1. Merge training and the test data farmes by category (Activity, Features and Subject).  
*Set the source directory for the downloaded files  from project data source (UCI HAR Dataset)
*Read the files located in UCI HAR Dataset folder (subject_train.txt/subject_test.txt/x_train.txt/y_train.txt/x_test.txt / y_test.txt) and check
*Combine data frame by category
*Assign names  to each category of combined data 
*Gather all categries data sets in one data frame  

    
Section 2. Extract the needed measurement (mean and standard deviation for each measurement).   
*Extract data needed in one data frame.  

  
Section 3. Assign description names to activity names in data set  
Merge data subset with the activityType table to name appropriately activity names  
  
Section 4. Label the data set with descriptive activity names.  
Using gsub function to replace labels with their names in new data set.  
  
Section 5. Create an independent tidy data set with the average of each variable for each activity and each subject.   
Create and oiutput the tidy dat set as tidydata. txt file  
