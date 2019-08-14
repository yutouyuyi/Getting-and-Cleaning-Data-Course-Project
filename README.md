# Getting-and-Cleaning-Data-Course-Project
The R code perfome the following functions. 
1. It read the training data, test data, and other files that contens variable names (the feature file), and activity names (activity labels file)
2. It assigns column names. Assign variable in feature data as column name to both X_train and X_test data. It assigns activity id to both y_train and y_test data. It assigns subject id as column name to subject_train and subject_test data. Lastly, it assigns activity Id and activitytype as column names to activtylabel data. 
3. It merges y_train, subject_train, x_train data and y_test, subject_test, and x_test data sepertely. It then merges the training data and test data. 
4. Select columns includning activityId, subjectId, and all the columns names that contains mean and std words. 
5. It merged the selected data with activity label data to add desciptive names to activities. 
6. It aggregate the above merged data by subject id and activity id by their mean value
7, lastly, it write the aggregated data as tidydata.txt
