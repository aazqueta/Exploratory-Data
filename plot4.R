library(gdata)
library(chron)
library(sqldf)
library(RMySQL)
library(RSQLite)
library(ggplot2)
library(lubridate)
library(pryr)
library(tcltk2)

## Reading the data with SQL program 

alldata<- c("C:/Users/Andres/Desktop/Online_courses/Exploratory Analysis/Project_1/household_power_consumption.txt")
data <- read.csv.sql(alldata, sql = 'select * from file where Date = "1/2/2007" OR Date = "2/2/2007"',
                     header = TRUE, sep = ";")
png(file="plot4.png")

# Specifying the X-Axes
time<-wday(data$Date, label = TRUE, abbr = TRUE)


# Arrangement of the figures
par(mfrow=c(2,2))

# Subplot 1

Global_active_power<-data$Global_active_power

plot(Global_active_power , type="l",ylab = "Global Active Power ", xlab="", xaxt="n" )

axis(1, at=c(1,length(time)/2+1,length(time) ),
  labels=c( toString(time[1]), toString(time[length(time)/2+1]), "Sat"),
         tck=-0.01)

# Subplot 2 
  
Voltage<-data$Voltage

plot(Voltage , type="l",ylab = "Voltage", xlab="datetime", xaxt="n" )

axis(1, at=c(1,length(time)/2+1,length(time) ),
         labels=c( toString(time[1]), toString(time[length(time)/2+1]), "Sat"),
         tck=-0.01)

  
# Subplot 3 
  
Sub_metering_1<-data$Sub_metering_1
Sub_metering_2<-data$Sub_metering_2
Sub_metering_3<-data$Sub_metering_3

plot(Sub_metering_1 , type="l",ylab = "Energy Sub metering", xlab="", col="black", xaxt="n" )
lines(Sub_metering_2, col="red1")
lines(Sub_metering_3, col="blue")

axis(1, at=c(1,length(y)/2+1,length(y) ),
         labels=c( toString(time[1]), toString(time[length(time)/2+1]), "Sat"),
         tck=-0.01)

legend("topright", inset=.05, bty=0,
          + c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lwd=1, lty=1, col=c("black", "red1", "blue"), horiz=FALSE)

# Subplot 4 
  
  
Global_reactive_power<-data$Global_reactive_power

  
plot(Global_reactive_power , type="l",xlab="datetime", xaxt="n" )

axis(1, at=c(1,length(time)/2+1,length(time) ),
         labels=c( toString(time[1]), toString(time[length(time)/2+1]), "Sat"),
         tck=-0.01)


dev.off()
