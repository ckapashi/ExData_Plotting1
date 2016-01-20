# Read the full data file
hhdata <- read.table("./household_power_consumption.txt", sep = ";", header=TRUE, na.strings="?")

# Fix the Date field
hhdata$Date <- as.Date(hhdata$Date, format = "%d/%m/%Y")

# Subset the data to include data for ony two days i.e. 1st and 2nd Feb, 2007
hhdata <- subset(hhdata, Date >= "2007-02-01" & Date <= "2007-02-02")

# Fix the Time field
hhdata$Time <- strptime(paste(hhdata$Date, hhdata$Time), format = "%Y-%m-%d %H:%M:%S")  

# Plot 3
png(file = "plot3.png", width = 480, height = 480)
plot(hhdata$Time, hhdata$Sub_metering_1, type = "l", col = "black", xlab = "", ylab = "Energy sub metering")
lines(hhdata$Time, hhdata$Sub_metering_2, type = "l", col = "red")
lines(hhdata$Time, hhdata$Sub_metering_3, type = "l", col = "blue")
legend("topright", lty=1, col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
dev.off()

rm(list=ls())