############################################################################
## Exploratory data analysis
## Assignment 1 - Plot 3
############################################################################
## Assuming the data is already downloaded into data folder in working directory

##Load the data
householdData <- read.table("data/household_power_consumption.txt", sep=";", header=TRUE)
##Subsetting required data
subsetData <- subset(householdData, Date == "1/2/2007" | Date == "2/2/2007")
##Format Data and Time columns into a single Datetime column
subsetData$DateTime <- strptime(paste(subsetData$Date,subsetData$Time), "%d/%m/%Y %H:%M:%S")

##create png file
png("plot3.png",width = 480, height = 480, units = "px")

##Plot  
with(subsetData, plot(subsetData$DateTime,
                           as.numeric(levels(subsetData$Sub_metering_1))[subsetData$Sub_metering_1],
                           xlab = "", ylab = "Energy sub metering", type = "l"))
with(subsetData, lines(subsetData$DateTime,
                            as.numeric(levels(subsetData$Sub_metering_2))[subsetData$Sub_metering_2],
                            col="red"))
with(subsetData, lines(subsetData$DateTime, subsetData$Sub_metering_3,
                            col="blue"))
legend("topright", lty = 1, col = c("black", "red", "blue"),
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

dev.off()