#Part 3 of Programming Assignment 1 for R Programming

corr <- function(directory, threshold = 0) {
    #use dplyr
    #install.packages("dplyr")
    library(dplyr)
    source("complete.R")
    
    #get number of compete cases for all files
    complete <- complete(directory)
    
    #find the IDs of meters that meet the threshold
    indexes <- filter(complete, complete$nobs > threshold)
    
    #create full path assuming the folder is in the current working directory
    #(sample input showed just a folder name being passed)
    directory <- paste("./", directory, sep = "")
    
    #load .csv files for locations above threshold based on coputed IDs from indexes
    fileNames <- list.files(directory)
    filePaths <- file.path(directory, fileNames[indexes$id])
    
#     myData <- read.csv(filePaths[1])
#     myData <- c(myData, read.csv(filePaths[2]))
    corList <- vector()    
    for (i in filePaths) {
        file <- read.csv(i)
        correlation <- cor(file$sulfate, file$nitrate, use = "complete")
        corList <- c(corList, correlation) 
    }
    
    #return
    corList
    
}