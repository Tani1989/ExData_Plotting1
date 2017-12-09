# read the file
readData <- read.table("household_power_consumption.txt",sep = ";",header = TRUE,na.strings = "?")

#subset the data you need
subSetData <- readData[readData$Date %in% c("1/2/2007","2/2/2007") ,]

subSetData$DateTime <- strptime(paste(subSetData$Date, subSetData$Time, sep=" "), 
                          format="%d/%m/%Y %H:%M:%S")
#file is saved as "plot2.png" in the working directory
png("plot2.png",height = 480,width = 480)

# plot the data
plot(subSetData$DateTime,subSetData$Global_active_power,type = "l",xlab = "",ylab ="Global Active Power(kilowatts)") 

# dev is closed
dev.off()
