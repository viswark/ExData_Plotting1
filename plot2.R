############################################################################
## Exploratory data analysis
## Assignment 1 - Plot 2
############################################################################
## Assuming the data is already downloaded into data folder in working directory

##Load the data
householdData <- read.table("data/household_power_consumption.txt", sep=";", header=TRUE)
##Subsetting required data
subsetData <- subset(householdData, Date == "1/2/2007" | Date == "2/2/2007")
##Format Data and Time columns into a single Datetime column
subsetData$DateTime <- strptime(paste(subsetData$Date,subsetData$Time), "%d/%m/%Y %H:%M:%S")

##create png file
png("plot2.png",width = 480, height = 480, units = "px")

##Plot  
plot(subsetData$DateTime,
     as.numeric(levels(subsetData$Global_active_power))[subsetData$Global_active_power],
     xlab = "", ylab = "Global Active Power (kilowatts)", type = "l")

dev.off()