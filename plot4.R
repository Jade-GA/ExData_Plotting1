setwd("C:/Users/user/Desktop/ExData_Plotting1")
power<-read.table("household_power_consumption.txt", sep = ";")
names(power) <- c("Date","Time","Global_active_power",
                  "Global_reactive_power","Voltage",
                  "Global_intensity","Sub_metering_1",
                  "Sub_metering_2","Sub_metering_3")
power_1 <- subset(power,power$Date=="1/2/2007" | power$Date =="2/2/2007")
timedate <- strptime(paste(power_1$Date, power_1$Time, sep=" "), "%d/%m/%Y %H:%M:%S")
fulldata<-cbind(power_1, timedate)

png("plot4.png", width = 480, height = 480)
par(mfrow=c(2,2))
with(power_1, plot(timedate, Global_active_power, type="l", 
                   xlab="", ylab="Global Active Power (kilowatts)"))
with(power_1, plot(timedate, Voltage, type="l", 
                   xlab="datetime", ylab="Voltage"))

with(fulldata, plot(fulldata$timedate, fulldata$Sub_metering_1, type="l", xlab="Day", 
                    ylab="Energy sub metering"))
lines(fulldata$timedate,fulldata$Sub_metering_2,type="l", col= "red")
lines(fulldata$timedate, fulldata$Sub_metering_3,type="l", col= "blue")
legend("topright"
       , col=c("black","red","blue")
       , c("Sub_metering_1  ","Sub_metering_2  ", "Sub_metering_3  ")
       ,lty=c(1,1), lwd=c(1,1))

with(power_1, plot(timedate, Global_reactive_power, type="l", 
                   xlab="datetime", ylab="Global_reactive_power"))
dev.off()
