# plot Global active power as time
# read the needed libraries
library("sqldf")
library("tcltk")
dev.off()
data <- read.csv.sql("household_power_consumption.txt",sep=';',sql="select * from file where Date='1/2/2007' or Date='2/2/2007' ")
data <- na.omit(data)
y <- na.omit(data$Global_active_power)
x <- paste(data$Date, data$Time)
x <- strptime(x, "%d/%m/%Y %H:%M:%S")
plot(x,y,type='l',ylab="Global Active Powe (kilowatts)",xlab='')
dev.copy(png, file='plot2.png')
dev.off()