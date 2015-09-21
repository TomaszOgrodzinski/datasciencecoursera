#Part 1 of Programming Assignment 1 for R Programming

#My directory path
myDir <- "/Users/tomasz/Klipfolio/Coursera/rProgramming/specdata/"

pollutantmean <- function(directory = "specdata", pollutant = "sulfur", id = 1:332) {
    ## 'directory' is a character vector of length 1 indicating
    ## the location of the CSV files
    #directory <- paste("./", directory, sep = "")
    setwd(paste("./", directory, sep = ""))
    
    ##Read in the data
    #read.csv(c(directory,as.character(id),".csv"))
    filePaths <- paste(directory, list.files(path = directory, pattern = "*.csv"), sep = "")
    myData <- sapply(filePaths[id], read.csv())
    
#      myFiles <- vector("list")
#      for (x in dir(paste("./", directory, sep = ""))) {
#          c(myFiles, x)
#      }

    ## 'pollutant' is a character vector of length 1 indicating
    ## the name of the pollutant for which we will calculate the
    ## mean; either "sulfate" or "nitrate".
    
    #myMean <- sapply(myData, )
    
    ## 'id' is an integer vector indicating the monitor ID numbers
    ## to be used
    
    ## Return the mean of the pollutant across all monitors list
    ## in the 'id' vector (ignoring NA values)
    ## NOTE: Do not round the result!
}