## Input Data Files
Below uncompressed files must be available in the path './UCI HAR Dataset'

* features.txt
* activity_labels.txt

Below uncompressed files must be available in the path './UCI HAR Dataset/train'

* subject_train.txt
* x_train.txt
* y_train.txt

Below uncompressed files must be available in the path './UCI HAR Dataset/test'

* subject_test.txt
* x_test.txt
* y_test.txt

## Variables

* x_train, y_train, x_test, y_test, subject_train and subject_test contain the input data from data source.
* training and test data is merged into x_data, y_data and subject_data variables.
* features contains the correct names for the x_data dataset, which are applied to the column names stored in get_req_features, a numeric vector used to extract the required data.
* A similar approach is taken with activity names through the activities variable.
* combined_data merges x_data, y_data and subject_data.
* ddply() from the plyr package is used to apply colMeans().
* tidy_data contains the averages means and standard deviations which will be later stored in a .txt file.

## Tranformations and work performed

The script run_analysis.R performs the 5 steps described in the course project's definition.

* First, the similar data from train and test is merged using the rbind() function. 
* By similar files mean files that have  same number of columns and same column names.
* Subset the data taking columns that correspond to the mean and standard deviation measures from the dataset.
* Assaign names to these columns from features.txt.
* Replace activity IDs 1:6 in y_data with activity names from activity_labels.txt.
* Assagn appropriate names to columns in y_data and subject_data.
* Finally,  generate a new dataset with all the average measures for each subject and activity type (30 subjects * 6 activities = 180 rows). 
* The clean data file is called tidy_data.txt, and uploaded to this repository.
