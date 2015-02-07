# Plot 4
library(data.table)
Sys.setlocale("LC_TIME", "C")
d = fread("household_power_consumption.txt", sep = ";", header=T, colClasses=classes, stringsAsFactors=F, na.strings=c("NA","N/A","","?"))
d = d[Date == "1/2/2007" | Date == "2/2/2007"]
d[, dateTime:=as.POSIXct(strptime(d[, paste(Date, Time)], "%d/%m/%Y %H:%M:%S"))]
par(mfrow = c(2, 2))
dev.copy(png, file="Plot4.png", height=480, width=480)

# Global Active Power plot
plot(d[, dateTime], d[, Global_active_power], type = 'l', xlab="", ylab="Global Active Power", cex.axis = 0.8, cex.lab = 0.8)

# Voltage plot
plot(d[, dateTime], d[, Voltage], type = 'l', xlab="datetime", ylab="Voltage", cex.axis = 0.8, cex.lab = 0.8)

# Energy sub metering plot
plot(d[, dateTime], d[, Sub_metering_1], type = 'n', xlab="", ylab="Energy sub metering", ylim=c(0,40), cex.axis = 0.8, cex.lab = 0.8)
lines(d[, dateTime], d[, Sub_metering_1], col="black")
lines(d[, dateTime], d[, Sub_metering_2], col="red")
lines(d[, dateTime], d[, Sub_metering_3], col="blue")
legend("topright", legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), cex = 0.8, col=c("black", 'red', 'blue'), lty=1, bty='n')

# Global Reactive power plot
plot(d[, dateTime], d[, Global_reactive_power], type = 'l', xlab="datetime", ylab="Global_reactive_power", cex.axis = 0.8, cex.lab = 0.8)

dev.off()