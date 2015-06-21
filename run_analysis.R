## run_analysis.R -- Create a tidy data set from the Human Activity Recognition (HAR) raw data set
library(dplyr)
## Read in raw files

## Activity datafeatures
activity_labels <- read.table(file = "UCI HAR Dataset//activity_labels.txt", col.names = c("Activity.ID", "Activity.Description"))

## Features
features <- read.table(file = "UCI HAR Dataset/features.txt")
#Regularize feature titles. Use period as default separator, step 4 is the first step!
features[,2] <- gsub("\\()", "", features[,2])
features[,2] <- gsub("\\(,", "", features[,2]) #one case, probably a typo
features[,2] <- gsub("\\(", ".", features[,2])
features[,2] <- gsub("\\)", ".", features[,2])
features[,2] <- gsub("-", ".", features[,2])
features[,2] <- gsub(",", ".", features[,2])
features[,2] <- gsub("\\.$", "", features[,2])
features[,2] <- gsub("BodyBody", "Body", features[,2])
features[,2] <- gsub("^t", "time.", features[,2])
features[,2] <- gsub("^f", "freq.", features[,2])
features[,2] <- gsub("tBody", "time.Body", features[,2])
features[,2] <- gsub("gravityMean", "gravity.mean", features[,2])

## test data
subject_test_raw <- read.table(file = "UCI HAR Dataset//test/subject_test.txt",
                               col.names = c("Subject.ID"),
                               colClasses = c("factor"))


x_test_raw <- read.table(file = "UCI HAR Dataset/test/X_test.txt",
                         col.names = features[,2]) #Columns are activities
y_test_raw <- read.table(file = "UCI HAR Dataset/test/y_test.txt",
                         col.names = c("Activity.ID"))
x_test_raw <- cbind(subject_test_raw, x_test_raw)

merge_test_raw <- cbind(x_test_raw, y_test_raw)
merge_test_raw$Input.Set= "Test" #Capture the input set as a variable before merging

## training data

subject_train_raw <- read.table(file = "UCI HAR Dataset/train/subject_train.txt",
                                col.names = c("Subject.ID"),
                                colClasses = c("factor"))

x_train_raw <- read.table(file = "UCI HAR Dataset//train/X_train.txt",
                          col.names = features[,2])
y_train_raw <- read.table(file = "UCI HAR Dataset//train/y_train.txt",
                          col.names = c("Activity.ID"))
x_train_raw <- cbind(subject_train_raw, x_train_raw)
merge_train_raw <- cbind(x_train_raw, y_train_raw)
merge_train_raw$Input.Set = "Training" #Capture the input set as a variable before merging

merge_data <- rbind(merge_test_raw, merge_train_raw) #Step 1 satisfied!
merge_data_df <- tbl_df(merge_data)

# Use dplyr merge() to add activity descriptions to merged data
merge_data_df <- merge(merge_data_df, activity_labels) #Step 3 satisfied
means_and_std <- select(merge_data_df,
                        Subject.ID,
                        Activity.ID,                   
                        Activity.Description,
                        contains("mean"), 
                        contains("std")
                    ) #Step 2 satisfied

by_activity_and_subject <- group_by(means_and_std, Subject.ID, Activity.ID, Activity.Description)
final_tidy_set <- by_activity_and_subject %>% summarise_each(funs(mean)) 
write.table(final_tidy_set, file = "aggregated_tidy_means.txt", sep="\t") #Step 6
