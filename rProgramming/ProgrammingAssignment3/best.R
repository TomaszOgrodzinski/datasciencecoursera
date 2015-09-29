## RProgramming - Assignment 3

best <- function(state, outcome) {
    ## Read outcome data
    data <- read.csv("outcome-of-care-measures.csv")
    
    ## Check that state and outcome are valid
    if (!(state == "a" || state =="b" || state == "c")) {
        print("invalid state") #replace with error throw
    }
    if (!(outcome == "a" || outcome =="b" || outcome == "c")) {
        print("invalid outcome") #replace with error throw      
    }
    
    ## Return hospital name in that state with lowest 30-day death
    ## rate
}