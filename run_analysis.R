## downloading data
if(!file.exists("data")){
      dir.create("data")
}
download.file(url = "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip", destfile = "data/data.zip")

## unzip the ./data/data.zip
unzip(zipfile="./data/data.zip",exdir="./data")
path <- "./data/UCI HAR Dataset"

## Reading data
test_activity  <- read.table(paste0(path, "/test/y_test.txt"), header = F)
train_activity <- read.table(paste0(path, "/train/y_train.txt"), header = F)

test_subject <- read.table(paste0(path, "/test/subject_test.txt"), header = F)
train_subject  <- read.table(paste0(path, "/train/subject_train.txt"), header = F)

test_features  <- read.table(paste0(path, "/test/X_test.txt"), header = F)
train_features <- read.table(paste0(path, "/train/X_train.txt"), header = F)

features_names <- read.table(paste0(path, "/features.txt"), header=F)

## Merging obtained data
activity <- rbind(test_activity, train_activity); names(activity) <- "activity"
subject <- rbind(test_subject, train_subject); names(subject) <- "subject"
features <- rbind(test_features, train_features)
names(features) <- features_names$V2

## Preparing data frame
df <- cbind(features, subject, activity)

## removing temporal variables
rm(list = ls()[-which(ls() == "df")])

## extracting the measurements on the mean and standard deviation
df1 <- df[, grep(pattern = "mean\\(\\)|std\\(\\)|subject|activity", names(df), value = T)]

## descriptive activity names to name the activities in the data set
activity_names  <- read.table("./data/UCI HAR Dataset/activity_labels.txt", header = F)
df1$activity <- factor(df1$activity, labels = activity_names$V2)
df1$subject <- as.factor(df1$subject)

## Appropriately labels the data set with descriptive variable names.
names(df1) <- gsub("^t", "Time", names(df1))
names(df1) <- gsub("^f", "Frequency", names(df1))
names(df1) <- gsub("Acc", "Accelerometer", names(df1))
names(df1) <- gsub("Gyro", "Gyroscope", names(df1))
names(df1) <- gsub("Mag", "Magnitude", names(df1))
names(df1) <- gsub("BodyBody", "Body", names(df1))
names(df1) <- gsub("-mean\\(\\)", "Mean", names(df1))
names(df1) <- gsub("-std\\(\\)", "StandardDeviation", names(df1))

## creating an independent tidy data set with the average of each variable for each activity and each subject
aver <- aggregate(. ~ activity + subject, data = df1, mean)
write.table(x = aver, file = "tidydata.txt", row.name=F)
