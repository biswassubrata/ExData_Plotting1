################################################################
# plot4.R
################################################################
closeAllGraphicsDevices <- function() {
	while (dev.cur() >= 2) {
		dev.off()
	}
}
u <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(u, "household_power_consumption.zip")
unzip("household_power_consumption.zip")
d1 <- read.csv("household_power_consumption.txt", stringsAsFactors = FALSE, sep=";")
closeAllGraphicsDevices()
png("plot4.png", width=480, height=480)
par(mfrow=c(2, 2))
with(subset(d1, Date == "1/2/2007" | Date == "2/2/2007"),
     plot(strptime(paste(Date, " ", Time), "%d/%m/%Y %H:%M:%S"),
          Global_active_power,
          type="o",
          pch=".",
          xlab="",
          ylab="Global Active Power"))
with(subset(d1, Date == "1/2/2007" | Date == "2/2/2007"),
     plot(strptime(paste(Date, " ", Time), "%d/%m/%Y %H:%M:%S"),
          Voltage,
          type="o",
          pch=".",
          xlab="datetime",
          ylab="Voltage"))
with(subset(d1, Date == "1/2/2007" | Date == "2/2/2007"),
     plot(strptime(paste(Date, " ", Time), "%d/%m/%Y %H:%M:%S"),
          Sub_metering_1,
          col = "black",
          type="o",
          pch=",",
          xlab="",
          ylab="Energy sub metering"))
with(subset(d1, Date == "1/2/2007" | Date == "2/2/2007"),
     lines(strptime(paste(Date, " ", Time), "%d/%m/%Y %H:%M:%S"),
           Sub_metering_2,
           col = "red",
           type="o",
           pch=","))
with(subset(d1, Date == "1/2/2007" | Date == "2/2/2007"),
     lines(strptime(paste(Date, " ", Time), "%d/%m/%Y %H:%M:%S"),
           Sub_metering_3,
           col = "blue",
           type="o",
           pch=","))
legend("topright",
       col=c("black", "red", "blue"),
       lty=1,
       xjust=1,
       yjust=1,
       bty="n",
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
with(subset(d1, Date == "1/2/2007" | Date == "2/2/2007"),
     plot(strptime(paste(Date, " ", Time), "%d/%m/%Y %H:%M:%S"),
          Global_reactive_power,
          type="o",
          pch=".",
          xlab="datetime",
          ylab="Global_reactive_power"))
closeAllGraphicsDevices()
