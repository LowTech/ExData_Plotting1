## plot1()
##
## Purpose: 
##
## Note: Assumes the dataset has already been unzipped and is sitting in the current working directory

plot1 <- function() {
  ## Read in the data
  data <- read.table("household_power_consumption.txt", header = T, sep = ";", colClasses = c(NA, NA, "numeric", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric"), stringsAsFactors = F, na.strings = "?")
  
  ## Convert dates/times from character
  data$Date <- as.Date(data$Date, format = "%d/%m/%Y")
  data$Time <- strptime(data$Time, format = "%H:%M:%S")
  
  ## Restrict the dates to the first two days in February 2007
  data <- data[(data$Date > "2007-01-31" & data$Date < "2007-02-03"), ]
  
  
  
  ## Plot the Global Active Power data, by frequency; generate PNG
  png(filename = "plot1.png")
  hist(data$Global_active_power, freq = T, main = "Global Active Power", xlab = "Global Active Power (kilowatts)", col = "red")
  dev.off()
}