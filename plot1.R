############################################################################
## Exploratory data analysis
## Assignment 1 - Plot 1
############################################################################
## Assuming the data is already downloaded into data folder in working directory

##Load the data
householdData <- read.table("data/household_power_consumption.txt", sep=";", header=TRUE)
##Subsetting required data
subsetData <- subset(householdData, Date == "1/2/2007" | Date == "2/2/2007")

##create png file
png("plot1.png",width = 480, height = 480, units = "px")

##Plot histogram 
hist(as.numeric(levels(subsetData$Global_active_power))[subsetData$Global_active_power],
     col = "red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)")

dev.off()
