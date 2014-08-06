#run_analysis.R performs the following actions on the 
#"Human Activity Recognition Using Smartphones Dataset":
#
#1. Merges the training and the test sets to create one data set.
#2. Extracts only the measurements on the mean and standard deviation for each measurement. 
#3. Uses descriptive activity names to name the activities in the data set
#4. Appropriately labels the data set with descriptive variable names. 
#5. Creates a second, independent tidy data set with the average of each variable for each activity and each subject.

#Load the data (set the working directory to the parent of the UCI HAR Dataset directory)
#X_test and X_train contain normailized accelerometer/gyroscope readings
xtest <- read.table("./UCI HAR Dataset/test/X_test.txt")
xtrain <- read.table("./UCI HAR Dataset/train/X_train.txt")
#y_test and y_train contain the activity codes that correspond with accel./gyro readings
ytest <- read.table("./UCI HAR Dataset/test/y_test.txt")
ytrain <- read.table("./UCI HAR Dataset/train/y_train.txt")
#second col. of features contains the descriptive column names for X_train and X_test
features <- read.table("./UCI HAR Dataset/features.txt")[,2]
#second col. of activity_labels has the activities corresponding to the codes in y_test and y_train
activity_labels <- read.table("./UCI HAR Dataset/activity_labels.txt")[,2]

#check dimensions/lengths to gain intuition about how things should fit together
dim(xtest)
dim(ytest)
dim(xtrain)
dim(ytrain)
length(features)
length(activity_labels)

#2. Extract subset of only the measurements on the mean and standard deviation for each measurement. 
################################################################################################
#Make a vector of logical values with TRUE in the indices of the features data that contain "mean" or "std"
subset_indices <- grepl("std|mean", features)
#Now create variables to hold the subsets of xtrain, xtest, and features that are mean/sd measurements
xtest_sub <- xtest[,subset_indices]
xtrain_sub <- xtrain[,subset_indices]
features_sub <- features[subset_indices]


#3. Create a character vector of descriptive activity names to name the activities in the data set
#  This vector will be built using ytest, ytrain, and activity_labels, and then later will be bound
#  to xtest and xtrain to create one complete data set
###############################################################################################
activityLabels <- c(as.character(activity_labels[ytest[[1]]]), as.character(activity_labels[ytrain[[1]]]))


#4. Appropriately label the xtest and xtrain data sets with descriptive variable names.
#  First the xtest and xtrain sets are row bound (in that order!), and then the features dataset
#  is used to add the descriptive column names
###############################################################################################
combined_x <- rbind(xtest_sub,xtrain_sub)
colnames(combined_x) <- features_sub


#1. Complete the merge of the test and training sets into one data frame by column binding the 
#  activity labels with the accel/gyro measurements
###############################################################################################
combined_data <- cbind(activityLabels, combined_x)


#5. Create a second, independent tidy data set with the average of each variable for each 
#  activity and each subject.
###############################################################################################
#The aggregate function can split the data into subsets and compute a summary statistic for each
tidy_data <- aggregate(.~activityLabels,combined_data, mean)

#Write the new tidy data set to a file
write.table(tidy_data, "tidy_data.txt")
