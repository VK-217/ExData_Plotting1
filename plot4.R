library(sqldf)
data <- read.csv.sql("household_power_consumption.txt",sep=";")
library(dplyr)
gdata <- filter(data,Date == "2/2/2007" | Date=="1/2/2007")
gdata <- gdata[complete.cases(gdata),]
png("plot4.png")
library(lubridate)
par(mfrow=c(2,2))

plot(dmy_hms(paste(gdata$Date, gdata$Time)),type="l",gdata$Global_active_power,ylab="Global Active Power",xlab = "")

plot(dmy_hms(paste(gdata$Date, gdata$Time)),type="l",gdata$Voltage,ylab="Voltage",xlab = "datetime")

plot(dmy_hms(paste(gdata$Date, gdata$Time)),gdata$Sub_metering_1,lwd=2.5,type="l",xlab = "",ylab="Energy Sub Metering")
lines(dmy_hms(paste(gdata$Date, gdata$Time)),gdata$Sub_metering_2,lwd=2.5,col="Red")
lines(dmy_hms(paste(gdata$Date, gdata$Time)),gdata$Sub_metering_3,lwd=2.5,col="Blue")
legend("topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty=c(1,1,1),lwd=c(2.5,2.5,2.5),col=c("black","red","blue"),cex=0.75)

plot(dmy_hms(paste(gdata$Date, gdata$Time)),type="l",gdata$Global_reactive_power,ylab="Global_Reactive_Power",xlab = "datetime")
dev.off()