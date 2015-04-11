# Read the data
data<-read.csv (file = "household_power_consumption.txt", sep = ';', na.strings = "?")

# Select the portion for analysis
startDate <- as.Date ("2007-02-01")
stopDate <- as.Date ("2007-02-02")
gapData <- subset (data, as.Date (Date, format = "%d/%m/%Y") >= startDate 
                      & as.Date (Date, format = "%d/%m/%Y") <= stopDate)

# Convert dates and times to timestamps
gapData$DateTime <- as.POSIXct (paste (gapData$Date, gapData$Time), format  ="%d/%m/%Y %H:%M:%S")

# Open the PNG device and create a plot
png (width = 480, height = 480, filename = "plot4.png")

# We want two rows, two columns
par (mfrow = c (2, 2))

with (gapData,
      plot (DateTime, Global_active_power, type = 'l', xlab = '',
            ylab = 'Global Active Power (kilowatts)'))

with (gapData, plot (DateTime, Sub_metering_1, type = 'l', xlab = '',
              ylab = 'Energy sub metering'), col = "black")
with (gapData, lines (DateTime, Sub_metering_2, col = "red"))
with (gapData, lines (DateTime, Sub_metering_3, col = "blue"))

# Add the legend
legend ("topright", legend = c ("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
        col = c ("black", "red", "blue"), lty = 1, bty=0)

dev.off ()