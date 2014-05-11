## Plots histogram of Global Active Power (kw) for the dates of 2/1/2007 - 2/2/2007 ##

lines <- grep('^[1-2]/2/2007', readLines('household_power_consumption.txt'))
skip_num=lines[1]-1
data<-read.table(file = "household_power_consumption.txt",sep = ";",skip = skip_num,nrows = length(lines))
header<-read.table(file = "household_power_consumption.txt",sep = ";",nrows = 1,header=TRUE)
names(data)<-names(header)
png(filename = "plot1.png",width = 480, height = 480, units = "px", pointsize = 12,bg = "white")
hist(data[,"Global_active_power"], xlab="Global Active Power (kilowatts)",main="Global Active Power",col="red")
dev.off()
