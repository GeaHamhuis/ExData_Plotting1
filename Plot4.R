#Plot4.R
library(dplyr)

# reading the dataset 
pc<-read.table("household_power_consumption.txt", header=TRUE, sep=";", stringsAsFactors = FALSE)

# subsetting and converting date and time
pc<-filter(pc, Date=="1/2/2007"|Date=="2/2/2007")
pc$daytime <- strptime(paste(pc$Date, pc$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 

#Create plot
png("plot4.png", width=480, height = 480)
par(mfcol=c(2,2))

#Plot 1
with(pc, plot(daytime, Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)"))

#Plot 2
pc$Sub_metering_1<-as.numeric(pc$Sub_metering_1)
pc$Sub_metering_2<-as.numeric(pc$Sub_metering_2)
pc$Sub_metering_3<-as.numeric(pc$Sub_metering_3)
plot(pc$daytime, pc$Sub_metering_1, type="l", xlab="", ylab="Energy sub metering")
lines(pc$daytime, pc$Sub_metering_2, type="l", col="red")
lines(pc$daytime, pc$Sub_metering_3, type="l", col="blue")
legend("topright", lty=1, cex=1, col=c("black", "red", "blue"), legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

#Plot 3
plot(pc$daytime, pc$Voltage, type="l", xlab="datetime", ylab="Voltage")

#Plot 4
plot(pc$daytime, pc$Global_reactive_power, type="l", xlab="datetime", ylab="Global_reactive_power")

dev.off()
par(mfcol=c(1,1))
