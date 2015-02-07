# Plot 3
library(data.table)
Sys.setlocale("LC_TIME", "C")
d = fread("household_power_consumption.txt", sep = ";", header=T, colClasses=classes, stringsAsFactors=F, na.strings=c("NA","N/A","","?"))
d = d[Date == "1/2/2007" | Date == "2/2/2007"]
d[, dateTime:=as.POSIXct(strptime(d[, paste(Date, Time)], "%d/%m/%Y %H:%M:%S"))]
dev.copy(png, file="Plot3.png", height=480, width=480)
plot(d[, dateTime], d[, Sub_metering_1], type = 'n', xlab="", ylab="Energy sub metering", ylim=c(0,40))
lines(d[, dateTime], d[, Sub_metering_1], col="black")
lines(d[, dateTime], d[, Sub_metering_2], col="red")
lines(d[, dateTime], d[, Sub_metering_3], col="blue")
legend("topright", legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), col=c("black", 'red', 'blue'), lty=1)
dev.off()