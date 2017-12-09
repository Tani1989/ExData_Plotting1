#read the file
readData <- read.table("household_power_consumption.txt",sep = ";",header = TRUE,na.strings = "?")

#subset the data you need
subSetData <- readData[readData$Date %in% c("1/2/2007","2/2/2007") ,]

subSetData$DateTime <- strptime(paste(subSetData$Date, subSetData$Time, sep=" "), 
                                format="%d/%m/%Y %H:%M:%S")

#file is saved as "plot3.png" in the working directory
png("plot3.png",height = 480,width = 480)

# plot the data
plot(subSetData$DateTime,subSetData$Sub_metering_1,col="black",type = "l",xlab = "",ylab = "Energy sub metering")
lines(subSetData$DateTime,subSetData$Sub_metering_2,col="red")
lines(subSetData$DateTime,subSetData$Sub_metering_3,col="blue")

# add legends
legend("topright", col = c("black","red","blue"),c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty = 1 )

#dev is closed
dev.off()
