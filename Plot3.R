mydata = read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings=c("NA", "-", "?"))
newdata <- subset(mydata,mydata$Date=="1/2/2007" | mydata$Date=="2/2/2007", select=Date:Sub_metering_3)
newdata$DateTime<-paste(newdata$Date, newdata$Time)
newdata$StripDateTime<-strptime(newdata$DateTime, "%d/%m/%Y %H:%M:%S")
plot(newdata$StripDateTime, as.numeric(as.character(newdata$Sub_metering_1)),type='l', 
     ylab ="Energy sub metering", xlab="")
lines(newdata$StripDateTime, as.numeric(as.character(newdata$Sub_metering_2)),type='l', col='red')
lines(newdata$StripDateTime, newdata$Sub_metering_3,type='l', col="blue")
legend('topright', c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
       lty=c(1,1,1), col=c("black","red","blue"))
dev.copy(png, file="plot3.png", width=480, height=480)
dev.off()
cat("plot3.png has been saved in", getwd())
