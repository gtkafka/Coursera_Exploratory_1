#Plot script for plot4.png

pwr <- read.table(unz("exdata-data-household_power_consumption.zip", "household_power_consumption.txt"), sep = ";", header = TRUE)
pwr$Date <- as.Date(as.character(pwr$Date), skip = 1, "%d/%m/%Y")
data <- with(pwr, pwr[(Date >= "2007-02-01") & Date <= "2007-02-02", ])

gActive <- as.numeric(as.character(data[, "Global_active_power"]))
time <- as.POSIXct(paste(data$Date, data$Time), format="%Y-%m-%d %H:%M:%S")
sub1 <- as.numeric(as.character(data[, "Sub_metering_1"]))
sub2 <- as.numeric(as.character(data[, "Sub_metering_2"]))
sub3 <- as.numeric(as.character(data[, "Sub_metering_3"]))
volt <- as.numeric(as.character(data[, "Voltage"]))
gReactive <- as.numeric(as.character(data[, "Global_reactive_power"]))

#Plot
png("plot4.png", width=480, height=480, units="px")
par(mfrow=c(2,2))
plot(time, ga, type="l", xlab="", ylab="Global Active Power")
plot(time, volt, type="l", xlab="datetime", ylab="Voltage")
plot(time, sub01, type="l", col="black", ylim=c(0.0, 40.0), xlab="", ylab="Energy sub metering")
par(new=T)
plot(time, sub02, type="l", col="red", ylim=c(0.0, 40.0), xlab="", ylab="")
par(new=T)
plot(time, sub03, type="l", col="blue", ylim=c(0.0, 40.0), xlab="", ylab="")
legend("topright", lty=1, bty="n", col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
plot(time, gReactive, type="l", xlab="datetime", ylab="Global_reactive_power")
dev.off()