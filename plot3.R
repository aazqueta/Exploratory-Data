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


# Opening the plot
png(file="plot3.png") 

# set the time as X-legend 
time <- wday(data$Date, label = TRUE, abbr = TRUE)

# set the Y-legend 

sub_metering_1<-data$Sub_metering_1
sub_metering_2<-data$Sub_metering_2
sub_metering_3<-data$Sub_metering_3

# Fitting the different plots in the same graph
plot(sub_metering_1 , type="l", ylab = "Energy Sub metering", xlab="", col="black", xaxt="n" )
lines(sub_metering_2, col="red1")
lines(sub_metering_3, col="blue")

#Costumizing the x axis
axis(1, at=c(1,length(time)/2+1,length(time) ), 
     labels=c( toString(time[1]), toString(time[length(time)/2+1]), "Sat"),               
     tck=-0.01)

#Adding the leggend to the plots
legend("topright", inset=.001,
       c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lwd=1, lty=1, col=c("black", "red1", "blue"),  horiz=FALSE)

dev.off()
