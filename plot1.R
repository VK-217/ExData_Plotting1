library(sqldf)
data <- read.csv.sql("household_power_consumption.txt",sep=";")
library(dplyr)
gdata <- filter(data,Date == "2/2/2007" | Date=="1/2/2007")
gdata <- gdata[complete.cases(gdata),]
png("plot1.png")
hist(gdata$Global_active_power,main="Global Active Power",xlab="Global Active Power (kilowatts)",col="Red")
dev.off()