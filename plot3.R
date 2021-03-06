library(dplyr)
library(lubridate)
setClass('ldDate')
setAs("character","ldDate", function(from) dmy(from)) 
pwr = read.table("household_power_consumption.txt", sep=";", header=TRUE, na.strings="?")
pwr <- mutate(pwr, ts=dmy_hms(paste(Date,Time,sep=" ")))

# Filter for just the dates asked for in the project instructions
pwrsub = filter(pwr, ts >= as.POSIXlt("2007-02-01 00:00:00") & ts <= as.POSIXlt("2007-02-02 23:59:59"))


# Plot 3
png("plot3.png", 480, 480)
with(pwrsub, plot(ts, Sub_metering_1, type="l",ylab="Energy sub metering",xlab=""))
with(pwrsub, lines(ts, Sub_metering_2, col='red'))
with(pwrsub, lines(ts, Sub_metering_3, col='blue'))
legend('topright', legend=c('Sub_metering_1', 'Sub_metering_2', 'Sub_metering_3'), col=c('black', 'red', 'blue'), 
       lty='solid')

dev.off()
