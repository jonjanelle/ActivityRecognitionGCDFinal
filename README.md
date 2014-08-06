# Final Project Submission - Getting and Cleaning Data
====================================================
### run_analysis.R performs the following actions on the 
### "Human Activity Recognition Using Smartphones Dataset":

* 1. Merges the training and the test sets to create one data set.
* 2. Extracts only the measurements on the mean and standard deviation for each measurement. 
* 3. Uses descriptive activity names to name the activities in the data set
* 4. Appropriately labels the data set with descriptive variable names. 
* 5. Creates a second, independent tidy data set with the average of each variable for each activity and each subject.

Please note that the script performs these actions in the order 2,3,4,1,5. Please see the comments in CodeBook.md and run_analysis.R for more
details about these actions. 

### Running the Script
* 1. Open the file run_analysis.R in R/RStudio
* 2. Copy run_analysis.R to the parent directory of "UCI HAR Dataset" and change your working directory to that location using setwd()
* 3. Run the script by typing source("run_analysis.R")
* 4. The tidy dataset will be output to a file called "tidy_data.txt" in your current working directory.

### Libraries Required
* This script requires no packages beyond those that are loaded by default in R/RStudio

