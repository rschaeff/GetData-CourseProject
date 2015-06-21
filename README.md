# Conversion of the Human Activity Recognition raw data into a tidy data set

### Introduction

The Human Activity Recognition dataset consists of measurements taken from 
the accelerometer and gyrosscope of mobile devices from 30 individuals. Linear
acclerations and angular velocities were captured at 50 Hz. Subsequent FFT
was used to convert time-course data into frequency data. Additionally.
subjects engaged in 6 types of physical activity which were capture in the data
set (walking, walking upstairs, walking downstairs, sitting, standing, and laying down)

Data was partitioned into training and test sets, 70% of volunteers generated training
data, wheras 30% of volunteers generated test data. In total, 561 features were captured.

A final tidy data set is provided with the averages across each feature stratified
by activity and subject.

### Dependencies

The enclosed R script relies *heavily* on the "dplyr" R package. This pacakage is available at CRAN at
http://cran.r-project.org/web/packages/dplyr/index.html

### Cleaning

Substantial renaming of the features was accomplished. A single period, ".", 
was adopted at the default seperator. The following characeters or tuples
were converted to the default separator.

* double parans (e.g. mean() => mean. )
* single parans (e.g. angle(Z,gravityMean) => angle.Z.gravityMean)
* commas

Trailing periods were removed

Names of time domain variables were made more explicit (tBodyAccMag-std() => time.BodyAccMag.std)
Similar treatment was applied to frequency domain data (fBodyAcc-std() => freq.BodyAcc.std)

Data normalization was not altered, all data has been range normalized to [-1,1]

Training and Test sets were merged into a single dataset, a column was added to signifiy the Input.Set (Training or Test)

Activity descriptions were merged to the final data

### Usage

The script assumes that the extracted raw data is in the ./UCI HAR Dataset subdirectory with respect to the working directory.
Running the script will load the data object "merge_data_df" into your working environment, and write the summary statistics
table "aggregated _tidy_means.txt" into the working directory