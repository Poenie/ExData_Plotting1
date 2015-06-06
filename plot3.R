##set the datafile location variable
dataFile <- "household_power_consumption.txt"

##read the data
data <- read.table(dataFile, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")

subSetData <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]

##Set date time to correct format
datetime <- strptime(paste(subSetData$Date, subSetData$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 

##cast GlobalActivePower to numeric
globalActivePower <- as.numeric(subSetData$Global_active_power)

##cast metering to numeric
subMetering1 <- as.numeric(subSetData$Sub_metering_1)
subMetering2 <- as.numeric(subSetData$Sub_metering_2)
subMetering3 <- as.numeric(subSetData$Sub_metering_3)

##create png file
png("plot3.png", width=480, height=480)

##instruction asks for a plot, add first measurement
plot(datetime, subMetering1, type="l", ylab="Energy Submetering", xlab="")

## add lines/measurements for additional submetering
lines(datetime, subMetering2, type="l", col="red")
lines(datetime, subMetering3, type="l", col="blue")

##add a legend
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"))

##always remember to finalise with dev.off
dev.off()