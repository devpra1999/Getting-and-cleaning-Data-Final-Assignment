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