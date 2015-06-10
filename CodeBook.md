#Code Book

Source of the data for the project: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

Full description from where the data was obtained: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

The attached R script (run_analysis.R) performs the following to clean up the data:

##### Merges the training and test sets to create one data set: 
- train/X_train.txt with test/X_test.txt, the result of which is a 10299x561 data frame, as in the original description ("Number of Instances: 10299" and "Number of Attributes: 561"
- train/subject_train.txt with test/subject_test.txt, resulting in a 10299x1 data frame with subject IDs
- train/y_train.txt with test/y_test.txt, the result of which is also a 10299x1 data frame with activity IDs.

##### Reads features.txt and extracts only the measurements on the mean and standard deviation for each measurement.
The result is a 10299x66 data frame. This means 66 out of 561 attributes are measurements on the mean and standard deviation. All measurements seem to be floating point numbers in the range (-1, 1).

##### Reads activity_labels.txt and applies descriptive activity names to name the activities in the data set:
````R
walking
walkingupstairs
walkingdownstairs
sitting
standing
laying
``````

#####Label the data set with descriptive names: 
-The feature names (attributes) and activity names are converted to lower case; underscores and brackets () are removed. 
-Merges the 10299x66 data frame containing features with 10299x1 data frames containing activity labels and subject IDs. 
-Save results as merged_clean_data.txt, a 10299x68 data frame such that the first column contains subject IDs, the second column activity names, and the last 66 columns are measurements. Subject IDs are integers between 1 and 30 inclusive. The names of the attributes are similar to the following:
````R
tbodyacc-mean-x
tbodyacc-mean-y 
tbodyacc-mean-z 
tbodyacc-std-x
tbodyacc-std-y 
tbodyacc-std-z 
tgravityacc-mean-x 
tgravityacc-mean-y 
tgravityacc-mean-z
````
#####Finally create the tidy data set.
A second script is created, independent tidy data set with the average of each measurement for each activity and each subject. The result is saved as "merged_clean_data.txt, a 180x68 data frame. 
-The first column contains subject IDs 
-The second column contains activity names
-The columns 3-68 contain the averages for each of the 66 attributes
-There are 30 subjects and 6 activities, hence the 180 rows in this data set with averages.


