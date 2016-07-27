# Prepare
require(lubridate) 

f2f <- function(x) {as.numeric(as.character(x))} # Change factor to numeric

# Read in the data for dates from 2007-02-01 to 2007-02-02
myplots <- subset( 
  read.csv(file = "household_power_consumption.txt", header = T, sep = ";"),
  dmy(Date) >= "2007-02-01" & dmy(Date) <= "2007-02-02"
)
myplots$datetime <- strptime(paste(myplots$Date, myplots$Time), "%d/%m/%Y %H:%M:%S")

#grep("\\?",myplots)

# Plot 4
png(file = "plot4.png", bg = "transparent", width = 480, height = 480)
par(mar = c(4,4,1,1), oma = c(2,2,2,2), mfrow = c(2,2))
with(myplots, {
     plot(datetime, f2f(Global_active_power), type = "l", xlab="", ylab = "Global Active Power (kilowatts)")
     plot(datetime, f2f(Voltage), type = "l", xlab="datetime", ylab = "Voltage")
     plot(datetime, f2f(Sub_metering_1), type="l", ylim = c(0, 40), xlab="", ylab = "Energy sub metering")
     points(datetime, f2f(Sub_metering_2), type = "l", lwd = 1, col = "red")
     points(datetime, f2f(Sub_metering_3), type = "l", lwd = 1, col = "blue")
     legend("topright", legend = names(myplots)[7:9], col = c("black","red","blue"), lwd = 1, cex = .9, bty = "n")
     plot(datetime, f2f(Global_reactive_power), type = "l", xlab="datetime", ylab="Global_reactive_power", ylim = c(0,.5))
})
dev.off()
