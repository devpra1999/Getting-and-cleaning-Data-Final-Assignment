# Codebook

## 1. The repository has the following files:

- 'README.md': Description of the project and scripts

- 'Loading Data Set.R': Script to download and zip the dataset

- 'UCI HAR Dataset': Files in the dataset are listed below in section 2.2

- 'run_analysis.R': Integrated script to create the final tidy dataset from scratch

### 2.1. The following variables were created/updated:

- 'Subject_ID': (type = integer) Created new variable indicating the subject using the subject_combined.txt file(Section 2.2)

- 'Activity': (type = character)Created new variable to identify the activity, using activity_labels.txt(linking numbers 1-6 to different activities) and y_combined.txt(containing numbers indicating activity of each record in X_combinde.txt) 

### 2.2. The UCI HAR Dataset includes the following files:

- 'README.txt'

- 'features_info.txt': Shows information about the variables used on the feature vector.

- 'features.txt': List of all features.

- 'activity_labels.txt': Links the class labels with their activity name.

- 'train/X_train.txt': Training set.

- 'train/y_train.txt': Training labels.

- 'test/X_test.txt': Test set.

- 'test/y_test.txt': Test labels.

- 'train/X_combined.txt': Merged set(with train set appended to test set)

- 'train/y_combined.txt': Merged labels(with train labels appended to test labels)

- 'Data Cleaning.R': Script to remove leading and extra whitespaces from all the data files

- 'Merging Datasets.R': Script to merge train and test data files into a new combined file stored separately in the combined folder

- 'Extracting Modifying and Labeling.R': Script to select the mean and std containing variables from the features.txt file, remove special characters from their names and extract the columns from X_combined.txt; create dataset.txt in combined folder with added Subject_ID and Activity columns.

- 'Creating Tidy Dataset.R': Script to create a new tidy dataset with the measurement values(of mean and std variables) avereged for each subject and activity grouping.

- 'combined/dataset.txt': Dataset created by Extracting Modifying and Labeling.R, has multiple records for each subject and activity grouping

- 'combined/final dataset.txt': Tidy data file created by Creating Tidy Dataset.R


The following files are available for the train, test and combined data. The descriptions of test, train and combined are equivalent with combined being the merged data file of test and train

- 'train/subject_train.txt': Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30. 

- 'train/Inertial Signals/total_acc_x_train.txt': The acceleration signal from the smartphone accelerometer X axis in standard gravity units 'g'. Every row shows a 128 element vector. The same description applies for the 'total_acc_x_train.txt' and 'total_acc_z_train.txt' files for the Y and Z axis. 

- 'train/Inertial Signals/body_acc_x_train.txt': The body acceleration signal obtained by subtracting the gravity from the total acceleration. 

- 'train/Inertial Signals/body_gyro_x_train.txt': The angular velocity vector measured by the gyroscope for each window sample. The units are radians/second. 
