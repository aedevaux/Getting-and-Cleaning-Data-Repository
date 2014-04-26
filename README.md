Read Me File for 
Getting and Cleaning Data by Coursera
========================================================

This repository was created for the Coursera "Getting and Cleaning Data" course.

A description of the data set can be found here: 
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+UsingSmartphones 

Data found here:
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

This R-script: 
- Merges the training and the test sets to create one data set.
- Extracts only the measurements on the mean and standard deviation for each measurement. 
- Uses descriptive activity names to name the activities in the data set
- Appropriately labels the data set with descriptive activity names. 
- Creates a second, independent tidy data set with the average of each variable for each activity and each subject. 

The resultant files are:
Data = 10299 observations of 563 variables a combination of the training and testing data sets.
tidy_Data = 10299 observations of 68 variables which are either the means or standard deviations from the original 563.
tidy_final = the means of the means and standard deviations by subject and activity.
