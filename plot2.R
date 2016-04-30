#Read the data
data<-read.table("data/household_power_consumption.txt",header = TRUE, sep= ";", stringsAsFactors = FALSE)

#Transform Date to Data format
data$Date <- as.Date(data$Date, format="%d/%m/%Y")

#Filter the data (choose only 2-days we need)
Sub_data <- subset(data, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))
str(Sub_data)

#Create DateTime column
Sub_data$DateTime <- strptime(paste(Sub_data$Date, Sub_data$Time, sep=" "), "%Y-%m-%d %H:%M:%S") 

#Plotting observations
plot(Sub_data$DateTime, Sub_data$Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)")

#Save into a PNG file
dev.copy(png, file="plot2.png", height=480, width=480)
dev.off() 