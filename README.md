Getting-Cleaning-Data-Project
=============================

Project for Coursera Getting and Cleaning Data Course

These are the steps followed to obtain TIDY DATA saved as final_table.csv or final_table.txt
Steps described are followed in the R script called "Project1.R"

Data ZIP file was extracted and data from the test (test data) and the actual training (train data) are loaded (test.data and train.data)
Corresponding activities ("exercises") and tested individuals ("subjects") for test and train data are added as rows to test.data and train.data
Column names are updated and test.data and train.data are merged in a dat frame of 10299 rows (observations) and 563 variables (all.data)
561 variables and in the original data, plus the corresponding individuals and activities (561+2=563)
The code activity is replaced following the code:

* 1 WALKING

* 2 WALKING_UPSTAIRS

* 3 WALKING_DOWNSTAIRS

* 4 SITTING

* 5 STANDING

* 6 LAYING


Now the number of variables are reduced to the ones referring to MEAN and STANDARD DEVIATION
To perform this selection, following steps are performed by the R script:

* Variables containing "mean" and "sd" are selected
* Weighted means ("meanFreq") are removed
* Angle values ("angle") between different vectors are excluded
* Now 68 of the original 563 variables are kept

Now the average (mean) per individual ("subject") and activity ("exercise") are obtained for each variable (180 observations)
Name of the variables is changed, avoiding brackets and hightlighting if they are means ("mean.") or standard deviations ("sd.") and the axis measured (".x,y,z") 

*Subject			subject
*Exercise			exercise
*tBodyAcc-mean()-X		mean.timebodyaccel.x
*tBodyAcc-mean()-Y		mean.timebodyaccel.y
*tBodyAcc-mean()-Z		mean.timebodyaccel.z
*tBodyAcc-std()-X		sd.timebodyaccel.x
*tBodyAcc-std()-Y		sd.timebodyaccel.y
*tBodyAcc-std()-Z		sd.timebodyaccel.z
*tGravityAcc-mean()-X		mean.timegravityaccel.x
*tGravityAcc-mean()-Y		mean.timegravityaccel.y
*tGravityAcc-mean()-Z		mean.timegravityaccel.z
*tGravityAcc-std()-X		sd.timegravityaccel.x
*tGravityAcc-std()-Y		sd.timegravityaccel.y
*tGravityAcc-std()-Z		sd.timegravityaccel.z
*tBodyAccJerk-mean()-X		mean.timebodyacceljerk.x
*tBodyAccJerk-mean()-Y		mean.timebodyacceljerk.y
*tBodyAccJerk-mean()-Z		mean.timebodyacceljerk.z
*tBodyAccJerk-std()-X		sd.timebodyacceljerk.x
*tBodyAccJerk-std()-Y		sd.timebodyacceljerk.y
*tBodyAccJerk-std()-Z		sd.timebodyacceljerk.z
*tBodyGyro-mean()-X		mean.timebodygyro.x
*tBodyGyro-mean()-Y		mean.timebodygyro.y
*tBodyGyro-mean()-Z		mean.timebodygyro.z
*tBodyGyro-std()-X		sd.timebodygyro.x
*tBodyGyro-std()-Y		sd.timebodygyro.y
*tBodyGyro-std()-Z		sd.timebodygyro.z
*tBodyGyroJerk-mean()-X		mean.timebodygyrojerk.x
*tBodyGyroJerk-mean()-Y		mean.timebodygyrojerk.y
*tBodyGyroJerk-mean()-Z		mean.timebodygyrojerk.z
*tBodyGyroJerk-std()-X		sd.timebodygyrojerk.x
*tBodyGyroJerk-std()-Y		sd.timebodygyrojerk.y
*tBodyGyroJerk-std()-Z		sd.timebodygyrojerk.z
*tBodyAccMag-mean()		mean.timebodyaccel.magnitude
*tBodyAccMag-std()		sd.timebodyaccel.magnitude
*tGravityAccMag-mean()		mean.timegravityaccel.magnitude
*tGravityAccMag-std()		sd.timegravityaccel.magnitude
*tBodyAccJerkMag-mean()		mean.timebodyacceljerk.magnitude
*tBodyAccJerkMag-std()		sd.timebodyacceljerk.magnitude
*tBodyGyroMag-mean()		mean.timebodygyro.magnitude
*tBodyGyroMag-std()		sd.timebodygyro.magnitude
*tBodyGyroJerkMag-mean()	mean.timebodygyrojerk.magnitude
*tBodyGyroJerkMag-std()		sd.timebodygyrojerk.magnitude
*fBodyAcc-mean()-X		mean.freqbodyaccel.x
*fBodyAcc-mean()-Y		mean.freqbodyaccel.y
*fBodyAcc-mean()-Z		mean.freqbodyaccel.z
*fBodyAcc-std()-X		sd.freqbodyaccel.x
*fBodyAcc-std()-Y		sd.freqbodyaccel.y
*fBodyAcc-std()-Z		sd.freqbodyaccel.z
*fBodyAccJerk-mean()-X		mean.freqbodyacceljerk.x
*fBodyAccJerk-mean()-Y		mean.freqbodyacceljerk.y
*fBodyAccJerk-mean()-Z		mean.freqbodyacceljerk.z
*fBodyAccJerk-std()-X		sd.freqbodyacceljerk.x
*fBodyAccJerk-std()-Y		sd.freqbodyacceljerk.y
*fBodyAccJerk-std()-Z		sd.freqbodyacceljerk.z
*fBodyGyro-mean()-X		mean.freqbodygyro.x
*fBodyGyro-mean()-Y		mean.freqbodygyro.y
*fBodyGyro-mean()-Z		mean.freqbodygyro.z
*fBodyGyro-std()-X		sd.freqbodygyro.x
*fBodyGyro-std()-Y		sd.freqbodygyro.y
*fBodyGyro-std()-Z		sd.freqbodygyro.z
*fBodyAccMag-mean()		mean.freqbodyaccel.magnitude
*fBodyAccMag-std()		sd.freqbodyaccel.magnitude
*fBodyBodyAccJerkMag-mean()	mean.freqbodybodyacceljerk.magnitude
*fBodyBodyAccJerkMag-std()	sd.freqbodybodyacceljerk.magnitude
*fBodyBodyGyroMag-mean()	mean.freqbodygyro.magnitude
*fBodyBodyGyroMag-std()		sd.freqbodygyro.magnitude
*fBodyBodyGyroJerkMag-mean()	mean.freqbodybodygyrojerk.magnitude
*fBodyBodyGyroJerkMag-std()	sd.freqbodybodygyrojerk.magnitude
 
Finally, data is saved in "final_table.csv" (also provided in .txt)