#Note: Unlike the previous functions where I've merged and cleaned the data files inside Inertia Signals folder as well
# I have not modified these files, as in a few discussion threads I found it was not required. It could have been done using
#a loop as I have previously done.

#Reading the activity labels file
act <- read.delim("activity_labels.txt", header = FALSE, sep = " ")
act_label <- act[,2]

#Getting the column names from feature files
cols <- read.delim("features.txt", header = FALSE, sep = " ")
cols <- cols[,2]

#Filtering for mean and std
mtf <- grepl("mean",cols)
stf <- grepl("std",cols)
tf <- mtf | stf

#Cleaning column names
cols <- gsub("\\(\\)","",cols)
cols <- gsub("-","",cols)

#Getting appropriate files
files <- list.files("./combined", full.names = TRUE)
activity_file <- files[grepl("y_combined",files)]
subject_file <- files[grepl("subject",files)]
data_file <- files[grepl("X_combined",files)]

#Adding column names
temp <- read.delim(file = data_file,header = FALSE, sep = " ")
temp = temp[tf]
names(temp) <- cols[tf]

#Adding subject and activity name columns
Subject_ID <- read.delim(subject_file,header = FALSE, sep = " ", col.names = c("Subject_ID"))
Subject_ID <- Subject_ID[,1]

Activity <- read.delim(activity_file,header = FALSE, sep = " ", col.names = c("Activities"))
Activity <- Activity[,1]
Activity <- act_label[Activity]

#Creating table
my_table <- cbind(Subject_ID, Activity, temp)

#Writing to a txt file called dataset
write.table(my_table, file = "./combined/dataset.txt", row.names = FALSE)