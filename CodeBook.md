---
title: "CodeBook.md"
author: "Andres Aybar"
date: "2024-06-22"
output: pdf_document
---


## Getting and Cleaning Data Course Project

# Code Book

This code book describes the data, the variables, and the transformations performed to clean and process the data.

## Summary

This code book outlines the process of downloading, cleaning, and tidying the data from the Human Activity Recognition Using Smartphones Dataset to produce a final tidy data set that contains the average of each variable for each activity and each subject.

## Data Source

The data used in this project is derived from the Human Activity Recognition Using Smartphones Dataset, available from the UCI Machine Learning Repository. 

The authors of this study are: Jorge L. Reyes-Ortiz, Davide Anguita, Alessandro Ghio, Luca Oneto.

Data set URL: https://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

## Data Description

The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist.

## Variables

### Original Data Variables

- `subject`: Identifier of the subject who carried out the experiment.
- `activity`: Activity performed by the subject during the experiment.
- Features: 561 features vector with time and frequency domain variables. Some of these include:
  - `tBodyAcc-mean()-X`
  - `tBodyAcc-mean()-Y`
  - `tBodyAcc-mean()-Z`
  - `tBodyAcc-std()-X`
  - `tBodyAcc-std()-Y`
  - `tBodyAcc-std()-Z`
  - And more...

### Processed Data Variables

- `subject`: Identifier of the subject who carried out the experiment.
- `activity`: Descriptive activity name.
- `TimeBodyAccelerometerMeanX`
- `TimeBodyAccelerometerMeanY`
- `TimeBodyAccelerometerMeanZ`
- `TimeBodyAccelerometerSTDX`
- `TimeBodyAccelerometerSTDY`
- `TimeBodyAccelerometerSTDZ`
- `FrequencyBodyAccelerometerMeanX`
- `FrequencyBodyAccelerometerMeanY`
- `FrequencyBodyAccelerometerMeanZ`
- And more...

These variables represent the average of each measurement for each activity and each subject.

## Transformations and Cleaning Steps

1. **Downloading and Extracting Data**: The dataset was downloaded and extracted to the `./data` directory.
2. **Loading Data**: The data was loaded from the extracted files into R using `read.table()`.
3. **Combining Data**: The training and test datasets were combined using `rbind()`.
4. **Assigning Column Names**: Descriptive column names were assigned using the features information.
5. **Extracting Mean and Standard Deviation**: Only measurements on the mean and standard deviation were extracted.
6. **Labeling Activities**: Activity labels were converted to descriptive names.
7. **Descriptive Variable Names**: Variable names were made more descriptive by expanding abbreviations and correcting labels.
8. **Creating a Tidy Data Set**: A second tidy data set was created with the average of each variable for each activity and each subject using `group_by()` and `summarise_all()`.

## Final Data Set

The final data set `run_analysis` contains the average of each variable for each activity and each subject. It is saved as `project3.txt`.


