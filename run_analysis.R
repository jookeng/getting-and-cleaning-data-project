# This script does the following,
# 1. Merges the training and the test sets to create one data set.
# 2. Extracts only the measurements on the mean and standard deviation for each measurement. 
# 3. Uses descriptive activity names to name the activities in the data set
# 4. Appropriately labels the data set with descriptive variable names. 
# 5. From the data set in step 4, creates a second, independent tidy data 
#     set with the average of each variable for each activity and each subject.

library(reshape2)
#setwd("~/Google Drive/Learn/Coursera/Data 03 Getting and Cleaning Data/project")

# Read Activity labels
activity.labels = read.table("./UCI HAR Dataset/activity_labels.txt")
activity.labels = activity.labels[,2]

# Read Column Names
features = read.table("./UCI HAR Dataset/features.txt")
features = features[,2]

# Read Test and Training Data
xtest = read.table("./UCI HAR Dataset/test/X_test.txt")
ytest = read.table("./UCI HAR Dataset/test/y_test.txt")
xtrain = read.table("./UCI HAR Dataset/train/X_train.txt")
ytrain = read.table("./UCI HAR Dataset/train/y_train.txt")
subject.test = read.table("./UCI HAR Dataset/test/subject_test.txt")
subject.train = read.table("./UCI HAR Dataset/train/subject_train.txt")

# Merge Subject and Test Data
xdata = rbind(xtest, xtrain)
ydata = rbind(ytest, ytrain)
subject.data = rbind(subject.test, subject.train)

# Label the x columns and extract only mean and std columns
names(xdata) = features
sub.features = grepl("mean|std", features)
xdata = xdata[,sub.features]

# Label y activity description columns
ydata[,2] = activity.labels[ydata[,1]]
names(ydata) = c("activity.id", "activity.label")
names(subject.data) = "subject"

# Merge Columns
all.data = cbind(data.frame(subject.data), ydata, xdata)

# Create tidy dataset by melting and casting
id.labels   = c("subject", "activity.id", "activity.label")
data.labels = setdiff(colnames(all.data), id.labels)
melted.data   = melt(all.data, id = id.labels, measure.vars = data.labels)
out.data   = dcast(melted.data, subject + activity.label ~ variable, mean)

# Write to file
write.table(out.data, file = "./UCI HAR Dataset/tidydata.txt", row.names = FALSE)






