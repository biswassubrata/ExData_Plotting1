################################################################
# plot1.R
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
with(subset(d1, Date == "1/2/2007" | Date == "2/2/2007"),
        hist(as.numeric(Global_active_power),
			 col="red",
			 xlab="Global Active Power (kilowatts)",
			 main="Global Active Power"))
dev.copy(png, "plot1.png", width=480, height=480)
closeAllGraphicsDevices()
