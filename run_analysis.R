## Libraries ##
library(dplyr)

## Set working directory in the UCI Dataset folder ##
mydir <- getwd()
setwd(paste(mydir,"/UCI_HAR_Dataset", sep =""))

## Read tables ##
# Test data
x_test <- read.table("test/X_test.txt", header = FALSE)
y_test <- read.table("test/y_test.txt", header = FALSE)
subject_test <- read.table("test/subject_test.txt", header = FALSE)

# Training data
x_train <- read.table("train/X_train.txt", header = FALSE)
y_train <- read.table("train/y_train.txt", header = FALSE)
subject_train <- read.table("train/subject_train.txt", header = FALSE)

# Column names
features <- read.table("features.txt", header = FALSE)

# Activity labels
activity_labels <- read.table("activity_labels.txt", header = FALSE)

## Name variables of test and training sets from features.txt ##
names(x_test) <- names(x_train) <- features[,2]

## Name the subject and activity columns ##
names(subject_test) <- names(subject_train) <- "subject"
names(y_test) <- names(y_train) <- "activity"

## Column bind subject and y(labels) tables to x(set) table  ##
test_df <- cbind(subject_test, y_test, x_test)

train_df <- cbind(subject_train, y_train, x_train)

### REQUIREMENT 1: Merges the training and the test sets to create one data set ###
## rbind() to merge train rows to test rows ##
merged_df <- rbind(test_df, train_df)

### REQUIREMENT 2: Extract only the measurements on the mean and standard deviation for each measurement.
## use grep with regex epxpression to match all columns ending in mean() or std()
## (only considered variables endind in () to be actual means and standard deviations) ##
mean_std <- grep("mean\\(\\)|std\\(\\)|activity|subject",names(merged_df),value = TRUE)

filtered_df <- select(merged_df, all_of(mean_std))

### REQUIREMENT 3: Use descriptive activity names to name the activities in the data set ###
## lookup included activity labels
filtered_df <- mutate(filtered_df, activity = activity_labels[,2][filtered_df$activity])

### REQUIREMENT 4: Appropriately label data set with descriptive variable names ###
## use sub() and gsub() to make abbreviations more descriptive, using the information from features_info.txt
names(filtered_df) <- gsub("\\(\\)", "",names(filtered_df))
names(filtered_df) <- gsub("-", ".", names(filtered_df))
names(filtered_df) <- sub("^t", "time", names(filtered_df))
names(filtered_df) <- sub("^f", "frequency", names(filtered_df))
names(filtered_df) <- sub("std", "standardDev", names(filtered_df))
names(filtered_df) <- sub("Acc", "Acceleration", names(filtered_df))
names(filtered_df) <- sub("Gyro", "Gyroscope", names(filtered_df)) 
names(filtered_df) <- sub("Mag", "Magnitude", names(filtered_df)) 

### REQUIREMENT 5: From the data set in step 4, create a second, independent tidy data set with the average of each variable for each activity and each subject ###
## group by subject and activity and then apply mean to all columns
## finally write final tidy data set to a text file
tidy_df <- filtered_df %>% group_by(subject, activity) %>% summarise_all(mean)

write.table(tidy_df, "tidy_data.txt", row.names = FALSE)