pollutantmean <- function(directory,pollutant,id = 1:332)
{
vals <- numeric()
for(i in id)
{
file <- sprintf("%03d.csv",i)
data <- read.csv(paste(directory,"/",file,sep = ""))
vals <- c(vals,data[[pollutant]])
}
return (round(mean(vals,na.rm=TRUE),digits=3))
}





