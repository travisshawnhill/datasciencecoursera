## Getting and Cleaning Data - Course Project Code Book
by Travis Hill

-----

## Overview
The purpose of this project is to demonstrate an ability to collect, work with, and clean a dataset. This code book provides information regarding data written to tidyData.txt, the end-result of the transformations to the raw data fulfilling requirements 1 through 5 of the [Course Project](https://class.coursera.org/getdata-034/human_grading/view/courses/975118/assessments/3/submissions).

-----

## The Data Set

The original source for this data can be found [here](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones).

The set contains data from wearable computing experiments, compiled by the UC Irvine Machine Learning Repository. The experiments were conducted with 30 volunteers, each performing six activities (`WALKING`, `WALKING_UPSTAIRS`, `WALKING_DOWNSTAIRS`, `SITTING`, `STANDING`, and `LAYING`), while wearing a Samsung Galaxy SII smartphone recording accelerometer data. The data set has been randomly partitioned into two sets; 70% of the volunteers was selected for generating the training data and 30% the test data.

The following files are explicitly used in this project:

* `activity_labels.txt`
* `features.txt`
* `features_info.txt`
* `README.txt`
* `test/y_test.txt`
* `test/subject_test.txt`
* `test/X_test.txt`
* `train/y_train.txt`
* `train/subject_train.txt`
* `train/X_train.txt`

The data set includes additional files, in `./test/Inertial Signals`, and `./train/Inertial Signals`. Because one requirement of the project is to extract only the data pertaining to *Mean* and *Standard Deviation*, including these files is unnecessary.

-----

## Data Measurements

The following mean and standard deviation measurements are included in `tidyData.txt`. Their names have been altered to be more descriptive by removing unnecessary characters (`()`, `-`, etc.) and standardizing capitalizations.

 1. `"activity"`                           
 2. `"subjectId"`                          
 3. `"tBodyAccMean-X"`                      
 4. `"tBodyAccMean-Y"`                      
 5. `"tBodyAccMean-Z"`                      
 6. `"tBodyAccStdDev-X"`                    
 7. `"tBodyAccStdDev-Y"`                    
 8. `"tBodyAccStdDev-Z"`                    
 9. `"tGravityAccMean-X"`                   
10. `"tGravityAccMean-Y"`                   
11. `"tGravityAccMean-Z"`                   
12. `"tGravityAccStdDev-X"`                 
13. `"tGravityAccStdDev-Y"`                 
14. `"tGravityAccStdDev-Z"`                 
15. `"tBodyAccJerkMean-X"`                  
16. `"tBodyAccJerkMean-Y"`                  
17. `"tBodyAccJerkMean-Z"`                  
18. `"tBodyAccJerkStdDev-X"`                
19. `"tBodyAccJerkStdDev-Y"`                
20. `"tBodyAccJerkStdDev-Z"`                
21. `"tBodyGyroMean-X"`                     
22. `"tBodyGyroMean-Y"`                     
23. `"tBodyGyroMean-Z"`                     
24. `"tBodyGyroStdDev-X"`                   
25. `"tBodyGyroStdDev-Y"`                   
26. `"tBodyGyroStdDev-Z"`                   
27. `"tBodyGyroJerkMean-X"`                 
28. `"tBodyGyroJerkMean-Y"`                 
29. `"tBodyGyroJerkMean-Z"`                 
30. `"tBodyGyroJerkStdDev-X"`               
31. `"tBodyGyroJerkStdDev-Y"`               
32. `"tBodyGyroJerkStdDev-Z"`               
33. `"tBodyAccMagMean"`                     
34. `"tBodyAccMagStdDev"`                   
35. `"tGravityAccMagMean"`                  
36. `"tGravityAccMagStdDev"`                
37. `"tBodyAccJerkMagMean"`                 
38. `"tBodyAccJerkMagStdDev"`               
39. `"tBodyGyroMagMean"`                    
40. `"tBodyGyroMagStdDev"`                  
41. `"tBodyGyroJerkMagMean"`                
42. `"tBodyGyroJerkMagStdDev"`              
43. `"fBodyAccMean-X"`                      
44. `"fBodyAccMean-Y"`                      
45. `"fBodyAccMean-Z"`                      
46. `"fBodyAccStdDev-X"`                    
47. `"fBodyAccStdDev-Y"`                    
48. `"fBodyAccStdDev-Z"`                    
49. `"fBodyAccMeanFrequency-X"`             
50. `"fBodyAccMeanFrequency-Y"`             
51. `"fBodyAccMeanFrequency-Z"`             
52. `"fBodyAccJerkMean-X"`                  
53. `"fBodyAccJerkMean-Y"`                  
54. `"fBodyAccJerkMean-Z"`                  
55. `"fBodyAccJerkStdDev-X"`                
56. `"fBodyAccJerkStdDev-Y"`                
57. `"fBodyAccJerkStdDev-Z"`                
58. `"fBodyAccJerkMeanFrequency-X"`         
59. `"fBodyAccJerkMeanFrequency-Y"`         
60. `"fBodyAccJerkMeanFrequency-Z"`         
61. `"fBodyGyroMean-X"`                     
62. `"fBodyGyroMean-Y"`                     
63. `"fBodyGyroMean-Z"`                     
64. `"fBodyGyroStdDev-X"`                   
65. `"fBodyGyroStdDev-Y"`                   
66. `"fBodyGyroStdDev-Z"`                   
67. `"fBodyGyroMeanFrequency-X"`            
68. `"fBodyGyroMeanFrequency-Y"`            
69. `"fBodyGyroMeanFrequency-Z"`            
70. `"fBodyAccMagMean"`                     
71. `"fBodyAccMagStdDev"`                   
72. `"fBodyAccMagMeanFrequency"`            
73. `"fBodyBodyAccJerkMagMean"`             
74. `"fBodyBodyAccJerkMagStdDev"`           
75. `"fBodyBodyAccJerkMagMeanFrequency"`    
76. `"fBodyBodyGyroMagMean"`                
77. `"fBodyBodyGyroMagStdDev"`              
78. `"fBodyBodyGyroMagMeanFrequency"`       
79. `"fBodyBodyGyroJerkMagMean"`            
80. `"fBodyBodyGyroJerkMagStdDev"`          
81. `"fBodyBodyGyroJerkMagMeanFrequency"`   
82. `"angle(tBodyAccMean,gravity)"`         
83. `"angle(tBodyAccJerkMean),gravityMean)"`
84. `"angle(tBodyGyroMean,gravityMean)"`    
85. `"angle(tBodyGyroJerkMean,gravityMean)"`
86. `"angle(X,gravityMean)"`                
87. `"angle(Y,gravityMean)"`                
88. `"angle(Z,gravityMean)"`

-----

## Activity Labels

Descriptive activity labels, pulled from `activity_labels.txt`, were substituted for the numerical values for `activityType` listed in `tidyData.txt`, per Requirement 4 of the Course Project. The following activity labels were used:

1. WALKING 
2. WALKING_UPSTAIRS 
3. WALKING_DOWNSTAIRS 
4. SITTING 
5. STANDING 
6. LAYING

-----

## Data Transformations

The following transformations were made to the raw data to meet the Course Project requirements:

* Variable names were altered using `gsub()` to use more descriptive and readable language (see above).

* `colnames()` was used to rename the columns, using the variable names listed in `features.txt` (**Requirement 4**)

* `grepl()` was used to extract only the measurements concerning mean and standard deviation (**Requirement 2**). *Note: measurements concerning "Mean Frequency" were considered relevant to mean and standard deviation, and as such, were pulled, for a total of 86 measurements for each record.*

* `merge()` was used to merge the test and training sets to create a single data set (**Requirement 1**).

* `factor()` was used to convert the `activityType` variable into a factor, to add descriptive activity names to the dataframe (**Requirement 3**).

* `melt()` was used to create a molten data frame from the subset of raw data, in order to prepare a tidy data set.

* `dcast()` was used to find means of all variables excluding `subjectId` and `activity`, and write the result to `tidyData.txt` for upload (**Requirement 5**).

-----



