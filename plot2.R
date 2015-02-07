# Plot 2
library(data.table)
Sys.setlocale("LC_TIME", "C")
d = fread("household_power_consumption.txt", sep = ";", header=T, colClasses=classes, stringsAsFactors=F, na.strings=c("NA","N/A","","?"))
d = d[Date == "1/2/2007" | Date == "2/2/2007"]
d[, dateTime:=as.POSIXct(strptime(d[, paste(Date, Time)], "%d/%m/%Y %H:%M:%S"))]
dev.copy(png, file="Plot2.png", height=480, width=480)
plot(d[, dateTime], d[, Global_active_power], type = 'l', xlab="", ylab="Global Active Power (kilowatts)")
dev.off()