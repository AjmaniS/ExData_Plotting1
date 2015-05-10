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

###creating plot 1 histogram###
png(filename='plot1.png',width=480,height=480,units='px')
hist(hpcdata.sbst$Global_active_power,main='Global Active Power',xlab='Global Active Power (kilowatts)',col='red')
dd<-dev.off()

