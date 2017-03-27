# Plot 1 

# Initialization
rm(list=ls(all=TRUE))
explort.flag <- T

setwd("/Users/theodorospapathanasiou/Documents/Coursera/Data-Science/Data-Science/Exploratory-Data-Analysis/")
file.name <- "household_power_consumption.txt"

el.data <- read.table(file.name, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
el.data <- el.data[el.data$Date %in% c("1/2/2007","2/2/2007") ,]

el.data$Global_active_power <- as.numeric(el.data$Global_active_power)
el.data$Date_Time           <- strptime(paste(el.data$Date, el.data$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 

# ploting
if (explort.flag) png("plot2.png", width=480, height=480)
with (el.data, plot(x = Date_Time, y = Global_active_power, type="l", 
                    xlab="", ylab="Global Active Power (kilowatts)"))
if (explort.flag) dev.off()