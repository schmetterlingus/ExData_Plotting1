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

# Plot 3
png(file = "plot3.png", bg = "transparent", width = 480, height = 480)
with(myplots,{
     plot(datetime, f2f(Sub_metering_1), type="l", xlab="", ylab = "Energy sub metering")
     points(datetime, f2f(Sub_metering_2), type = "l", lwd = 1, col = "red")
     points(datetime, f2f(Sub_metering_3), type = "l", lwd = 1, col = "blue")
     legend("topright", legend = names(myplots)[7:9], col = c("black","red","blue"), lwd = 1)
})
dev.off()