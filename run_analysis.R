# Source of data for this project: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip


#R script does the following. 

#Download data and unzip

#Merges the training and the test sets to create one data set.
Xtrain <- read.table("./train/X_train.txt")
Xtest <- read.table("./test/X_test.txt")
X <- rbind(Xtrain, Xtest)

Ytrain <- read.table("./train/Y_train.txt")
Ytest <- read.table("./test/Y_test.txt")
Y<- rbind(Ytrain, Ytest)

Strain <- read.table("./train/subject_train.txt")
Stest <- read.table("./test/subject_test.txt")
S <- rbind(Strain, Stest)


#Extracts only the measurements on the mean and standard deviation for each measurement.
  
features <- read.table("features.txt")
index_features <- grep("-mean\\(\\)|-std\\(\\)", features[, 2])
X <- X[, index_features]
names(X) <- features[index_features, 2]
names(X) <- gsub("\\(|\\)", "", names(X))
names(X) <- tolower(names(X))

#Uses descriptive activity names to name the activities in the data set
activity <- read.table("activity_labels.txt")
activity[, 2] = gsub("_", "", tolower(as.character(activity[, 2])))
Y[,1] = activity[Y[,1], 2]
names(Y) <- "activity"

#Appropriately labels the data set with descriptive variable names. 

names(S) <- "subject"
cleaned <- cbind(S, Y, X)
write.table(cleaned, "merged_clean_data.txt")

#From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.


uniqueSubjects = unique(S)[,1]
numSubjects = length(unique(S)[,1])
numActivities = length(activity[,1])
numCols = dim(cleaned)[2]
result = cleaned[1:(numSubjects*numActivities), ]

row = 1
for (s in 1:numSubjects) {
  for (a in 1:numActivities) {
    result[row, 1] = uniqueSubjects[s]
    result[row, 2] = activity[a, 2]
    tmp <- cleaned[cleaned$subject==s & cleaned$activity==activity[a, 2], ]
    result[row, 3:numCols] <- colMeans(tmp[, 3:numCols])
    row = row+1
  }
}
write.table(result, "Clean_Data_Averages.txt")
