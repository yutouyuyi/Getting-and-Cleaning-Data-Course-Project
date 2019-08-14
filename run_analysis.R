fildURL<-"https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(fileURL,destfile='DATA.zip')
unzip("DATA.zip")
#read data
x_train<-read.table("./UCI HAR Dataset/train/X_train.txt")
y_train<-read.table("./UCI HAR Dataset/train/y_train.txt")
subject_train <- read.table("./UCI HAR Dataset/train/subject_train.txt")

x_test <- read.table("./UCI HAR Dataset/test/X_test.txt")
y_test <- read.table("./UCI HAR Dataset/test/y_test.txt")
subject_test <- read.table("./UCI HAR Dataset/test/subject_test.txt")

features <- read.table('./UCI HAR Dataset/features.txt')

activitylabel = read.table('./UCI HAR Dataset/activity_labels.txt')

#label data
colnames(x_train) <- features[,2]
colnames(y_train) <-"activityId"
colnames(subject_train) <- "subjectId"

colnames(x_test) <- features[,2] 
colnames(y_test) <- "activityId"
colnames(subject_test) <- "subjectId"

colnames(activitylabel) <- c('activityId','activityType')

# Merges the training and the test sets to create one data set.

mergedtrain <- cbind(y_train, subject_train, x_train)
mergedtest <- cbind(y_test, subject_test, x_test)
mergedDATA <- rbind(mergedtrain,mergedtest)

COLNAME<-colnames(mergedDATA)
# Extracts only the measurements on the mean and standard deviation for each measurement.
InterestedMeasure <- mergedDATA[(grepl("activityId" , COLNAME) | 
                   grepl("subjectId" , COLNAME) | 
                   grepl("mean.." , COLNAME) | 
                   grepl("std.." , COLNAME) )]
# Uses descriptive activity names to name the activities in the data set
DescriptiveName<-merge(InterestedMeasure,activitylabel,by="activityId",all.x = TRUE)


# creates a second, independent tidy data set with the average of each variable for each activity and each subject.
Tidydataset<-aggregate(.~subjectId+activityId,DescriptiveName,mean)


write.table(Tidydataset,"Tidydata.txt",row.names = FALSE)
