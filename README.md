GCD
===

run_Analysis.R script consists of

Reading the data from the various files that are required as described in CodeBook.md

    1. merging the training and test data sets.
    2. merging the training and test labels.
    3. merging the training and test subjects
    4. labeling the merged training and test labels with appropriate activity names
    5. Renaming the merged data sets and subject data with appropriate column names as described in codeBook.md
    6. Cleanses the data sets by removing ‘_’ from the activity names. Converts the activity names to lower case.
    7. Labels the features names in the merged test and training sets
    8. Filters the datasets only to mean() and std() measurements
    9. Cleanses the subset by removing the ‘()’ from the feature names
    10.creates a separate data set storing only the average of each measurement of each subject and each activity orders the average subdata by activity
    11. Writes the data from step 10 to a txt file ‘tidydata.txt’
