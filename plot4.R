## plot4()
##
## Purpose: Look at time-series data, plotting various components of power consumption for two days in February
##
## Note: Assumes the dataset has already been unzipped and is sitting in the current working directory

plot4 <- function() {
  ## Read in the data
  data <- read.table("household_power_consumption.txt", header = T, sep = ";", colClasses = c(NA, NA, "numeric", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric"), stringsAsFactors = F, na.strings = "?")
  
  ## Convert dates/times from character
  data$Date <- as.Date(data$Date, format = "%d/%m/%Y")
  data$Time <- strptime(data$Time, format = "%H:%M:%S")
  
  ## Restrict the dates to the first two days in February 2007
  data <- data[(data$Date > "2007-01-31" & data$Date < "2007-02-03"), ]
  
  
  
  ## Plot time series of various energy consumption variables; generate PNG
  png(filename = "plot4.png")
  
  par(mfrow = c(2, 2))
  
  plot(data$DateTime, data$Global_active_power, type = "n", xlab = "", ylab = "Global Active Power (kilowatts)")
  lines(data$DateTime, data$Global_active_power)
  
  plot(data$DateTime, data$Voltage, type = "n", xlab = "datetime", ylab = "Voltage")
  lines(data$DateTime, data$Voltage)
  
  plot(data$DateTime, data$Sub_metering_1, main = "", type = "n", xlab = "", ylab = "Energy sub metering")
  lines(data$DateTime, data$Sub_metering_1)
  lines(data$DateTime, data$Sub_metering_2, col = "red")
  lines(data$DateTime, data$Sub_metering_3, col = "blue")
  legend("topright", pch = 1, col = c("black", "blue", "red"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
  
  plot(data$DateTime, data$Global_reactive_power, type = "n", xlab = "datetime", ylab = "Global_reactive_power")
  lines(data$DateTime, data$Global_reactive_power)
  
  dev.off()
}