#Code Book for Getting and Cleaning Data Final Project

###Data Source
*Link to Data: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
*Source Description of Dataset: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

*The data were obtained from experiments carried out with a group of 30 volunteers within an age bracket of 19-48 years.
Each person performed six activities:(WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing 
a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial 
linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to 
label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers 
was selected for generating the training data and 30% the test data. 

*The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in 
fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has 
gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and 
gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff 
frequency was used. From each window, a vector of features was obtained by calculating variables from the time and 
frequency domain. See 'features_info.txt' for more details. 

###Variables in Each Record
* Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration.
* Triaxial Angular velocity from the gyroscope. 
* A 561-feature vector with time and frequency domain variables. 
* Its activity label. 
* An identifier of the subject who carried out the experiment.

###Files in Dataset
* 'features_info.txt': Shows information about the variables used on the feature vector.

* 'features.txt': List of all features - contains the descriptive column names for X_train and X_test gyroscope/accelerometer readings

* 'activity_labels.txt': Links the class labels with their activity name.

* 'train/X_train.txt': Training set that contains gyroscope/accelerometer readings

* 'train/y_train.txt': Training labels (1-6 codes that correspond to the activity performed during each record in X_train.txt)

* 'test/X_test.txt': Test set that contains gyroscope/accelerometer readings

* 'test/y_test.txt': Test labels (1-6 codes that correspond to the activity performed during each record in X_test.txt)

The following files are available for the train and test data. Their descriptions are equivalent. 

- 'train/subject_train.txt': Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30. 

- 'train/Inertial Signals/total_acc_x_train.txt': The acceleration signal from the smartphone accelerometer X axis in standard gravity units 'g'. Every row shows a 128 element vector. The same description applies for the 'total_acc_x_train.txt' and 'total_acc_z_train.txt' files for the Y and Z axis. 

- 'train/Inertial Signals/body_acc_x_train.txt': The body acceleration signal obtained by subtracting the gravity from the total acceleration. 

- 'train/Inertial Signals/body_gyro_x_train.txt': The angular velocity vector measured by the gyroscope for each window sample. The units are radians/second. 

###Data Transformation Procedure
*1. Merge the training and the test sets to create one data set.
*2. Extract only the measurements on the mean and standard deviation for each measurement. 
*3. Use descriptive activity names to name the activities in the data set by replacing the codes in features.txt with the activities in activity_labels.txt
*4. Appropriately label the data set with descriptive variable names. 
*5. Create a second, independent tidy data set with the average of each variable for each activity and each subject.

###Implementation in run_analysis.R
*1. Load X_test.txt, X_train.txt, y_test.txt, y_train.txt, features.txt, and activity_labels.txt into R environment
*2. Get subsets of x_test, x_train, and features with only the measurements on the mean and standard deviation for each measurement.
*3. Create a character vector of descriptive activity names to name the activities in the data set. This vector will be built using ytest, ytrain, and activity_labels
*4. Label the x_test and x_train data sets with descriptive variable names. The xtest and xtrain sets are row bound (in that order!) and then the features dataset becomes the column names.
*5. Complete the merge of the test and training sets into one data frame by column binding the activity labels with the accel/gyro measurements
*6. Create a second, independent tidy data set with the average of each variable for each activity and each subject using the aggregate() function
*7. Write the new tidy data set to a file using write.table()