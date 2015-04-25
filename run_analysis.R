setwd("~/Coursera/UCI HAR Dataset")
library(plyr)

#1 Merges training and test sets to create one data set
Training <- read.table("~/Coursera/UCI HAR Dataset/train/X_train.txt")
Test <- read.table("~/Coursera/UCI HAR Dataset/test/X_test.txt")
Data <- rbind(Training, Test)

Training_Labels <- read.table("~/Coursera/UCI HAR Dataset/train/Y_train.txt")
Test_Labels <- read.table("~/Coursera/UCI HAR Dataset/test/Y_test.txt")
Labels <- rbind(Training_Labels, Test_Labels)

Training_Subject <- read.table("~/Coursera/UCI HAR Dataset/train/subject_train.txt")
Test_Subject <- read.table("~/Coursera/UCI HAR Dataset/test/subject_test.txt")
Subject <- rbind(Training_Subject, Test_Subject)
names(Subject) <- "Subject"

#2 Extracts only the measurements on the mean and standard deviation for each measurement
Features <- read.table("~/Coursera/UCI HAR Dataset/features.txt")
MeanSTD_Ind <- grep("mean\\(\\)|std\\(\\)",Features[,2])
Data <- Data[, MeanSTD_Ind]

#3 Uses descriptive activity names to name the activities in the data set
Activity_Labels <- c("Walking","Walking Upstairs","Walking Downstairs","Sitting","Standing","Laying")
Labels <- Activity_Labels[Labels[,1]]

#4 Appropriately labels the data set with descriptive variable names
names(Data) <- Features[MeanSTD_Ind, 2]
names(Data) <- gsub("-mean\\(\\)", "Mean", names(Data))
names(Data) <- gsub("-std\\(\\)", "StdDev", names(Data))
names(Data) <- gsub("^t", "Time", names(Data))
names(Data) <- gsub("^f", "Frequency", names(Data))
names(Data) <- gsub("-", "", names(Data))

#5 From the data in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject
TidyData <- cbind(Subject,Activity = Labels,Data)
write.table(TidyData,"TidyData.txt",row.name=FALSE)
TidyData_Averages <- ddply(TidyData, .(Subject, Activity),function(x) colMeans(x[,3:68]))
names(TidyData_Averages)[-c(1,2)] <- paste0("Mean", names(TidyData_Averages)[-c(1,2)])

#Writes output text file
write.table(TidyData_Averages, "TidyData_Averages.txt",row.name=FALSE)
