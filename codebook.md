For explanations of R code "run_analysis.R", please see readme.md
Variable explanations:
X_train, y_train, X_test, y_test, subject_train, subject_test are downloaded from the following website https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
MergedDta is dataframe that combine X_train, y_train, X_test, y_test, subject_train, subject_test 
InterestedMeasure: this is a dataframe that select activityId, subjectId, and all the other columns that contains mean and std word
DescriptiveName: this is a dataframe that merges interestedMeasure and activitylabel based on activityId
Tidydataset:this dataframe aggregates the data based on subject id and activity types and returns the mean.
