## Set your Working Directory to the folder, where is located your dataset.
## Downloading packages
library(data.table)
library(dplyr)
library(graphics)
## Fast reading of dataset
data<-fread("household_power_consumption.txt")
## Making a data frame for comfort using
data<-as.data.frame(data)
## Checking what is our dataset looks like
head(data)
## Making a vector of dates,that we need for our work
dates<-c("1/2/2007","2/2/2007")
## Creating new data with only values that we need
newdata<-filter(data,Date %in% dates)
## For plotting we need our values to be numeric
newdata<-mutate(newdata,Global_active_power=as.numeric(newdata$Global_active_power))
## Creating a PNG file
png(filename = "plot1.png",width = 480, height = 480)
## Plotting a histogramm
hist(newdata1$Global_active_power,col = "red",main = "Global Active Power",xlab = "Global Active Power(kilowatts)")
## Closing graphics devise.
dev.off()
## Our histogramm ready and located in folder that is your working directory.