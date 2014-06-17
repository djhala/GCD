# read Train data
trainX <- read.table("./UCI HAR Dataset/train/X_train.txt")
trainy <- read.table("./UCI HAR Dataset/train/y_train.txt")
trainsubj <- read.table("./UCI HAR Dataset/train/subject_train.txt")

# read Test data
testX <- read.table("./UCI HAR Dataset/test/X_test.txt")
testy <- read.table("./UCI HAR Dataset/test/y_test.txt")
testsubj <- read.table("./UCI HAR Dataset/test/subject_test.txt")

# merge Test and Training data
mergeX <- rbind(testX,trainX)
mergey <- rbind(testy,trainy)

# rename the training data column to 'activity'
colnames(mergey) <- "Activity"

# read features.txt data
feature <- read.table("./UCI HAR Dataset/features.txt")

names(mergeX) <- feature$V2

# merge subject test and training data
mergeSubj <- rbind(testsubj,trainsubj)
# rename subject data column to "subject"
colnames(mergeSubj) <- "Subject"

# Read Activity.txt data
activitydata <- read.table("./UCI HAR Dataset/activity_labels.txt")
# Remove '_' from the activity description column and convert to lower case
activitydata[,"V2"] <- gsub("_","",tolower(activitydata$V2))
# Rename the columns in the activity data
colnames(activitydata)[1] <-"Activity"
colnames(activitydata)[2] <-"Description"

# merge activity labels; Uses descriptive activity names to name the activities in the data set
library(plyr)
activitylbl <- join (mergey,activitydata,by ="Activity")

# merges the training and the test sets to create one data set.
Dataset <- cbind(mergeX,activitylbl[["Description"]],mergeSubj)
colnames(Dataset)[562] <- "ActivityName"

# extract Mean and Standard Deviation data from Features.txt
measureextract <- grep(".*[Mm]ean\\(\\)|.*[Ss]td\\(\\)",feature$V2)
# Appropriately labels the data set with descriptive activity names
cleandata <- Dataset[, c(measureextract,562,563)]
# Remove '()' from the dataset measurements
names(cleandata) <- gsub("\\(|\\)","",names(cleandata))

# Creates a second, independent tidy data set with the average of each variable
# for each activity and each subject.
library(data.table)
tidydata <- data.table(cleandata)
averagedata <- tidydata[, lapply(.SD, mean), by=c("Subject","ActivityName")]
# Orders the dataset of the average by the activity
averagedata <- averagedata[order(averagedata$ActivityName),]

# Exporting data into a .txt file:
write.table(averagedata, "tidydata.txt",sep='\t')
