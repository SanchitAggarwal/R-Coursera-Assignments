rankhospital <- function(state,outcome,num)
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
if(num!="best" && num!="worst" && is.numeric(num)==F)
{
stop("invalid num")
}
names(file)[11] <- "heart attack"
names(file)[17] <- "heart failure"
names(file)[23] <- "pneumonia"
file <- file[file$State==state & file[outcome]!='Not Available',]
file[outcome] <- sapply(file[outcome], as.numeric)
file <- file[order(file$Hospital.Name),]
file <- file[order(file[outcome]), ]
data <- file[,outcome]
if( num == "best" ) 
{
rowindex <- which.min(data)
} 
else if( num == "worst" ) 
{
rowindex <- which.max(data)
} 
else 
{
rowindex <- num
}
file[rowindex,2]
}