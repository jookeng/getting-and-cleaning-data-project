# Steps
1. Download the data file into a local folder, https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 
2. Copy the script run_analysis.R into the parent folder of the downloaded data.
3. Run the script.  A txt file tidydata.txt will be generated in the same folder of the downloaded data.

# What the script does
1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement. 
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive variable names. 
5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

