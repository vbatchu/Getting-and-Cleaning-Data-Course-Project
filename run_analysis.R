# Couresera John Hopkins University
# Getting and cleaning data Course Project
# 04/24/2015

# 1) Merges the training and the test sets to create one data set.
# 2) Extracts only the measurements on the mean and standard deviation for each measurement. 
# 3) Uses descriptive activity names to name the activities in the data set
# 4) Appropriately labels the data set with descriptive variable names. 
# 5) From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

library(plyr)
# Read training datasets

x_train<-read.table("./UCI HAR Dataset/train/X_train.txt")
y_train<-read.table("./UCI HAR Dataset/train/y_train.txt")
subject_train<-read.table("./UCI HAR Dataset/train/subject_train.txt")

# Read test datasets 

x_test <-read.table("./UCI HAR Dataset/test/X_test.txt")
y_test <-read.table("./UCI HAR Dataset/test/y_test.txt")
subject_test <-read.table("./UCI HAR Dataset/test/subject_test.txt")

# 1) merge training and test datasets
x_data <- rbind(x_train,x_test)
y_data <- rbind(y_train, y_test)
subject_data <-rbind(subject_train, subject_test)

# 2) Extracts only the measurements on the mean and standard deviation for each measurement. 

features<- read.table("./UCI HAR Dataset/features.txt")

get_req_features <- grep("(mean\\(\\)|std\\(\\))", features[,2])

# select the required columns

x_data_filtered <- x_data[,get_req_features]

# 3) Uses descriptive activity names to name the activities in the data set

activities <- read.table("./UCI HAR Dataset/activity_labels.txt")
#Update activity codes in the dataset with description 
y_data[,1] <- activities[y_data[,1],2]
names(y_data) <- "activity"
# 4) Appropriately labels the data set with descriptive variable names. 
names(x_data_filtered) <- features[get_req_features,2]
names(subject_data) <- "subject"

combined_data <- cbind(subject_data,y_data,x_data_filtered)

# 5) From the data set in step 4, creates a second, independent tidy data 
#    set with the average of each variable for each activity and each subject.

tidy_data <- ddply(combined_data, .(subject,activity), function(x) colMeans(x[,3:68]))

write.table(tidy_data,"./UCI HAR Dataset/tidy_data.txt", row.names=FALSE)
