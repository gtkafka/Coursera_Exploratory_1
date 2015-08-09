#Plot script for plot1.png

fileUrl <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"

pwr <- read.table(unz("exdata-data-household_power_consumption.zip", "household_power_consumption.txt"), sep = ";", header = TRUE)
pwr$Date <- as.Date(as.character(pwr$Date), skip = 1, "%d/%m/%Y")
data <- with(pwr, pwr[(Date >= "2007-02-01") & Date <= "2007-02-02", ])

#Get variable
gActive <- as.numeric(as.character(data[, "Global_active_power"]))

#Plot
png("plot1.png", width=480, height=480, units="px")
hist(gActive, breaks = 13, col='red', main="Global Active Power", xlab = "Global Active Power (kilowatts)")
dev.off()