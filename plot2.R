## Plots line chart of Global Active Power (kw) for the dates of 2/1/2007 - 2/2/2007 by date and time ##

lines <- grep('^[1-2]/2/2007', readLines('household_power_consumption.txt'))
skip_num=lines[1]-1
data<-read.table(file = "household_power_consumption.txt",sep = ";",skip = skip_num,nrows = length(lines))
header<-read.table(file = "household_power_consumption.txt",sep = ";",nrows = 1,header=TRUE)
names(data)<-names(header)
data[,"Date"]<-as.Date(data[,"Date"],format="%d/%m/%Y")
data$DateTime<-strptime(paste(data[,"Date"],data[,"Time"],sep=" "), format="%Y-%m-%d %H:%M:%S")

png(filename = "plot2.png",width = 480, height = 480, units = "px", pointsize = 12,bg = "white")
plot(data$DateTime,data$Global_active_power,type="l",xlab="",ylab="Global Active Power (kilowatts)")
dev.off()
