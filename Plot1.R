mydata = read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings=c("NA", "-", "?"))
newdata <- subset(mydata,mydata$Date=="1/2/2007" | mydata$Date=="2/2/2007", select=Date:Sub_metering_3)

hist(newdata$Global_active_power, main = "Global Active Power", xlab="Global active power (kilowatts)", col="red")
dev.copy(png, file="plot1.png", width=480, height=480)
dev.off()
cat("Plot1.png has been saved in", getwd())
