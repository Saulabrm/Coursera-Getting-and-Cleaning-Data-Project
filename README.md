# Coursera Getting and Cleaning
This repository holds the Project for the Coursera Data Science Specialization - Getting and Cleaning Data

## Course Project

First step is to download the data in able to run the project:
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

- Unzip the data in your computer and place the folder "UCI HAR Dataset" where you will be working          
  (Example: /Users/NAME/Documents/R)

- Place the file "run_analysis.R" into the folder "UCI HAR Dataset"

- Open R Studio and set the working directory to:  setwd("/Users/NAME/Documents/R/UCI HAR Dataset")

- Run the file in Rstudio: source("run_analysis.R")

- Now you can run the clean data reproduced by the "run_analysis.R"  read.table("Clean_Data_Averages.txt")
  
*The size of this file would be 180x68. There are 30 different subjects, and 6 activities. (30x6=180 rows)*



