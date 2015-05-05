library(dplyr)
library(lubridate)
setClass('ldDate')
setAs("character","ldDate", function(from) dmy(from)) 
pwr = read.table("household_power_consumption.txt", sep=";", header=TRUE, na.strings="?",
                 colClasses=c("ldDate","character","numeric","numeric","numeric","numeric","numeric","numeric","numeric"))

# Filter for just the dates asked for in the project instructions
pwrsub = filter(pwr, Date >= as.POSIXlt("2007-01-31") & Date <= as.POSIXlt("2007-02-02"))

# Plot 1
png("plot1.png", 480, 480)
hist(pwrsub$Global_active_power,col="red",main="Global Active Power",xlab="Global Active Power (kilowatts)")
dev.off()

