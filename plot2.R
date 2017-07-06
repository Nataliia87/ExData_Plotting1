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
## Making a Date/Time variable combining date and time that we have in our dataset
dates<-newdata$Date
times<-newdata$Time
x<-paste(dates,times)
x<-as.POSIXct(x,format="%d/%m/%Y %H:%M:%S")
## Creating a PNG file
png(filename = "plot2.png",width = 480, height = 480)
## Plotting a graph
plot(x,newdata$Global_active_power,"l",xlab = "",ylab = "Global Active Power(kilowatts)")
## Closing graphics devise.
dev.off()
## Our histogramm ready and located in folder that is your working directory.