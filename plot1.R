

house_hold_power<-read.table("household_power_consumptionyes.txt",sep=";",
                                   na.strings = "?",header = TRUE,colClasses = c(rep("character",2),rep("numeric",7)))
house_hold<-house_hold_power[grep("^1/2/2007|^2/2/2007",house_hold_power$Date),]

png(filename = "plot1.png",
          width = 480, height = 480, units = "px", pointsize = 12)
hist(house_hold$Global_active_power,col=("red"),
     xlab="Global Active Power (kilowatts)", main="Global Active Power")


dev.off()

