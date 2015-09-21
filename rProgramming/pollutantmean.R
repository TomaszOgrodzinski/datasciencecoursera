#Part 1 of Programming Assignment 1 for R Programming

#My directory path
myDir <- "/Users/tomasz/Klipfolio/Coursera/rProgramming/specdata/"

pollutantmean <- function(directory = "specdata", pollutant = "sulfate", id = 1:332) {
    
    #create full path assuming the folder is in the current working directory
    #(sample input showed just a folder name being passed)
    directory <- paste("./", directory, sep = "")
    
    #Read the data into a data frame
    fileNames <- list.files(directory)
    filePaths <- file.path(directory, fileNames[id])
    
    for (i in seq_along(filePaths)) {
        if (i == 1) {
            myData <- read.csv(filePaths[1])
        } else {
            myData <- rbind(myData,read.csv(filePaths[i]))
        }
    }
    
    #calculate mean
    #note that the sample output is rounded
    #but assignment says do not round, so this should output the right stuff
    if (pollutant == "sulfate") {
        mean(myData$sulfate,na.rm = T)
    } else if (pollutant == "nitrate"){
        mean(myData[[pollutant]],na.rm = T)
    }
    
}