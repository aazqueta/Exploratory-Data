
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

data
png(file="plot1.png") 
hist(data$Global_active_power, col="red1", border="black", main = "Global Active Power",
     xlab = "Global Active Power (Kilowatts)", ylab="Frequency")
dev.off()
