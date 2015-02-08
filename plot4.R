file <- "household_power_consumption.txt"

if (! file.exists(file)) {
  download.file("http://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip",
                "file.zip")
  unzip("file.zip") }

data <- read.table(pipe('grep "^[1-2]/2/2007" "household_power_consumption.txt"'),sep=";")


cols <- read.table("household_power_consumption.txt", header = FALSE, nrows = 1,stringsAsFactors = FALSE,sep=";")
colnames(data) <- cols
GA <- data[,3]

Voltage <- data$Voltage
Global_reactive_power = data$Global_reactive_power
datetime <- strptime(paste(data$Date, data$Time), "%d/%m/%Y %H:%M:%S")

png(file = "plot4.png")
par(mfcol=c(2,2),oma=c(0,0,2,0))

plot(datetime, GA, type="l",xlab="",ylab="Global Active Power (kilowatts)")

s1 <- data$Sub_metering_1
s2 <- data$Sub_metering_2
s3 <- data$Sub_metering_3
plot(datetime, s1, type="l",xlab="",ylab="Enery sub metering",col="grey")
lines(datetime, s2,col="red")
lines(datetime, s3,col="blue")
legend("topright", col = c("gray","red","blue"), legend = c("Sub_metering_1","Sub_metering_1","Sub_metering_1"),lty=c(1,1,1))


plot(datetime, Voltage, type="l")
plot(datetime, Global_reactive_power, type="l")
title("Plot 4", outer=TRUE,adj=0)
dev.off()  

