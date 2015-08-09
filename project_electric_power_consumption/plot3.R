#Plot script for plot3.png
pwr <- read.table(unz("exdata-data-household_power_consumption.zip", "household_power_consumption.txt"), sep = ";", header = TRUE)
pwr$Date <- as.Date(as.character(pwr$Date), skip = 1, "%d/%m/%Y")
data <- with(pwr, pwr[(Date >= "2007-02-01") & Date <= "2007-02-02", ])

#Get variable
time <- as.POSIXct(paste(data$Date, data$Time), format="%Y-%m-%d %H:%M:%S")
sub1 <- as.numeric(as.character(data[, "Sub_metering_1"]))
sub2 <- as.numeric(as.character(data[, "Sub_metering_2"]))
sub3 <- as.numeric(as.character(data[, "Sub_metering_3"]))

#Plot
png("plot3.png", width=480, height=480, units="px")
plot(time, sub01, type="l", col="black", ylim=c(0.0, 40.0), xlab="", ylab="Energy sub metering")
par(new=T)
plot(time, sub02, type="l", col="red", ylim=c(0.0, 40.0), xlab="", ylab="")
par(new=T)
plot(time, sub03, type="l", col="blue", ylim=c(0.0, 40.0), xlab="", ylab="")
legend("topright", lty=1, bty="n", col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
dev.off()