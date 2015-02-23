#This code assumes that you set the working directory to the
#"UCI HAR Dataset" extracted folder.
#This code also assumes you have installed and loaded the "dplyr" package.
#Read the raw datasets into R.

#Read labels of activity into table.
labels <- read.table("activity_labels.txt")

#Read features of activity into table.
features <- read.table("features.txt")

#Read subjects of test file into table.
subtest <- read.table(".\\test\\subject_test.txt")

#Read x and y test data into table.
xtest <- read.table(".\\test\\X_test.txt")
ytest <- read.table(".\\test\\y_test.txt")

#Read train subjects into table.
subtrain <- read.table(".\\train\\subject_train.txt")

#Read x and y train data into table.
xtrain <- read.table(".\\train\\X_train.txt")
ytrain <- read.table(".\\train\\y_train.txt")

#Combine all test data tables into one frame.
testset <- cbind(subtest, ytest, xtest)

#Combine all train data tables into one frame.
trainset <- cbind(subtrain, ytrain, xtrain)

#Append trainset to testset.
combineset <- rbind(testset, trainset)

#Subset features names from feature table to prepare for renaming
#the variables.
subsetfeatures <- as.character(features[,2])

#Rename variables in the combined test and train set.
colnames(combineset)<-c("Subject", "Activity", subsetfeatures)

#Return vector of column numbers that have mean() or std() in variable name.
#If you do not set the fixed argument to TRUE, you will get several extra columns that
#have meanFreq() in the column name.
meancolindex <- grep("mean()", names(combineset), value=FALSE, fixed=TRUE)
stdcolindex <- grep("std()", names(combineset), value=FALSE, fixed=TRUE)

#Store vector of all columns with mean() or std() in variable name.
unionindex <- union(meancolindex, stdcolindex)

#Subset combineset and overwrite previous assignment to only include the mean or std columns.
combineset <- combineset[,c(1,2,unionindex)]

#Add the names of the activities for each observation.
labelmergeset <- merge(combineset, labels, by.x="Activity",by.y="V1")

#Drop the first column which has the activity numbers not the actual text names.
removeactnumber<-labelmergeset[,-1]

#Create a summary datatable that calculates the average for each variable for each person for each activity.
tidyset<-summarise_each(group_by(removeactnumber,Subject,V2), funs(mean))

#Fix variables that have a repeated phrase which should not be there.
names(tidyset)<-gsub("BodyBody", "Body", names(tidyset))

#Rename variable denoting activity from "V2" to "Activity"
colnames(tidyset)[2]<-"Activity"

#Output a text file with the tidy data set.
write.table(tidyset, "UCIHARtidyDataSet.txt", sep = ",")
