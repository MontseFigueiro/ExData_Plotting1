Data<-read.csv("household_power_consumption.txt",header=TRUE,sep=";",stringsAsFactors = FALSE,dec=".")
Data$Date<-as.Date(Data$Date,"%d/%m/%Y")
Data$Global_active_power<-as.numeric(Data$Global_active_power,na.rm=TRUE)
day1<-Data[Data$Date=="2007-02-01"|Data$Date=="2007-02-02",]


day1$dayweek<-weekdays(as.Date(day1$Date))


datetime <- paste(as.Date(day1$Date), day1$Time)
day1$Datetime <- as.POSIXct(datetime)
globalActivePower <- as.numeric(day1$Global_active_power)

submet1<-as.numeric(day1$Sub_metering_1)
submet2<-as.numeric(day1$Sub_metering_2)
submet3<-as.numeric(day1$Sub_metering_3)
png("Plot3_3.png")
plot(day1$Datetime, submet1, type="l", xlab="", ylab="Energy Submetering",main="")
lines(day1$Datetime,submet2,type="l",col="red")
lines(day1$Datetime,submet3,type="l",col="blue")

legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=, lwd=2.5, col=c("black", "red", "blue"), bty="o")

dev.off()
