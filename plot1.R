plot1 <- function()
{
  ## Read, subset and covert dates/times
  elecpower <- read.csv("household_power_consumption.txt", na.strings ="?", sep = ';', as.is=TRUE)
  target <- elecpower[elecpower$Date == "1/2/2007" | elecpower$Date == "2/2/2007",]
  target[["Time"]] = strptime(paste(target$Date, target$Time), format ="%d/%m/%Y %H:%M:%S")
  target[["Date"]] = as.Date(target[["Date"]],format = "%d/%m/%Y")
  
  ## Open PNG device
  png(file="plot1.png", width=480, height=480)
    
  ## Draw chart
  hist(target$Global_active_power, col = 'red', main = "Global Active Power", xlab = "Global Active Power (kilowatts)")
  
  ## Close device
  dev.off()
}