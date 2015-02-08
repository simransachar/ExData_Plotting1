file <- "household_power_consumption.txt"

if (! file.exists(file)) {
download.file("http://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip",
              "file.zip")
unzip("file.zip") }

data <- read.table(pipe('grep "^[1-2]/2/2007" "household_power_consumption.txt"'),sep=";")


cols <- read.table("household_power_consumption.txt", header = FALSE, nrows = 1,stringsAsFactors = FALSE,sep=";")
colnames(data) <- cols


GA <- data[,3]
png(file = "plot1.png")
hist(GA,col="red",main="Global Active Power",xlab="Global Active Power (kilowatts)")
dev.off()