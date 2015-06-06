##set the datafile location variable
dataFile <- "household_power_consumption.txt"

##read the data
data <- read.table(dataFile, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")

##subset dataset, only need data between certain dates
subSetData <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]

##cast GlobalActivePower to numeric
globalActivePower <- as.numeric(subSetData$Global_active_power)

##create png file
png("plot1.png", width=480, height=480)

##instruction asks for a histogram plot
hist(globalActivePower, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")

##always remember to finalise with dev.off
dev.off()
