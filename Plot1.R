#plot1.R
library(dplyr)

# reading the dataset 
pc<-read.table("household_power_consumption.txt", header=TRUE, sep=";")

# subsetting and converting date and time
pc<-filter(pc, Date=="1/2/2007"|Date=="2/2/2007")
pc$daytime <- strptime(paste(pc$Date, pc$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 

#create plot1
pc$Global_active_power<-as.numeric(as.character(pc$Global_active_power))
png("plot1.png", width=480, height = 480)
hist(pc$Global_active_power, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")
dev.off()
