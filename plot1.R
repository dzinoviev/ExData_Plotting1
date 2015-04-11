# Read the data
data<-read.csv (file = "household_power_consumption.txt", sep = ';', na.strings = "?")

# Select the portion for analysis
startDate <- as.Date ("2007-02-01")
stopDate <- as.Date ("2007-02-02")
gapData <- subset (data, as.Date (Date, format = "%d/%m/%Y") >= startDate 
                      & as.Date (Date, format = "%d/%m/%Y") <= stopDate, 
          select = Global_active_power)

# Open the PNG device and create a histogram
png (width = 480, height = 480, filename = "plot1.png")
hist (gapData$Global_active_power, xlab = "Global Active Power (kilowatts)", col = "#FF2500", 
      main = "Global Active Power")
dev.off ()