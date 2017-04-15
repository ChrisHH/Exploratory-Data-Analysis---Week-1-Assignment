setwd("xxx")
powerdata<-read.table("household_power_consumption.txt", header=TRUE,sep=";",na.strings = "?")

#We will only be using data from the dates 2007-02-01 and 2007-02-02. 
#One alternative is to read the data from just those dates rather than
#reading in the entire dataset and subsetting to those dates.

#reduced dataset
powerdata<-subset(powerdata, Date == "1/2/2007" | Date == "2/2/2007")
powerdata<-powerdata[complete.cases(powerdata),]

#aggregate date and time
powerdata$Date<-as.Date(powerdata$Date, "%d/%m/%Y")
powerdata$datetime<-paste(as.Date(powerdata$Date), powerdata$Time)
powerdata$datetime<-as.POSIXct(powerdata$datetime)
  


#plot4
##setup canvas
par(mfrow=c(2,2), mar=c(4,4,2,1), oma=c(0,0,2,0))
##upper left
plot(powerdata$Global_active_power~powerdata$datetime,type="l",ylab="Global Active Power",xlab="")
##upper right
plot(powerdata$Voltage~powerdata$datetime,type="l",ylab="Voltage",xlab="datetime")
##lower left
plot(powerdata$Sub_metering_1~powerdata$datetime,col="black",type="l",ylab="Engergy sub metering",xlab="")
lines(powerdata$Sub_metering_2~powerdata$datetime,col="red")
lines(powerdata$Sub_metering_3~powerdata$datetime,col="blue")
legend("topright",bty="n",bg="white",col=c("black", "red", "blue"), lwd=c(0.5,0.5,0.5), c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
##lower right
plot(powerdata$Global_reactive_power~powerdata$datetime,type="l",ylab="Global_reactive_power",xlab="datetime")
dev.copy(png, file="plot4.png", height=480, width=480)
dev.off()




