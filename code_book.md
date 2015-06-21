# Human Activity Recognition Code Book

## Identifiers

*Subject.ID* - [1,30]. Integer value indicating the subject from whom the smartphone readings were taken

*Activity.ID* - [1,6]. Integer value indicating what activity was taking place (or was predicted) by the other gyroscope and accelerometer variables

*Activity.Description*. [WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, STANDING, SITTING, LAYING]. Token describing activity indicated by activity ID* 

*Input.Set*. [Training, Test]. Indicates whether the row was used for training or testing.

## Time-domain data

Time domain data is taken from both the accelerometer and the gyroscope.  Each time-domain vector has X,Y, and Z components,
as well as a common set of statistics. All data is range normalized to [-1,1].

For example:

	time.BodyAcc.mean.X - The mean X-component of the time domain Body vector measured by the accelerometer (the total accelerometer vector is decomponsed into Body and Gravity components)
	time.BodyAcc.mean.Y - The Y-component of above
	time.GravityAcc.mean.Y - The Y-component of the Gravity component of the total accelerometer vector.

additionally, the following staistics are provided for each time-domain vector
*.mean - mean
*.std  - standard deviation
*.mad  - median absolute deviation
*.max  - maximum of recorded value
*.min  - minimum of recorded value
*.sma  - signal magnitude area
*.energy - Sum of squares divided by number of values
*.iqr - interquartile range
*.entropy - signal entropy
*.arCoeff - Autoregression coefficients
*.corellation - correlation coefficient between body and gravity vector

## Time domain list

time.BodyAcc - Body component of accelerometer vector
time.GravityAcc - Gravity component of accelermeter vector
time.BodyAccJerk - Jerk (i.e. integral of Acc) of body vector
time.BodyGyro - Body component of gyroscope
time.BodyGyroJerk - Body component of gyroscope jerk measure
time.BodyAccMag - Acceleration magnitude, not a vector quantity like others

## Freq domain list

In addition to the above statistics, frequency-domain data included the following:
 
*.kurtosis - kurtosis of frequency domain signal
*.meanFreq  - Weighted average of frequency components
*.skewness - skeqness of frequency domain signal
*.maxInds  - Index of the frequency component with the largest magnitude
*.bandsEnergy - 64-bin histogram of frequency components from FFT

freq.BodyAcc - Body component of acclerometer vector
freq.BodyAccJerk - Jerk of body acc vector
freq.BodyAccJerkMag -  Magnitude of body acc vector (scalar!)
freq.BodyGyro - Body component of gyroscope vector
freq.BodyGyroMag - Magnitude of gyroscope vector (scalar!)

## Average tidy data set

An averaged tidy set for all features matching "mean" and "std" is provided with this script.
These averages were stratified by Subject.ID and Acitivity.ID and with the aid of the 
summarise_each() function from the "dplyr" R pacakage. NAmes correspond to those in this 
code book, but take care, they are means!




