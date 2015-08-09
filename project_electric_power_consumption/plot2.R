#Plot script for plot2.png
pwr <- read.table(unz("exdata-data-household_power_consumption.zip", "household_power_consumption.txt"), sep = ";", header = TRUE)
pwr$Date <- as.Date(as.character(pwr$Date), skip = 1, "%d/%m/%Y")
data <- with(pwr, pwr[(Date >= "2007-02-01") & Date <= "2007-02-02", ])

#Get variable
time <- as.POSIXct(paste(data$Date, data$Time), format="%Y-%m-%d %H:%M:%S")

#Plot
png("plot2.png", width=480, height=480, units="px")
plot(time, gActive, type="l", main="", ylab="Global Active Power (kilowatts)", xlab = "")
dev.off()