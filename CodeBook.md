
Data for the project : “https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip”

Data provided are as below:

    X_train.txt: Training set
    y_train.txt: Training labels
    X_test.txt: Test set
    y_test.txt: Test labels
    subject_train.txt/subject_test.txt: Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30.
    features.text: List of all features
    activity_labels.txt: Links the class labels with their activity name

Variables:

trainX : reads the X_train.txt data 
trainy: reads the y_train.txt data 
trainsubj: reads the subject_train.txt data 
testX: reads the X_test.txt data 
testy: reads the y_test.txt data 
testsubj: reads the subject_test.txt data 
mergeX : stores the merged test and training sets together 
mergey: stores the merged test and training labels together feature 
data: reads features.txt data 
mergeSubj: stores the subject test and training data together 
activitydata : reads features.txt data 
activitylbl: Applies activity names to the merged test and training labels 
Dataset: Combines all the merged test, train and subject data together 
measureextract: finds the indices of the features of mean() and std() from feature data 
cleandata: creates a data frame with only mean() and std() measurements along with activity and subject 
tidydata: creates another data table of cleandata 
averagedata: calculates the average/mean of tidydata i.e for each measurement for each subject and each 
activity Finally output the Mean of the results in a file

Transformations:

    converts the names of features in lower case
    assigns the column names in the merged train and test set with the features names from features.txt data which have mean() and std() measurements
    assigns the column names in the merged train and test labels with “activity” and “description”
    assigns the column name in the merged train and test subjects with “subject”
    extracts only the mean() and std() measurements from features data
    removes the ‘()’ from mean and std measurements names
    removes the ‘_’ from the activity description names
