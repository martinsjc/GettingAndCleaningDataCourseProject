## Project Description
The purpose of this project was to take the Human Activity Recognition Using Smartphones Data Set in http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones#
and transform the data into a tidy data set representing the average of the mean and standard deviation measurements for each activity and subject.

## Study design and data processing
The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain. 

For each record it is provided:

- Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration.
- Triaxial Angular velocity from the gyroscope. 
- A 561-feature vector with time and frequency domain variables. 
- Its activity label. 
- An identifier of the subject who carried out the experiment.

## Collection of the raw data

The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 

These signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

tBodyAcc-XYZ  
tGravityAcc-XYZ  
tBodyAccJerk-XYZ  
tBodyGyro-XYZ  
tBodyGyroJerk-XYZ  
tBodyAccMag  
tGravityAccMag  
tBodyAccJerkMag  
tBodyGyroMag  
tBodyGyroJerkMag  
fBodyAcc-XYZ  
fBodyAccJerk-XYZ  
fBodyGyro-XYZ  
fBodyAccMag  
fBodyAccJerkMag  
fBodyGyroMag  
fBodyGyroJerkMag

The set of variables that were estimated from these signals are: 

mean(): Mean value  
std(): Standard deviation  
mad(): Median absolute deviation   
max(): Largest value in array  
min(): Smallest value in array  
sma(): Signal magnitude area  
energy(): Energy measure. Sum of the squares divided by the number of values.   
iqr(): Interquartile range   
entropy(): Signal entropy  
arCoeff(): Autorregresion coefficients with Burg order equal to 4  
correlation(): correlation coefficient between two signals  
maxInds(): index of the frequency component with largest magnitude  
meanFreq(): Weighted average of the frequency components to obtain a mean frequency  
skewness(): skewness of the frequency domain signal   
kurtosis(): kurtosis of the frequency domain signal   
bandsEnergy(): Energy of a frequency interval within the 64 bins of the FFT of each window.  
angle(): Angle between to vectors.

Additional vectors obtained by averaging the signals in a signal window sample. These are used on the angle() variable:

gravityMean  
tBodyAccMean  
tBodyAccJerkMean  
tBodyGyroMean  
tBodyGyroJerkMean

## Creating the tidy datafile

### Guide to create the tidy data file
The tidy data set is included in the repo - tidy_data.txt file.  
You can also generate the file by running the run_analysis.R script.


### Cleaning of the data
From the provided data, the training and test data sets were merged, then only the measurements on the mean and standard deviation were selected for each measurement.  
Applying the information in features_info.txt and taking the labels in features.txt, we gave more descripitive variable names to the data set.  
Finally, from this, an independent tidy data set was created containing the average of each variable for each activity and each subject.

## Description of the variables in the tiny_data.txt file
The final tidy data set in tidy_data.txt has a dimension of 180 rows by 68 columns.  
The 180 observations correspond to the observations of 30 subjects * 6 activities observed.  
The 68 columns correspond to the subject and activity columns plus the 66 means of the selected measurements mentioned in the Cleaning of the data section.

These 66 variables that represent the means of the measurements (the names attempt to make these variables more descriptive and what each component of the name means is explained further in the Collection of the raw data section) are as follow:
                                           
 - timeBodyAcceleration.mean.X                           
 - timeBodyAcceleration.mean.Y                           
 - timeBodyAcceleration.mean.Z                           
 - timeBodyAcceleration.standardDev.X                    
 - timeBodyAcceleration.standardDev.Y                    
 - timeBodyAcceleration.standardDev.Z                    
 - timeGravityAcceleration.mean.X                        
 - timeGravityAcceleration.mean.Y                        
 - timeGravityAcceleration.mean.Z                        
 - timeGravityAcceleration.standardDev.X                 
 - timeGravityAcceleration.standardDev.Y                 
 - timeGravityAcceleration.standardDev.Z                 
 - timeBodyAccelerationJerk.mean.X                       
 - timeBodyAccelerationJerk.mean.Y                       
 - timeBodyAccelerationJerk.mean.Z                       
 - timeBodyAccelerationJerk.standardDev.X                
 - timeBodyAccelerationJerk.standardDev.Y                
 - timeBodyAccelerationJerk.standardDev.Z                
 - timeBodyGyroscope.mean.X                              
 - timeBodyGyroscope.mean.Y                              
 - timeBodyGyroscope.mean.Z                              
 - timeBodyGyroscope.standardDev.X                       
 - timeBodyGyroscope.standardDev.Y                       
 - timeBodyGyroscope.standardDev.Z                       
 - timeBodyGyroscopeJerk.mean.X                          
 - timeBodyGyroscopeJerk.mean.Y                          
 - timeBodyGyroscopeJerk.mean.Z                          
 - timeBodyGyroscopeJerk.standardDev.X                   
 - timeBodyGyroscopeJerk.standardDev.Y                   
 - timeBodyGyroscopeJerk.standardDev.Z                   
 - timeBodyAccelerationMagnitude.mean                    
 - timeBodyAccelerationMagnitude.standardDev             
 - timeGravityAccelerationMagnitude.mean                 
 - timeGravityAccelerationMagnitude.standardDev          
 - timeBodyAccelerationJerkMagnitude.mean                
 - timeBodyAccelerationJerkMagnitude.standardDev         
 - timeBodyGyroscopeMagnitude.mean                       
 - timeBodyGyroscopeMagnitude.standardDev                
 - timeBodyGyroscopeJerkMagnitude.mean                   
 - timeBodyGyroscopeJerkMagnitude.standardDev            
 - frequencyBodyAcceleration.mean.X                      
 - frequencyBodyAcceleration.mean.Y                      
 - frequencyBodyAcceleration.mean.Z                      
 - frequencyBodyAcceleration.standardDev.X               
 - frequencyBodyAcceleration.standardDev.Y               
 - frequencyBodyAcceleration.standardDev.Z               
 - frequencyBodyAccelerationJerk.mean.X                  
 - frequencyBodyAccelerationJerk.mean.Y                  
 - frequencyBodyAccelerationJerk.mean.Z                  
 - frequencyBodyAccelerationJerk.standardDev.X           
 - frequencyBodyAccelerationJerk.standardDev.Y           
 - frequencyBodyAccelerationJerk.standardDev.Z           
 - frequencyBodyGyroscope.mean.X                         
 - frequencyBodyGyroscope.mean.Y                         
 - frequencyBodyGyroscope.mean.Z                         
 - frequencyBodyGyroscope.standardDev.X                  
 - frequencyBodyGyroscope.standardDev.Y                  
 - frequencyBodyGyroscope.standardDev.Z                  
 - frequencyBodyAccelerationMagnitude.mean               
 - frequencyBodyAccelerationMagnitude.standardDev        
 - frequencyBodyBodyAccelerationJerkMagnitude.mean       
 - frequencyBodyBodyAccelerationJerkMagnitude.standardDev
 - frequencyBodyBodyGyroscopeMagnitude.mean              
 - frequencyBodyBodyGyroscopeMagnitude.standardDev       
 - frequencyBodyBodyGyroscopeJerkMagnitude.mean          
 - frequencyBodyBodyGyroscopeJerkMagnitude.standardDev
