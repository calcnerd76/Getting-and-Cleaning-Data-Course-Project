# Getting-and-Cleaning-Data-Course-Project
This readme file describes the script run_analysis.R.
The data used comes from https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip.
After downloading and uncompressing the files, make sure that you have a folder Coursera in your working directory, and then place the zipped files in a folder called UCI HAR Dataset within Coursera.
This script will output two files: 1. A tidy data set, but before the averages are taken ("TidyData.txt"). 2. A tidy data set with the averages ("TidyData_Averages.txt").
The codebook describes the variables of the data.

1. The code first merges the two data sets training and test.
X_train.txt and X_test.txt are read into the variables Training and Test respectively and then merged to the variable Data.
Y_train.txt and Y_test.txt are read into the variables Training_Labels and Test_Labels respectively and then merged to the variable Labels.
subject_train.txt and subject_test.txt are read into the variables Training_Subject and Test_Subject respectively and then merged to the variable Subject. I then change the names of Subject to "Subject".

2. Then only the data concerning means and standard deviation is kept. 
I read the features.txt file into the variable Features.
Then I use the grep function to find all the instances where either "mean()" or "std()" occurs, and store these indices to MeanSTD_Ind. I then update the Data variable to only have that particular subset.

3. Then I clean up to activity names.
I put the six activity labels into the variable Activity_Labels. Then I update the Labels table to have the proper activity labels.

4. Then I clean up the variable names.
I first give them the names from the feature file. Then I change "mean()" to Mean, "std()" to "StdDev". I also change any name beginning with a t to Time and any name beginning with a f to Frequency. Finally I remove the "-"s. 

5. Finally I create a tidy data set with the averages for subject and activity.
First I make a TidyData variable before taking the averages. Then I write that to a "Tidydata.txt" file. Then I make a TidyData_Averages variable by using the ddply function to take the mean of the columns over Subject and Activity. Then I add the word "Mean" to each of the variable names since these are now means. Lastly, I write this to the file "TidyData_Averages.txt".
