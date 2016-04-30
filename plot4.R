#Read the data
data<-read.table("data/household_power_consumption.txt",header = TRUE, sep= ";", stringsAsFactors = FALSE)

#Transform Data
data$Date <- as.Date(data$Date, format="%d/%m/%Y")

#Filter the data (choose only 2-days we need)
Sub_data <- subset(data, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))
str(Sub_data)

#Create DateTime column
Sub_data$DateTime <- strptime(paste(Sub_data$Date, Sub_data$Time, sep=" "), "%Y-%m-%d %H:%M:%S") 

#Plotting observations
png("plot4.png", width=480, height=480)
par(mfrow = c(2, 2)) 

plot(Sub_data$DateTime, Sub_data$Global_active_power, type="l", xlab="", ylab="Global Active Power")

plot(Sub_data$DateTime, Sub_data$Voltage, type="l", xlab="datetime", ylab="Voltage")

plot(Sub_data$DateTime, Sub_data$Sub_metering_1, type="l", xlab="", ylab="Energy Submetering")
lines(Sub_data$DateTime, Sub_data$Sub_metering_2, type="l", col="red")
lines(Sub_data$DateTime, Sub_data$Sub_metering_3, type="l", col="blue")
legend('topright', names(Sub_data)[7:9], lty=c(1,1,1), col=c("black","red","blue"))

plot(Sub_data$DateTime, Sub_data$Global_reactive_power, type="l", xlab="datetime", ylab="Global_reactive_power")

dev.off() 
