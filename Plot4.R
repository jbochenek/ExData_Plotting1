mydata = read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings=c("NA", "-", "?"))
newdata <- subset(mydata,mydata$Date=="1/2/2007" | mydata$Date=="2/2/2007", select=Date:Sub_metering_3)
newdata$DateTime<-paste(newdata$Date, newdata$Time)
newdata$StripDateTime<-strptime(newdata$DateTime, "%d/%m/%Y %H:%M:%S")
par(mfrow=c(2,2))
plot(newdata$StripDateTime, as.numeric(as.character(newdata$Global_active_power)),
     type='l',ylab="Global Active Power (Kilowatts)", xlab="")
plot(newdata$StripDateTime, as.numeric(as.character(newdata$Voltage)),type='l', 
     ylab="Voltage",xlab="datetime" )
plot(newdata$StripDateTime, as.numeric(as.character(newdata$Sub_metering_1)),type='l', 
     ylab ="Energy sub metering", xlab="")
lines(newdata$StripDateTime, as.numeric(as.character(newdata$Sub_metering_2)),type='l', col='red')
lines(newdata$StripDateTime, newdata$Sub_metering_3,type='l', col="blue")
legend('topright', c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
       lty=c(1,1,1),col=c("black","red","blue"))
plot(newdata$StripDateTime, as.numeric(as.character(newdata$Global_reactive_power)),type='l', 
     ylab="Global_reactive_power",xlab="datetime" ) 
dev.copy(png, file="plot4.png", width=480, height=480)
dev.off()
cat("plot4.png has been saved in", getwd())