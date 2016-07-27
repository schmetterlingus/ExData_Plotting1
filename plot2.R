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

# Plot 2
png(file = "plot2.png", bg = "transparent", width = 480, height = 480)
with(myplots, plot(datetime, f2f(Global_active_power), type = "l", xlab = "", ylab = "Global Active Power (kilowatts)"))
dev.off()