# read the file
readData <- read.table("household_power_consumption.txt",sep = ";",header = TRUE,stringsAsFactors = FALSE)

# subset the data you need
subSetData <- readData[readData$Date %in% c("1/2/2007","2/2/2007") ,]

plotData <- as.numeric(as.character(subSetData$Global_active_power))

#the file is saved as "plot1.png" in the working directory
png("plot1.png",width = 480,height = 480)

#create histogram
hist(plotData,col = "red",xlab = "Global Active Power(kilowatts)",ylab = "Frequency",main = "Global Active Power")

# dev is closed
dev.off()

