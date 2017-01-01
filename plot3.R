dataFile <- "./data/household_power_consumption.txt"
data <- read.table(dataFile, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
req_data <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]


head(req_data)
# combining date and time

date_time <- strptime(paste(req_data$Date, req_data$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
head(date_time)
 
submetering1 <- as.numeric(req_data$Sub_metering_1)
submetering2 <- as.numreq_data$Sub_metering_2
submetering3 <- req_data$Sub_metering_3
png("png3.png",width = 480,height = 480)
plot(date_time,submetering1,type = "l",xlab = "",ylab="Enegy Sub metering") 
lines(date_time,submetering2,type = "l", col="red")
lines(date_time,submetering3,type = "l", col= "blue")
legend("topright",pch = "l",col =c("black","red","blue"),legend=c("sub_metering_1","sub_metering_2","sub_metering_3"))
dev.off()
