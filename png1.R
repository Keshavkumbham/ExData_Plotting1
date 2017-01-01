data <- read.table(dataFile, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
req_data <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]


head(req_data)


globalActivePower <- as.numeric(req_data$Global_active_power)
head(globalActivePower)



png("png1.png",width = 480, height = 480)
hist(globalActivePower,col = "red")
dev.cur()
dev.off()
