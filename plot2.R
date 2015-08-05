library(sqldf)
data <- read.csv.sql("household_power_consumption.txt",sep=";")
library(dplyr)
gdata <- filter(data,Date == "2/2/2007" | Date=="1/2/2007")
gdata <- gdata[complete.cases(gdata),]
png("plot2.png")
library(lubridate)
plot(dmy_hms(paste(gdata$Date, gdata$Time)),type="l",gdata$Global_active_power,ylab="Global Active Power (kilowatts)",xlab = "")
dev.off()