# Getting and Cleaning Data Course Project

The data linked to from the course website represent data collected from the accelerometers from the Samsung Galaxy S smartphone. A full description is available at the site where the data was obtained:

[Human Activity Recognition Using Smartphones Data Set](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones#)

[Here are the data for the project](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip)

Use of this dataset in publications must be acknowledged by referencing the following publication

Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012

##This repository contains:

- `README.md`
- `CodeBook.md`, the code book
- `run_analysis.R`, the R script to merge data and create the tidy data set 
- `tidydata.txt`, which contains the tidy data set

##`run_analysis.R` downloads the source data set and transforms it to produce the final tidy data set:

- download data
- unzip and read data.
- merge data
- extractthe measurements on the mean and standard deviation
- use descriptive activity names
- create an independent tidy set with the average of each variable for each activity and each subject
- write the data set to the `tidydata.txt`

