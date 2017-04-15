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
  

#plot2
plot(powerdata$Global_active_power~powerdata$datetime,type="l",ylab="Global Active Power (kilowatts)",xlab="")
dev.copy(png, file="plot2.png", height=480, width=480)
dev.off()

