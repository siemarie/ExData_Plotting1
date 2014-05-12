## Plot of Sub metering over time for the dates of 2/1/2007 - 2/2/2007 ##

lines <- grep('^[1-2]/2/2007', readLines('household_power_consumption.txt'))
skip_num=lines[1]-1
data<-read.table(file = "household_power_consumption.txt",sep = ";",skip = skip_num,nrows = length(lines))
header<-read.table(file = "household_power_consumption.txt",sep = ";",nrows = 1,header=TRUE)
names(data)<-names(header)
data[,"Date"]<-as.Date(data[,"Date"],format="%d/%m/%Y")
data$DateTime<-strptime(paste(data[,"Date"],data[,"Time"],sep=" "), format="%Y-%m-%d %H:%M:%S")

png(filename = "plot3.png",width = 480, height = 480, units = "px", pointsize = 12,bg = "white")
plot(data$DateTime,data$Sub_metering_1,type="l",ylab="Energy sub metering",xlab="",col="black")
lines(data$DateTime,data$Sub_metering_2,col="red", type="l")
lines(data$DateTime,data$Sub_metering_3,col="blue", type="l")
legend(x="topright",legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),col=c("black","red","blue"),border="black",lty=1)
dev.off()
