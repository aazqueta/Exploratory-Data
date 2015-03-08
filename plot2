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

## Creating the graph

png(file="plot2.png")
time<-wday(data$Date, label = TRUE, abbr = TRUE)

Global_active_power<-data$Global_active_power

plot(Global_active_power , type="l",ylab = "Global Active Power (Kilowatts)", xaxt="n" )
axis(1, at=c(1,length(time)/2+2,length(time) ),
     labels=c( toString(time[1]), toString(time[length(time)/2+1]), "Sat"), 
     tck=-0.02)

dev.off()
