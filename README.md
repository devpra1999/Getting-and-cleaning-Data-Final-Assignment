# Getting-and-cleaning-Data-Final-Assignment

## How to test the code?

Download the run_analysis.R script in a separate directory(without any of the data files used in the assignment) and run it. A folder called **combined** will be created. The text file called **final dataset.txt** is the tidy data set. It is **space(" ") delimited**.

## Details of the assignment

The given project can be divided into 5 parts(each having an individual R script named same as the names of the parts) integrated into a single R script called run_analysis.R
All of these parts **must** be run **sequentially** to get valid results.

Use the codebook to get details about the various files and variables in the directory

The parts are as follows:

## 1. Loading Dataset

In this part, I downloaded the zip folder given on the link and unzipped it's files. I also shifted the working directory to the UCI HAR Dataset folder.

## 2. Data Cleaning
In this part, I read each file(.txt) by iterating and removed the leading white spaces using the str_squish() function of stringr library and wrote the cleaned files back to the original files as text files **without** the table formatting

## 3. Merging Datasets

In this part, I merged all the testing and training data files(.txt) and wrote them into separate text files, separately in the combined folder(with table formatting).

## 4. Extracting Modifying and Labeling Datasets

In this part, I selected the mean and std variables from X_combined.txt(indices identified using feature.txt) and the variable names were updated to remove special characters. Two additional columns called Subject_ID(from subject_combined.txt) and Activity(from y_combined.txt) were added at the beginning and written into the **dataset.txt** file in the **combined** folder.

## 5. Creating Tidy Dataset

In this part, the data in the **dataset.txt** file was summarised according to the Subject_ID and Activity, i.e. the values of other variables were averaged for each unique grouping of Subject_ID and Activity. The final table was written into the file called **final dataset.txt**

## Special Notes:
Packages used : stringr
