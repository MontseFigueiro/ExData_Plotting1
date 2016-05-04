Data<-read.csv("household_power_consumption.txt",header=TRUE,sep=";",stringsAsFactors = FALSE,dec=".")
Data$Date<-as.Date(Data$Date,"%d/%m/%Y")
Data$Global_active_power<-as.numeric(Data$Global_active_power,na.rm=TRUE)
day1<-Data[Data$Date=="2007-02-01"|Data$Date=="2007-02-02",]



png("Plot1_1.png")

hist(day1$Global_active_power,col="red",main="Global Active Power", xlab="Global Active Power (kilowatts)")
dev.off()