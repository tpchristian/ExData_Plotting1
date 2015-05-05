library(dplyr)
library(lubridate)
setClass('ldDate')
setAs("character","ldDate", function(from) dmy(from)) 
pwr = read.table("household_power_consumption.txt", sep=";", header=TRUE, na.strings="?")
pwr <- mutate(pwr, ts=dmy_hms(paste(Date,Time,sep=" ")))

# Filter for just the dates asked for in the project instructions
pwrsub = filter(pwr, ts >= as.POSIXlt("2007-02-01 00:00:00") & ts <= as.POSIXlt("2007-02-02 23:59:59"))


# Plot 2
png("plot2.png", 480, 480)
with(pwrsub, plot(ts, Global_active_power, type="l",ylab="Global Active Power (kilowatts)",xlab=""))
dev.off()

