# Plot 1 

# Initialization
rm(list=ls(all=TRUE))
explort.flag <- T

setwd("/Users/username/Documents/Coursera/Data-Science/Data-Science/Exploratory-Data-Analysis/")
file.name <- "household_power_consumption.txt"

el.data <- read.table(file.name, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
el.data <- el.data[el.data$Date %in% c("1/2/2007","2/2/2007") ,]

el.data$Date_Time           <- strptime(paste(el.data$Date, el.data$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 

el.data$Global_active_power <- as.numeric(el.data$Global_active_power)
el.data$Sub_metering_1      <- as.numeric(el.data$Sub_metering_1)
el.data$Sub_metering_2      <- as.numeric(el.data$Sub_metering_2)
el.data$Sub_metering_3      <- as.numeric(el.data$Sub_metering_3)


# ploting
if (explort.flag) png("plot3.png", width=480, height=480)
with(el.data, plot(Date_Time,  Sub_metering_1, type="l", ylab="Energy Submetering", xlab=""))
with(el.data, lines(Date_Time, Sub_metering_2, type="l", col="red"))
with(el.data, lines(Date_Time, Sub_metering_3, type="l", col="blue"))
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       lty=1, lwd=2.5, col=c("black", "red", "blue"))
if (explort.flag) dev.off()
