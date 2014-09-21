rankall <- function(outcome, num = "best")
{
file <- read.csv("rprog-data-ProgAssignment3-data/outcome-of-care-measures.csv",colClasses="character")
outcomes <- c("heart attack","heart failure","pneumonia")

temp <- data.frame("hospital"=character(), "state"=character())
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
file <- file[file[outcome]!='Not Available',]
file[outcome] <- as.data.frame(sapply(file[outcome], as.numeric))
file <- file[order(file$Hospital.Name),]
file <- file[order(file[outcome]), ]

states <- file$State
states <- unique(states)
for(stat in states)
{
file1 <- file[file$State==stat,] 
data <- file1[,outcome]
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
name <- file1[rowindex,2]
temp <- rbind(temp,data.frame(hospital = name,state = stat))
}
temp <- temp[order(temp['state']),]
temp
}