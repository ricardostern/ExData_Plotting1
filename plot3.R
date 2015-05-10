plot3 <- function()
{
  ## Read, subset and covert dates/times
  elecpower <- read.csv("household_power_consumption.txt", na.strings ="?", sep = ';', as.is=TRUE)
  target <- elecpower[elecpower$Date == "1/2/2007" | elecpower$Date == "2/2/2007",]
  target[["Time"]] = strptime(paste(target$Date, target$Time), format ="%d/%m/%Y %H:%M:%S")
  target[["Date"]] = as.Date(target[["Date"]],format = "%d/%m/%Y")
  
  ## Open PNG device
  png(file="plot3.png", width=480, height=480)
  
  ## Draw chart
  with(target, plot(Time, Sub_metering_1, type="l", xlab = "", ylab = "Energy sub metering"))
  with(target, lines(Time, Sub_metering_2, col = "red"))
  with(target, lines(Time, Sub_metering_3, col = "blue"))
  legend("topright", col=c("black","blue","red"), legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), lwd = 1)
  
  ## Close device
  dev.off()
}