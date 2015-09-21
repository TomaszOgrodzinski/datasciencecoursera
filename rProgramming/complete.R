#Part 2 of Programming Assignment 1 for R Programming

complete <- function(directory = "specdata", id = 1:332) {
    
    #create full path assuming the folder is in the current working directory
    #(sample input showed just a folder name being passed)
    path <- paste("./", directory, sep = "")
    
    #Read the data into a data frame
    fileNames <- list.files(path)
    filePaths <- file.path(path, fileNames[id])
    
    for (i in seq_along(filePaths)) {
        if (i == 1) {
            myData <- read.csv(filePaths[1])
            #How many of these are complete cases
            numComplete <- length(which(complete.cases(myData)))
            #Data frame that will be populated with complete cases
            output <- data.frame(id = id[1], nobs = numComplete) 
        } else {
            myData <- read.csv(filePaths[i])
            numComplete <- length(which(complete.cases(myData)))
            output <- rbind(output, c(id[i], numComplete))
            #print(str(myData))
        }
    }
    
    output
    
    ## 'directory' is a character vector of length 1 indicating
    ## the location of the CSV files
    
    ## 'id' is an integer vector indicating the monitor ID numbers
    ## to be used
    
    ## Return a data frame of the form:
    ## id nobs
    ## 1  117
    ## 2  1041
    ## ...
    ## where 'id' is the monitor ID number and 'nobs' is the
    ## number of complete cases
}