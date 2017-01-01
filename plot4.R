dataFile <- "./data/household_power_consumption.txt"
data <- read.table(dataFile, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
req_data <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]


head(req_data)
# combining date and time

date_time <- strptime(paste(req_data$Date, req_data$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
head(date_time)
globalActivePower <- as.numeric(req_data$Global_active_power)
head(globalActivePower)

Voltage <- req_data$Voltage
Global_reactive_power <- req_data$Global_reactive_power


png("png4.png",width = 480,height = 480)

    par(mfrow=c(2,2))

    plot(date_time, globalActivePower, type="l", xlab="date_time", ylab="Global Active Power (kilowatts)")
    plot(date_time, Voltage, type="l",xlab="date_time",ylab="Voltage")

    plot(date_time,submetering1,type = "l",xlab = "date_time",ylab="Enegy Sub metering") 
    lines(date_time,submetering2,type = "l", col="red")
    lines(date_time,submetering3,type = "l", col= "blue")
    legend("topright",pch = "l",col =c("black","red","blue"),legend=c("sub_metering_1","sub_metering_2","sub_metering_3"))

    plot(date_time,Global_reactive_power,type="l",xlab="date_time",ylab = "Global_reactive_power")

dev.off()
