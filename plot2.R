# Read the data
data<-read.csv (file = "household_power_consumption.txt", sep = ';', na.strings = "?")

# Select the portion for analysis
startDate <- as.Date ("2007-02-01")
stopDate <- as.Date ("2007-02-02")
gapData <- subset (data, as.Date (Date, format = "%d/%m/%Y") >= startDate 
                      & as.Date (Date, format = "%d/%m/%Y") <= stopDate, 
          select = c(Date, Time, Global_active_power))

# Convert dates and times to timestamps
gapData$DateTime <- as.POSIXct (paste (gapData$Date, gapData$Time), format="%d/%m/%Y %H:%M:%S")

# Open the PNG device and create a plot
png (width = 480, height = 480, filename = "plot2.png")
with (gapData,
      plot (DateTime, Global_active_power, type = 'l', xlab = '',
            ylab = 'Global Active Power (kilowatts)'))
dev.off ()