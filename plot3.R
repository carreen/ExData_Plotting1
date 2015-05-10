## read data
wdata<-read.csv("./data/household_power_consumption.txt",header=TRUE,sep=";")
subdata<-wdata[wdata$Date=="1/2/2007"|wdata$Date=="2/2/2007",]

# change format
subdata$Sub_metering_1<-as.numeric(as.character(subdata$Sub_metering_1))
subdata$Sub_metering_2<-as.numeric(as.character(subdata$Sub_metering_2))
subdata$Sub_metering_3<-as.numeric(as.character(subdata$Sub_metering_3))
subdata$DateTime<-strptime(paste(subdata$Date,subdata$Time),format="%d/%m/%Y %H:%M:%S")

#draw

png("plot3.png")
with(subdata,plot(DateTime, Sub_metering_1,main="",ylab="Energy sub metering",xlab="",type="n"))
with(subdata,lines(DateTime,Sub_metering_1,col="black"))
with(subdata,lines(DateTime,Sub_metering_2,col="red"))
with(subdata,lines(DateTime,Sub_metering_3,col="blue"))
legend("topright",lwd=1,col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
dev.off()
