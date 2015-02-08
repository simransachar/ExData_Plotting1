file <- "household_power_consumption.txt"

if (! file.exists(file)) {
  download.file("http://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip",
                "file.zip")
  unzip("file.zip") }

data <- read.table(pipe('grep "^[1-2]/2/2007" "household_power_consumption.txt"'),sep=";")


cols <- read.table("household_power_consumption.txt", header = FALSE, nrows = 1,stringsAsFactors = FALSE,sep=";")
colnames(data) <- cols
GA <- data[,3]

png(file = "plot3.png")
dtvalue <- strptime(paste(data$Date, data$Time), "%d/%m/%Y %H:%M:%S")
s1 <- data$Sub_metering_1
s2 <- data$Sub_metering_2
s3 <- data$Sub_metering_3
plot(dtvalue, s1, type="l",xlab="",ylab="Enery sub metering",col="grey",main="Plot 3",adj=0)
lines(dtvalue, s2,col="red")
lines(dtvalue, s3,col="blue")
legend("topright", col = c("gray","red","blue"), legend = c("Sub_metering_1","Sub_metering_1","Sub_metering_1"),lty=c(1,1,1))
dev.off()  
