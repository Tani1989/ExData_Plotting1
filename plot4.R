#read the file
readData <- read.table("household_power_consumption.txt",sep = ";",header = TRUE,na.strings = "?")

#subset the data you need
subSetData <- readData[readData$Date %in% c("1/2/2007","2/2/2007") ,]

# create 2 rows and 2 columns to display the various plots in one screen
par(mfrow=c(2,2),mar=c(4,4,4,4),oma=c(0,0,2,0))


subSetData$DateTime <- strptime(paste(subSetData$Date, subSetData$Time, sep=" "), 
                                format="%d/%m/%Y %H:%M:%S")

#plot first graph
plot(subSetData$DateTime,subSetData$Global_active_power,type = "l",xlab = "",ylab ="Global Active Power") 

#plot second graph
plot(subSetData$DateTime,subSetData$Voltage,type = "l",xlab = "datetime",ylab = "Voltage")

#plot third graph
plot(subSetData$DateTime,subSetData$Sub_metering_1,col="black",type = "l",xlab = "",ylab = "Energy sub metering")
lines(subSetData$DateTime,subSetData$Sub_metering_2,col="red")
lines(subSetData$DateTime,subSetData$Sub_metering_3,col="blue")

# add legends to third graph
legend("topright", col = c("black","red","blue"),c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty = 1 )

#plot fourth graph
plot(subSetData$DateTime,subSetData$Global_reactive_power,ylab = "Global Reactive Power",type = "l",xlab = "datetime")

#the file is saved as "plot4.png" in the working directory
dev.copy(png, filename = "plot4.png")

#dev is closed
dev.off()
