############################################################################
## Exploratory data analysis
## Assignment 1 - Plot 4
############################################################################
## Assuming the data is already downloaded into data folder in working directory

##Load the data
householdData <- read.table("data/household_power_consumption.txt", sep=";", header=TRUE)
##Subsetting required data
subsetData <- subset(householdData, Date == "1/2/2007" | Date == "2/2/2007")
##Format Data and Time columns into a single Datetime column
subsetData$DateTime <- strptime(paste(subsetData$Date,subsetData$Time), "%d/%m/%Y %H:%M:%S")

##create png file
png("plot4.png",width = 480, height = 480, units = "px")

par(mfrow = c(2, 2))

# 1st Plot
plot(subsetData$DateTime,
     as.numeric(levels(subsetData$Global_active_power))[subsetData$Global_active_power],
     xlab = "", ylab = "Global Active Power", type = "l")

# 2nd Plot
plot(subsetData$DateTime, as.numeric(levels(subsetData$Voltage))[subsetData$Voltage],
     xlab = "datetime", ylab = "Voltage", type = "l")

# 3rd Plot
with(subsetData, plot(subsetData$DateTime,
                           as.numeric(levels(subsetData$Sub_metering_1))[subsetData$Sub_metering_1],
                           xlab = "", ylab = "Energy sub metering", type = "l"))
with(subsetData, lines(subsetData$DateTime,
                            as.numeric(levels(subsetData$Sub_metering_2))[subsetData$Sub_metering_2],
                            col="red"))
with(subsetData, lines(subsetData$DateTime, subsetData$Sub_metering_3,
                            col="blue"))
legend("topright", lty = 1, col = c("black", "red", "blue"),
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), cex = 0.75, bty = "n")

# 4th Plot
plot(subsetData$DateTime,
     as.numeric(levels(subsetData$Global_reactive_power))[subsetData$Global_reactive_power],
     xlab = "datetime", ylab = "Global_reactive_power", type = "l")

dev.off()