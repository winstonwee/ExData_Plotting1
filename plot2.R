#Prepare Data 
data<-read.table("household_power_consumption.txt", header=TRUE, sep=";",
                 comment.char="",colClasses = "character")

subSetData <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]
subSetData$datetime <- paste(subSetData$Date,subSetData$Time)
subSetData$datetime <- strptime(subSetData$datetime, "%d/%m/%Y %H:%M:%S")

subSetData$Global_active_power <- as.numeric(subSetData$Global_active_power)


#Plot 2
png("plot2.png", width=480, height=480)
plot(subSetData$datetime, 
     subSetData$Global_active_power, 
     type = "l",xlab="Date Time", 
     ylab="Global Active Power (kilowatt)")
dev.off()

