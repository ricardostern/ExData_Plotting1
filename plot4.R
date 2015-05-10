plot4 <- function()
{
  ## Read, subset and covert dates/times
  elecpower <- read.csv("household_power_consumption.txt", na.strings ="?", sep = ';', as.is=TRUE)
  target <- elecpower[elecpower$Date == "1/2/2007" | elecpower$Date == "2/2/2007",]
  target[["Time"]] = strptime(paste(target$Date, target$Time), format ="%d/%m/%Y %H:%M:%S")
  target[["Date"]] = as.Date(target[["Date"]],format = "%d/%m/%Y")
  
  ## Open PNG device
  png(file="plot4.png", width=480, height=480)
  
  ## Set canvas to 2 chart columns x 2 chart lines
  par(mfrow = c(2, 2))
  
  ## Draw chart 1,1
  with(target, plot(Time, Global_active_power, type="l", xlab = "", ylab = "Global Active Power (kilowatts)"))

  ## Draw chart 1,2
  with(target, plot(Time, Voltage, type="l", xlab = "datetime"))
  
  ## Draw chart 2,1
  with(target, plot(Time, Sub_metering_1, type="l", xlab = "", ylab = "Energy sub metering"))
  with(target, lines(Time, Sub_metering_2, col = "red"))
  with(target, lines(Time, Sub_metering_3, col = "blue"))
  legend("topright", col=c("black","blue","red"), legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), lwd = 1)
  
  ## Draw chart 2,2
  with(target, plot(Time, Global_reactive_power, type="l", xlab = "datetime"))
  
  ## Close device
  dev.off()
}