# Plot 1
library(data.table)
d = fread("household_power_consumption.txt", sep = ";", header=T, colClasses=classes, stringsAsFactors=F, na.strings=c("NA","N/A","","?"))
d = d[Date == "1/2/2007" | Date == "2/2/2007"]
dev.copy(png, file="Plot1.png", height=480, width=480)
hist(as.numeric(d[, Global_active_power]), col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")
dev.off()