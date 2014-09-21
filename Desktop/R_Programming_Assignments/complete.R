complete <- function(directory, id = 1:332) 
{
nobs <- numeric()
for(i in id)
{
file <- sprintf("%03d.csv",i)
data <- read.csv(paste(directory,"/",file,sep=""))
nobs <- c(nobs,sum(complete.cases(data)))
}
return (data.frame(id,nobs))
}