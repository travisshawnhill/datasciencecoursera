best <- function(state, outcome) {
    
    ## Read outcome data
    
    myData <- read.csv("outcome-of-care-measures.csv", colClasses = "character")
    col <- NULL
    
    ## Check that state and outcome are valid, first
    ## check to see if state is listed in file
    
    if(!state %in% unique(myData[,7])) {
        stop("Invalid State.")
    }
    
    ## Determine whether outcome is valid, if so, assign col variable to
    ## corresponding column in file
    
    switch(outcome, 
           "heart attack" = {col <- 11},
           "heart failure" = {col <- 17},
           "pneumonia" = {col <- 23},
           stop("Invalid Outcome.")
           )
    
    ## Return hospital name in that state with lowest 30-day death rate
    
    frame <- myData[myData$State == state, c(2,col)]
    suppressWarnings(frame[which.min(frame[,2]), 1])
}