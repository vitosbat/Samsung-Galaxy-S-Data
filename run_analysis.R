# This function merges the training and the test measurement data sets in one
# data set and uses descriptive names.
firstDataSetInit <- function () {
    data_train <- read.table("initial_data/train/X_train.txt")
    data_test <- read.table("initial_data/test/X_test.txt")
    data_bind <- rbind(data_train, data_test)
    
    # Appropriately labels the data set with descriptive variable names.
    # For more details see "Codebook.md" file.
    data_names <-read.table("initial_data/features.txt")
    colnames(data_bind) <- data_names[,2]
    
    # Extracts only the measurements on the mean and standard deviation 
    # for each measurement.
    filteredData <- data_bind[grepl("mean()", names(data_bind)) | 
                                  grepl("std()", names(data_bind))]
    
    # Merges train and test and lables activity data set
    activity_train <- read.table("initial_data/train/y_train.txt")
    activity_test <- read.table("initial_data/test/y_test.txt")
    activity_bind <- rbind(activity_train, activity_test)
    colnames(activity_bind) <- "activity"
    
    # Merges train and test and lables subjects data set
    subject_train <- read.table("initial_data/train/subject_train.txt")
    subject_test <- read.table("initial_data/test/subject_test.txt")
    subject_bind <- rbind(subject_train, subject_test)
    colnames(subject_bind) <- "subject"
    
    # Creates one data set
    dataSet <- cbind(subject_bind, activity_bind, filteredData)
    
    # Uses descriptive activity names to name the activities in the data set
    activity_lables <- read.table("initial_data/activity_labels.txt")
    dataSet$activity <- sapply(dataSet$activity, function(x) {
        activity_lables[,2][as.numeric(x)]
    })
    dataSet
}

# This function creates a second, independent tidy data set with the average
# of each variable for each activity and each subject.
secondDataSetInit <- function(dataSet) {
    library(reshape2)
    meltData <- melt(dataSet, id=c("subject", "activity"))
    secondDataSet <-dcast(meltData, subject + activity ~ variable, mean)
    names(secondDataSet)[3:81] <- sapply(names(secondDataSet)[3:81], function(x) {
        paste("average_", x, sep="")
    })
    secondDataSet
}

firstDataSet <- firstDataSetInit()
secondDataSet <- secondDataSetInit(firstDataSet)
write.table(secondDataSet, file="tidyDataSet.txt")