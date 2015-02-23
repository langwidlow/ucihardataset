# ucihardataset
Script to create tidy data set from UCI HAR Dataset.


In this repository there are 3 files:

1. README.md
2. Codebook.md
3. run_analysis.R

The codebook list the variables (type, units) in the data table "UCIHARtidyDataSet" that results from sourcing the run_analysis.R script. The codebook also describes the process used to prepare a tidy data set from the raw data. The details for code operations is commented in the run_analysis.R.

run_analysis.R is the script that performs the operations to output a tidy data set. Prior to running the script you will need to download the data file here: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip. This script also assumes you have set your working directory to the "UCI HAR Dataset" folder from the extracted zip.

Included below is quote from the researchers describing the data collection. Further information can be found in the file download.

"==================================================================
Human Activity Recognition Using Smartphones Dataset
Version 1.0
==================================================================
Jorge L. Reyes-Ortiz, Davide Anguita, Alessandro Ghio, Luca Oneto.
Smartlab - Non Linear Complex Systems Laboratory
DITEN - Università degli Studi di Genova.
Via Opera Pia 11A, I-16145, Genoa, Italy.
activityrecognition@smartlab.ws
www.smartlab.ws
==================================================================

The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data."
