dataFile <- "./data/household_power_consumption.txt"
data <- read.table(dataFile, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
req_data <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]


head(req_data)
# combining date and time

date_time <- strptime(paste(req_data$Date, req_data$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
head(date_time)
globalActivePower <- as.numeric(req_data$Global_active_power)
head(globalActivePower)
png("plot2.png", width=480, height=480)

plot(date_time, globalActivePower, type="l", xlab="", ylab="Global Active Power (kilowatts)")

dev.off()
