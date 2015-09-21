#Part 3 of Programming Assignment 1 for R Programming

corr <- function(directory, threshold = 0) {
    #use dplyr
    install.packages("dplyr")
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
    corList <- vector("list")    
    for (i in filePaths) {
        file <- read.csv(i)
        correlation <- cor(file$sulfate, file$nitrate, use = "complete")
        corList <- c(corList, correlation) 
    }
    
    #calculate correlations for meters above treashold
    for (i in seq_along(myData)) {
        if (i == 1) {
            correlations <- cor(myData$sulfate[1], myData$nitrate[1])
        } else {
            correlations <- c(correlations, cor(myData$sulfate[i], myData$nitrate[i]))
        }
    }
    
    ## 'directory' is a character vector of length 1 indicating
    ## the location of the CSV files
    
    ## 'threshold' is a numeric vector of length 1 indicating the
    ## number of completely observed observations (on all
    ## variables) required to compute the correlation between
    ## nitrate and sulfate; the default is 0
    
    ## Return a numeric vector of correlations
    ## NOTE: Do not round the result!
}