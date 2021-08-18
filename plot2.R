setwd("C:/Users/user/Desktop/ExData_Plotting1")
power<-read.table("household_power_consumption.txt", sep = ";")
names(power) <- c("Date","Time","Global_active_power",
                  "Global_reactive_power","Voltage",
                  "Global_intensity","Sub_metering_1",
                  "Sub_metering_2","Sub_metering_3")
power_1 <- subset(power,power$Date=="1/2/2007" | power$Date =="2/2/2007")
timedate <- strptime(paste(power_1$Date, power_1$Time, sep=" "), "%d/%m/%Y %H:%M:%S")

png("Plot2.png" ,width = 480, height = 480))
with(power_1, plot(timedate, Global_active_power, type="l", 
                      xlab="Day", ylab="Global Active Power (kilowatts)"))

dev.off()
