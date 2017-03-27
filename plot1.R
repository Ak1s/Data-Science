# Plot 1 

# Initialization
rm(list=ls(all=TRUE))
explort.flag <- T

setwd("/Users/username/Documents/Coursera/Data-Science/Data-Science/Exploratory-Data-Analysis/")
file.name <- "household_power_consumption.txt"

el.data <- read.table(file.name, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
el.data <- el.data[el.data$Date %in% c("1/2/2007","2/2/2007") ,]
el.data$Global_active_power <- as.numeric(el.data$Global_active_power)

# ploting
if (explort.flag) png("plot1.png", width=480, height=480)
hist(el.data$Global_active_power, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")
if (explort.flag) dev.off()
