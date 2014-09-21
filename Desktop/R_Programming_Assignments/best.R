best <- function(state,outcome)
{
file <- read.csv("rprog-data-ProgAssignment3-data/outcome-of-care-measures.csv",colClasses="character")
states <- file$State
states <- unique(states)
outcomes <- c("heart attack","heart failure","pneumonia")
if(state %in% states == F)
{
stop("invalid state")
}
if(outcome %in% outcomes == F)
{
stop("invalid outcome")
}
names(file)[11] <- "heart attack"
names(file)[17] <- "heart failure"
names(file)[23] <- "pneumonia"
file <- file[file$State==state & file[outcome]!='Not Available',]
file <- file[order(file$Hospital.Name),]
data <- file[,outcome]
rowindex <- which.min(data)
file[rowindex,2]
}