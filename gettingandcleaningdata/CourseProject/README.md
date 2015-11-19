# Getting and Cleaning Data - Course Project
by Travis Hill

-----

## Overview
The purpose of this project is to demonstrate an ability to collect, work with, and clean a dataset. This project focuses on a dataset containing data from wearable computing experiments, compiled by the UC Irvine Machine Learning Repository. The experiments were conducted with 30 volunteers, each performing six activities (`WALKING`, `WALKING_UPSTAIRS`, `WALKING_DOWNSTAIRS`, `SITTING`, `STANDING`, and `LAYING`), while wearing a Samsung Galaxy S II smartphone recording accelerometer data. 

The original source for this data can be found [here](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones).

-----

## The Script
The submitted R script `run_analysis.R` contains the entirety of code necessary to complete this Course Project. It is not necessary to possess the raw data prior to running this script, as the script checks for the presence of data, and downloads it if it is not present. The workflow for the script is as follows:

1. Load/install the `reshape2` package, to be used later.

2. Check for presence of the data set (`getdata_dataset.zip`). If absent, download and unzip into working directory.

3. Import the pertinent data from all sources (`activity_labels.txt`, `features.txt`, `features_info.txt`, `test/y_test.txt`, `test/X_test.txt`, `test/subject_test.txt`, `test/y_train.txt`, `test/X_train.txt`, and `test/subject_train.txt` ). *Note: The data contained within the `Inertial Signals` folders was determined to be irrelevant to this projet, and was therefore not imported.*

4. Modify the `features` dataframe to include descriptive variable names, and assign to the xtrain and xtest dataframes (**Requirement 4**).

5. Use `grepl()` to extract only the measurements concerning mean and standard deviation (**Requirement 2**). *Note: measurements concerning "Mean Frequency" were considered relevant to mean and standard deviation, and as such, were pulled, for a total of 86 measurements for each record.*

6. Merge the test and training sets to create a single data set (**Requirement 1**).

7. Convert the activity variable into factor with labels and levels from `activityType`, and use descriptive names for the activities in the data set (**Requirement 3**).

8. Melt the data to produce a tidy dataset,  use `dcast()` to find means of all variables excluding `subjectId` and `activity`, and write the result to `tidyData.txt` for upload (**Requirement 5**).

_____
