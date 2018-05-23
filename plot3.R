library(lubridate)
Sys.setlocale("LC_TIME", "en_US.UTF-8")

house_hold_power<-read.table("household_power_consumptionyes.txt",sep=";",
                             na.strings = "?",header = TRUE)

house_hold<-house_hold_power[grep("^1/2/2007|^2/2/2007",house_hold_power$Date),]

a<-paste(house_hold$Date,house_hold$Time,sep = " ")
a<-as.POSIXct(strptime(a,format="%d/%m/%Y %H:%M:%S"))

png(filename = "plot3.png",
    width = 480, height = 480, units = "px", pointsize = 12)
plot(a,house_hold$Sub_metering_1,type="l",ylab="Energy sub metering",xlab = " ")
lines(a,house_hold$Sub_metering_2,col="red")
lines(a,house_hold$Sub_metering_3,col="blue")
legend("topright",lty=1,col = c("black","red","blue"),legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
axis.Date(side=1,at=a,labels=wday(as.Date(a)))

dev.off()