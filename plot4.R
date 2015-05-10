## read data
wdata<-read.csv("./data/household_power_consumption.txt",header=TRUE,sep=";")
subdata<-wdata[wdata$Date=="1/2/2007"|wdata$Date=="2/2/2007",]

# change format
subdata$Global_active_power<-as.numeric(as.character(subdata$Global_active_power))
subdata$Global_reactive_power<-as.numeric(as.character(subdata$Global_reactive_power))                                
subdata$Sub_metering_1<-as.numeric(as.character(subdata$Sub_metering_1))
subdata$Sub_metering_2<-as.numeric(as.character(subdata$Sub_metering_2))
subdata$Sub_metering_3<-as.numeric(as.character(subdata$Sub_metering_3))
subdata$Voltage<-as.numeric(as.character(subdata$Voltage))
subdata$DateTime<-strptime(paste(subdata$Date,subdata$Time),format="%d/%m/%Y %H:%M:%S")

#draw
png("plot4.png")
par(mfrow=c(2,2))
with(subdata,plot(DateTime,Global_active_power,type="l",ylab="Global Active Power"))
with(subdata,plot(DateTime,Voltage,type="l",ylab="Voltage"))
with(subdata,plot(DateTime, Sub_metering_1,main="",ylab="Energy sub metering",xlab="",type="n"))
with(subdata,lines(DateTime,Sub_metering_1,col="black"))
with(subdata,lines(DateTime,Sub_metering_2,col="red"))
with(subdata,lines(DateTime,Sub_metering_3,col="blue"))
legend("topright",lwd=1,col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
with(subdata,plot(DateTime,Global_reactive_power,type="l",ylab="Global Reactive Power"))
dev.off()
