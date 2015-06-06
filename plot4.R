##set the datafile location variable
dataFile <- "household_power_consumption.txt"

##read the data
data <- read.table(dataFile, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")

subSetData <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]

##Set date time to correct format
datetime <- strptime(paste(subSetData$Date, subSetData$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 

##cast GlobalActivePower to numeric
globalActivePower <- as.numeric(subSetData$Global_active_power)
##cast GlobalReActivePower to numeric
globalReactivePower <- as.numeric(subSetData$Global_reactive_power)
##cast Voltage to numeric
voltage <- as.numeric(subSetData$Voltage)

##cast metering to numeric
subMetering1 <- as.numeric(subSetData$Sub_metering_1)
subMetering2 <- as.numeric(subSetData$Sub_metering_2)
subMetering3 <- as.numeric(subSetData$Sub_metering_3)

## initialise png plot file
png("plot4.png", width=480, height=480)

## instruction asks for 4 plots, 2 columns and 2 rows
par(mfrow = c(2, 2)) 

##first plot 
plot(datetime, globalActivePower, type="l", xlab="", ylab="Global Active Power", cex=0.2)

##second plot
plot(datetime, voltage, type="l", xlab="datetime", ylab="Voltage")

## third plot
plot(datetime, subMetering1, type="l", ylab="Energy Submetering", xlab="")
lines(datetime, subMetering2, type="l", col="red")
lines(datetime, subMetering3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=, lwd=2.5, col=c("black", "red", "blue"), bty="o")

## fourth plot measure reactive power
plot(datetime, globalReactivePower, type="l", xlab="datetime", ylab="Global_reactive_power")

## always remember dev.off
dev.off()
