

#download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip", "data.zip")
#unzip("data.zip")

#Load and tidy subject_test and subject_train
subject_test <- read.table("UCI HAR DATASET/test/subject_test.txt", header = FALSE, sep = '')
subject_train <- read.table("UCI HAR DATASET/train/subject_train.txt", header = FALSE, sep = '')
names(subject_test) <- "Subject"; names(subject_train) <- "Subject"
#subject_test$Subject <- as.factor(subject_test$Subject); subject_train$Subject <- as.factor(subject_train$Subject)

#Load and tidy y_test and y_train
y_test <- read.table("UCI HAR DATASET/test/y_test.txt", header = FALSE, sep = '')
y_train <- read.table("UCI HAR DATASET/train/y_train.txt", header = FALSE, sep = '')
activity_labels <- read.table("UCI HAR DATASET/activity_labels.txt", header = FALSE, sep = '')
activity_labels <- as.character( activity_labels$V2)
names(y_test) <- "Activity"; names(y_train) <- "Activity"
y_test$Activity <- as.factor(y_test$Activity); y_train$Activity <- as.factor(y_train$Activity)
levels(y_test$Activity) <- activity_labels; levels(y_train$Activity) <- activity_labels


#Load and tidy x_test and x_train
x_test <- read.table("UCI HAR DATASET/test/x_test.txt", header = FALSE, sep = '')
x_train <- read.table("UCI HAR DATASET/train/x_train.txt", header = FALSE, sep = '')
features <- read.table("UCI HAR DATASET/features.txt", header = FALSE, sep = '')
features <- as.character( features$V2 )
names(x_test) <- features; names(x_train) <- features

#Column bind subject, y, and x
test_set <- cbind(subject_test, y_test, x_test)
train_set <- cbind(subject_train, y_train, x_train)
#Row bind test and train
total_set <- rbind(test_set, train_set)

#Remove all measurement columns that aren't mean or std
measurements <- grep("mean|std", names(total_set), value = TRUE)
columns <- c('Subject', 'Activity', measurements)
total_set <- total_set[,columns]

#Average measurement columns by Subject and Activity
library(dplyr)
byactivitysubject <- group_by(total_set, Activity, Subject)
answer_set <- summarize_at( byactivitysubject, .funs = c("mean"), .cols = vars())
answer_set <- arrange(answer_set, Activity, Subject)

#Write answer set to file
#write.csv(answer_set, "answer_set.csv")
