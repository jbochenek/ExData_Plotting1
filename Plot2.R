mydata = read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings=c("NA", "-", "?"))
newdata <- subset(mydata,mydata$Date=="1/2/2007" | mydata$Date=="2/2/2007", select=Date:Sub_metering_3)
newdata$DateTime<-paste(newdata$Date, newdata$Time)
newdata$StripDateTime<-strptime(newdata$DateTime, "%d/%m/%Y %H:%M:%S")

plot(newdata$StripDateTime, as.numeric(as.character(newdata$Global_active_power)),
     type='l',ylab="Global Active Power (Kilowatts)", xlab="")
dev.copy(png, file="plot2.png", width=480, height=480)
dev.off()
cat("plot2.png has been saved in", getwd())




