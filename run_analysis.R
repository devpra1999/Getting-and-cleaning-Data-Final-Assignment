#--------------------------------------------------------------------------------------------------------------------
#--------------------------------------------------------------------------------------------------------------------
#--------------------------------------------------------------------------------------------------------------------



#LOADING DATASET

download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip", destfile = "data.zip")
unzip("data.zip")
setwd("./UCI HAR Dataset")




#--------------------------------------------------------------------------------------------------------------------
#--------------------------------------------------------------------------------------------------------------------
#--------------------------------------------------------------------------------------------------------------------


#DATA CLEANING

library(stringr)
files <- list.files()
dirs <- files[!grepl("\\.",files)]
dirs <- paste0("./",dirs)
for (d in dirs){
    files <- list.files(d)
    dirs1 <- files[!grepl("\\.",files)]
    files1 <- files[grepl("\\.txt",files)]
    dirs1 <- paste0(d,"/",dirs1)
    files1 <- paste0(d,"/",files1)
    for (f in files1){
        temp <- readLines(f)
        temp <- str_squish(temp)
        write(temp,file = f)
    }
    for (d1 in dirs1){
        files2 <-list.files(d1)
        files2 <- paste0(d1,"/",files2)
        for (f2 in files2){
            temp <- readLines(f2)
            temp <- str_squish(temp)
            write(temp,file = f2)
        }
    }
}


#--------------------------------------------------------------------------------------------------------------------
#--------------------------------------------------------------------------------------------------------------------
#--------------------------------------------------------------------------------------------------------------------


#MERGING DATASETS

dir.create("./combined")
dir.create("./combined/Inertial Signals")
testfiles <- list.files(path = "./test", pattern = "\\.txt$", recursive = TRUE, full.names = TRUE)
trainfiles <- list.files(path = "./train", pattern = "\\.txt$", recursive = TRUE, full.names = TRUE)
mydirs <- list.dirs()
n <- length(testfiles)
if(length(trainfiles) != n){
    print("Error: Different no. of files in train and test")
    return
}
for (i in 1:n){
    temptest <- readLines(testfiles[i])
    temptrain <- readLines(trainfiles[i])
    tempcombined <- append(temptest,temptrain)
    write(tempcombined, file = gsub("test","combined",testfiles[i]))
}



#--------------------------------------------------------------------------------------------------------------------
#--------------------------------------------------------------------------------------------------------------------
#--------------------------------------------------------------------------------------------------------------------



#EXTRACTING MODIFYING AND LABELING DATASET

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




#--------------------------------------------------------------------------------------------------------------------
#--------------------------------------------------------------------------------------------------------------------
#--------------------------------------------------------------------------------------------------------------------



#CREATING TIDY DATASET

dataset <- read.delim("./combined/dataset.txt", sep = " ", stringsAsFactors = TRUE)

#dataset$Activity <- as.factor(dataset$Activity)

label <- levels(dataset$Activity)

dataset$Activity <- as.numeric(dataset$Activity)

split_factor <- list(dataset$Subject_ID, dataset$Activity)
s <- split(dataset,split_factor)

final_dataset <- as.data.frame( t(sapply(s, colMeans)) )


final_dataset$Activity <- label[final_dataset$Activity]

write.table(final_dataset, file = "./combined/final dataset.txt")



#---------------------------------------------------THE-----------------------------------------------------------------
#----------------------------------------------------END----------------------------------------------------------------
#-------------------------------------------------------!!!-------------------------------------------------------------