rankhospital <- function(state, outcome, num = "best") {
    ## Read outcome data
    
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
    
    myData[, col] <- as.numeric(myData[,col])
    df = myData[myData[, 7] == state, c(2, col)]
    df = na.omit(df)
    nhospital = nrow(df)
    switch(num, best = {
        num = 1
    }, worst = {
        num = nhospital
    })
    if (num > nhospital) {
        return(NA)
    }
    ## Return hospital name in that state with the given rank 30-day death rate
    
    o = order(df[, 2], df[, 1])
    suppressWarnings(df[o, ][num, 1])
    
}