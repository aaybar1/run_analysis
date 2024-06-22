---
title: "README.MD"
author: "Andres Aybar"
date: "2024-06-22"
output: pdf_document
---

# Human Activity Recognition Using Smartphones Dataset

This repository contains the R scripts and documentation for cleaning and processing the Human Activity Recognition Using Smartphones Dataset.

## Files

- `run_analysis.R`: R script for downloading, cleaning, and tidying the data set.
- `CodeBook.md`: Documentation of the variables, data, and transformations performed.
- `README.md`: This file, describing the repository contents and usage.
- `project3.txt`: This is the final data set submitted. 

## `run_analysis.R` Script

The `run_analysis.R` script performs the following steps:

1. **Download and Extract Data**:
   - Creates a `data` directory if it doesn't exist.
   - Downloads the data set ZIP file.
   - Extracts the content of the ZIP file into the `data` directory.

2. **Load Libraries**:
   - Loads the `dplyr` library for data manipulation.


3. **Load Data**:
   - Loads the features and activity labels.
   - Loads the test and train data sets.
   - Merges the test and train data sets to create one data set (**Objective #1**)


4. **Assign Column Names**:
   - Assigns descriptive column names to the merged data set.


5. **Extract Mean and Standard Deviation**:
   - Extracts only the measurements on the mean and standard deviation
   for each measurement (**Objective #2**).


6. **Label Activities**:
   - Converts activity labels to descriptive activity names (**Objective #3**).


7. **Descriptive Variable Names**:
   - Replaces abbreviations and corrects labels to make variable names descriptive, in a tidy format (**Objective #4**).


8. **Create Tidy Data Set**:
   - Creates a second tidy data set with the average of each variable for each activity and each subject (**Objective #5**).
  
  

## Usage

To run the script and generate the tidy data set:

1. Ensure you have the `dplyr` package installed.
2. Source the `run_analysis.R` script in R:
   ```r
   source("run_analysis.R")
