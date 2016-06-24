#plot2.R
library(dplyr)

# reading the dataset 
pc<-read.table("household_power_consumption.txt", header=TRUE, sep=";")

# subsetting and converting date and time
pc<-filter(pc, Date=="1/2/2007"|Date=="2/2/2007")
pc$daytime <- strptime(paste(pc$Date, pc$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 

#create plot2
png("plot2.png", width=480, height = 480)
with(pc, plot(daytime, Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)"))
dev.off()
#names of the days are in dutch