library(sqldf)
data <- read.csv.sql("household_power_consumption.txt", sql = "select * from file where Date in ('1/2/2007','2/2/2007')", sep = ";")
data$Time <- paste(data$Date, data$Time, sep=" ")
data$Date <- as.Date(data$Date, format="%d/%m/%Y")
data$Time <- strptime(data$Time, format='%d/%m/%Y %H:%M:%S')
par(mfcol=c(2,2))
hist(data$Global_active_power, col = "Red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)")
plot(data$Time, data$Sub_metering_1, type="l", xlab="", ylab="Energy Sub Metering")
points(data$Time, data$Sub_metering_2, type="l", col = "Red")
points(data$Time, data$Sub_metering_3, type="l", col = "blue")
legend("topright",c("Sub_metering_1","Sub_metering_2", "Sub_metering_3"), col = c("black","red","blue"), lty=c(1, 1, 1), bty="n")
plot(data$Time, data$Voltage, type="l", xlab="Datetime", ylab="Voltage")
plot(data$Time, data$Global_reactive_power, type="l", xlab="Datetime", ylab="Global_reactive_power")
dev.copy(png, file="plot4.png")
dev.off()
closeAllConnections()