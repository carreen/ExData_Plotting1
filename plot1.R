## read data
wdata<-read.csv("./data/household_power_consumption.txt",header=TRUE,sep=";")
subdata<-wdata[wdata$Date=="1/2/2007"|wdata$Date=="2/2/2007",]
subdata$Global_active_power<-as.numeric(as.character(subdata$Global_active_power))

## draw histogram
png("plot1.png")
with(subdata,hist(Global_active_power,col="red",main="Global Active Power",xlab="Global Active Power (kilowatts)"))
dev.off()

