dataset <- read.delim("./combined/dataset.txt", sep = " ", stringsAsFactors = TRUE)

#dataset$Activity <- as.factor(dataset$Activity)

label <- levels(dataset$Activity)

dataset$Activity <- as.numeric(dataset$Activity)

split_factor <- list(dataset$Subject_ID, dataset$Activity)
s <- split(dataset,split_factor)

final_dataset <- as.data.frame( t(sapply(s, colMeans)) )


final_dataset$Activity <- label[final_dataset$Activity]

write.table(final_dataset, file = "./combined/final dataset.txt", row.names = FALSE)