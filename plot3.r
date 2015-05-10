#set working directory (by setwd() command) to where your datafile is placed i.e. "household_power_consumption.txt"

#clear workspace
rm(list=ls())

#check and install the missing packages
list.of.packages <- c("data.table", "lubridate")
new.packages <- list.of.packages[!(list.of.packages %in% installed.packages()[,"Package"])]
if(length(new.packages)) install.packages(new.packages)

#loading the packages
library(data.table)
library(lubridate)

#load data
sfile<- "household_power_consumption.txt"
hpcdata <- read.table(sfile,header=TRUE,sep=";",colClasses=c("character", "character", rep("numeric",7)),na="?")

#subsetting data for date 1/2/2007 and 2/2/2007
hpcdata.sbst<-hpcdata[hpcdata$Date=='1/2/2007' | hpcdata$Date=='2/2/2007',]

#remove whole data containing variable 
rm(hpcdata)

# Convert dates
hpcdata.sbst$DateTime<-dmy(hpcdata.sbst$Date)+hms(hpcdata.sbst$Time)
hpcdata.sbst<-hpcdata.sbst[,c(10,3:9)]

###creating plot 3 with  multiple lines in graph###
png(filename='plot3.png',width=480,height=480,units='px')
plot(hpcdata.sbst$DateTime,hpcdata.sbst$Sub_metering_1,type='l',col='black',xlab='',ylab='Energy sub metering')
lines(hpcdata.sbst$DateTime,hpcdata.sbst$Sub_metering_2,col='red')
lines(hpcdata.sbst$DateTime,hpcdata.sbst$Sub_metering_3,col='blue')
legend('topright',legend=c('Sub_metering_1','Sub_metering_2','Sub_metering_3'),col=c('black','red','blue'),lty='solid')
dd<-dev.off()





