#Prepare Data 
data<-read.table("household_power_consumption.txt", header=TRUE, sep=";",
                 comment.char="",colClasses = "character")

subSetData <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]
subSetData$Global_active_power <- as.numeric(subSetData$Global_active_power)

#plot 1
png("plot1.png", width=480, height=480)
     hist(subSetData$Global_active_power, col="red",
          main="Global Active Power",
          xlab="Global Active Power (kilowatts)")
dev.off()
