## read data
wdata<-read.csv("./data/household_power_consumption.txt",header=TRUE,sep=";")
subdata<-wdata[wdata$Date=="1/2/2007"|wdata$Date=="2/2/2007",]

# change format
subdata$Global_active_power<-as.numeric(as.character(subdata$Global_active_power))
subdata$DateTime<-strptime(paste(subdata$Date,subdata$Time),format="%d/%m/%Y %H:%M:%S")

## draw
png("plot2.png")
with(subdata,plot(DateTime,Global_active_power,type="l",ylab="Global Active Power (kilowatts)"))
dev.off()


