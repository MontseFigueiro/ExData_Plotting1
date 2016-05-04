Data<-read.csv("household_power_consumption.txt",header=TRUE,sep=";",stringsAsFactors = FALSE,dec=".")
Data$Date<-as.Date(Data$Date,"%d/%m/%Y")
Data$Global_active_power<-as.numeric(Data$Global_active_power,na.rm=TRUE)
day1<-Data[Data$Date=="2007-02-01"|Data$Date=="2007-02-02",]


day1$dayweek<-weekdays(as.Date(day1$Date))


datetime <- paste(as.Date(day1$Date), day1$Time)
day1$Datetime <- as.POSIXct(datetime)
globalActivePower <- as.numeric(day1$Global_active_power)
png("plot2_1.png", width=480, height=480)
plot(day1$Datetime, globalActivePower, type="l", xlab="", ylab="Global Active Power (kilowatts)")

dev.off()
