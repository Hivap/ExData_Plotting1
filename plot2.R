house_hold_power<-read.table("household_power_consumptionyes.txt",sep=";",
                             na.strings = "?",header = TRUE)

house_hold<-house_hold_power[grep("^1/2/2007|^2/2/2007",house_hold_power$Date),]

a<-paste(house_hold$Date,house_hold$Time,sep = " ")
a<-as.POSIXct(strptime(a,format="%d/%m/%Y %H:%M:%S"))
library(lubridate)
Sys.setlocale("LC_TIME", "en_US.UTF-8")

#week_day<-as.fwday(a,label=TRUE)
png(filename = "plot2.png",
    width = 480, height = 480, units = "px", pointsize = 12)
plot(a,house_hold$Global_active_power,type="l",ylab="Global Active Power (kilowatts)",xlab = " ")
axis.Date(side=1,at=a,labels=wday(as.Date(a)))

dev.off()