# Getting-and-Cleaning-Data-Course-Project
This readme file describes the script run_analysis.R.
The data used comes from https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip.
After downloading and uncompressing the files, make sure that you have a folder Coursera in your working directory, and then place the zipped files in a folder called UCI HAR Dataset within Coursera.
This script will output two files: 1. A tidy data set, but before the averages are taken ("TidyData.txt"). 2. A tidy data set with the averages ("TidyData_Averages.txt").
The codebook describes the data, the variables, and the transformations I took to clean up the data.

The code first merges the two data sets training and test. Then only the data concerning means and standard deviation is kept. Then I clean up the activity and variable names. Finally I create a tidy data set with the averages for subject and activity.
