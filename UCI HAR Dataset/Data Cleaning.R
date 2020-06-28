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