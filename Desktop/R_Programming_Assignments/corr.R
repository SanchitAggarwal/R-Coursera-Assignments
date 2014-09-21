corr <- function(directory, threshold = 0) 
{
corr <- numeric()
temp <- list.files(directory)
for(i in temp)
{
data <- read.csv(paste(directory,"/",i,sep=""))
nobs <- sum(complete.cases(data))
dff <- data[complete.cases(data),]
if(threshold<nobs)
{
corr <- c(corr,(cor(dff[["sulfate"]],dff[["nitrate"]])))
}
}
return (corr)
}