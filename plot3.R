#Prepare Data 
data<-read.table("household_power_consumption.txt", header=TRUE, sep=";",
                 comment.char="",colClasses = "character")

subSetData <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]
subSetData$datetime <- paste(subSetData$Date,subSetData$Time)
subSetData$datetime <- strptime(subSetData$datetime, "%d/%m/%Y %H:%M:%S")

subSetData$subMetering1 <- as.numeric(subSetData$Sub_metering_1)
subSetData$subMetering2<- as.numeric(subSetData$Sub_metering_2)
subSetData$subMetering3 <- as.numeric(subSetData$Sub_metering_3)
     
#Plot 3
png("plot3.png", width=480, height=480)
plot(subSetData$datetime, subSetData$subMetering1, type="l", ylab="Energy Submetering", xlab="")
lines(subSetData$datetime, subSetData$subMetering2, type="l", col="red")
lines(subSetData$datetime, subSetData$subMetering3, type="l", col="blue")
legend("topright",c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),lty=1, lwd=1, bty="n", col=c("black", "red", "blue"))
dev.off()

     
