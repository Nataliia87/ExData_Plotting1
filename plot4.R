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
png(filename = "plot4.png",width = 480, height = 480)
par(mfcol=c(2,2))
plot(x,newdata$Global_active_power,"l",xlab = "",ylab = "Global Active Power(kilowatts)")

plot(x,newdata$Sub_metering_1,"l",xlab = "",ylab = "Energy sub metering")
lines(x,newdata$Sub_metering_2,col="red")
lines(x,newdata$Sub_metering_3,col="blue")
legend("topright",lty=1,col=c("black","red","blue"),legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))

plot(x,newdata$Voltage,"l",xlab = "datetime",ylab = "Voltage")

plot(x,newdata$Global_reactive_power,"l",xlab = "datetime",ylab = "Global_reactive_power")

## Closing graphics devise.
dev.off()
## Our histogramm ready and located in folder that is your working directory.