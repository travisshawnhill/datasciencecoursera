rankall2 <- function(outcome, num = "best") {
    ## Read the outcome data
    dat <- read.csv("outcome-of-care-measures.csv", colClasses = "character")
    ## Check that state and outcome are valid
    states = unique(dat[, 7])
    switch(outcome, `heart attack` = {
        col = 11
    }, `heart failure` = {
        col = 17
    }, pneumonia = {
        col = 23
    }, stop("invalid outcome"))
    
    ## Return hospital name in that state with the given rank 30-day death rate
    dat[, col] = as.numeric(dat[, col])
    dat = dat[, c(2, 9, col)]  # leave only name, state, and death rate
    dat = na.omit(dat)
    head(dat)
}