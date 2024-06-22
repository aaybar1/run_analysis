#Create directory
if(!dir.exists("data")){dir.create("data")}

#Define URL where to obtain the file
fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"

#Define destination
dest_file <- "./data/get_projectfiles.zip"

#Download the file
download.file(fileUrl, dest_file)

#Define directory to unzip the content
unzip_dir <- "./data"

#Unzip content
unzip(dest_file, exdir = unzip_dir)

#Confirm extraction
list.files(unzip_dir)

#Confirm date downloaded
dateDownloaded <- date
dateDownloaded

#Load dplyr
library(dplyr)

#Load features and activity labels
features <- read.table("./data/UCI HAR Dataset/features.txt", sep="", header=FALSE)
activity_labels <- read.table("./data/UCI HAR Dataset/activity_labels.txt", sep="", header=FALSE)

#Load test data and create test dataset
X_test <- read.table("./data/UCI HAR Dataset/test/X_test.txt", sep="", header = FALSE)
Y_test <- read.table("./data/UCI HAR Dataset/test/Y_test.txt", sep="", header = FALSE)
subject_test <- read.table("./data/UCI HAR Dataset/test/subject_test.txt", sep="", header = FALSE)
Test <- data.frame(subject_test, Y_test, X_test)

#Load train data and create train data set
X_train <- read.table("./data/UCI HAR Dataset/train/X_train.txt", sep="", header = FALSE)
Y_train <- read.table("./data/UCI HAR Dataset/train/Y_train.txt", sep="", header = FALSE)
subject_train <- read.table("./data/UCI HAR Dataset/train/subject_train.txt", sep="", header = FALSE)
Train <- data.frame(subject_train, Y_train, X_train)

# 1 - Merge test and train sets to create one data set
merged <- rbind(Train, Test)

#Assign column names
names(merged) <- c("subject", "activity", as.character(features$V2))

# 2 - Extract only the measurements on the mean and standard deviation for each measurement
tidy_1 <- merged %>% select(subject, activity, contains("mean"), contains("std"))

# 3 - Use descriptive activity names to name the activities in the data set
tidy_1$activity <- factor(tidy_1$activity, levels = activity_labels$V1, labels = activity_labels$V2)

# 4 - Appropriately labels the data set with descriptive variable names
names(tidy_1) <- gsub("^t", "Time", names(tidy_1))
names(tidy_1) <- gsub("^f", "Frequency", names(tidy_1))
names(tidy_1) <- gsub("Acc", "Accelerometer", names(tidy_1))
names(tidy_1) <- gsub("Gyro", "Gyroscope", names(tidy_1))
names(tidy_1) <- gsub("Mag", "Magnitude", names(tidy_1))
names(tidy_1) <- gsub("BodyBody", "Body", names(tidy_1))
names(tidy_1) <- gsub("-mean\\(\\)", "Mean", names(tidy_1), ignore.case = TRUE)
names(tidy_1) <- gsub("-std\\(\\)", "STD", names(tidy_1), ignore.case = TRUE)
names(tidy_1) <- gsub("-freq\\(\\)", "Frequency", names(tidy_1), ignore.case = TRUE)
names(tidy_1) <- gsub("angle", "Angle", names(tidy_1))
names(tidy_1) <- gsub("gravity", "Gravity", names(tidy_1))

# Remove any remaining special characters
names(tidy_1) <- gsub("\\(\\)", "", names(tidy_1))
names(tidy_1) <- gsub("-", "", names(tidy_1))

# 5 - Create a second, independent tidy data set with average of each variable for each activity and each subject
run_analysis <- tidy_1 %>% group_by(subject, activity) %>% summarise_all(list(mean = mean))
