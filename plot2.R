# Read the full data file
hhdata <- read.table("./household_power_consumption.txt", sep = ";", header=TRUE, na.strings="?")

# Fix the Date field
hhdata$Date <- as.Date(hhdata$Date, format = "%d/%m/%Y")

# Subset the data to include data for ony two days i.e. 1st and 2nd Feb, 2007
hhdata <- subset(hhdata, Date >= "2007-02-01" & Date <= "2007-02-02")

# Fix the Time field
hhdata$Time <- strptime(paste(hhdata$Date, hhdata$Time), format = "%Y-%m-%d %H:%M:%S")  

# Plot 2
png(file = "./plot2.png", width = 480, height = 480)
plot(hhdata$Time, hhdata$Global_active_power, type = "l" , xlab = "", ylab = "Global Active Power (kilowatts)")
dev.off()

rm(list=ls())