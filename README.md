## Samsung Galaxy S II Data Set Analysis
#### This project is final for ["Getting and Cleaning Data"](https://class.coursera.org/getdata-004) course at Johns Hopkins University.

### Tasks:

We use experimental data set of human activity ([more detail](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones) ) for next tasks: 

1) Merges the training and the test sets to create one data set.

2) Extracts only the measurements on the mean and standard deviation for each measurement. 

3) Uses descriptive activity names to name the activities in the data set

4) Appropriately labels the data set with descriptive variable names. 

5) Creates a second, independent tidy data set with the average of each variable for each activity and each subject. 

### Files and folders

**run_analysis.R** - main R script. It contains two functions: first function realizes Task 1-4, second function creates data set from Task 5.

**initial_data/** - initial experimental data sets (training and test)

**tidyDataSet.txt** - final data set of run_analysis script.

**CodeBook.md** - this document describe variables in tidyDataSet.txt

*Warning:* if you exicute run_analysis.R script it spent some time. For example, on my MacBook Air (4 Gb DDR3) it takes ~ 40 sec. 