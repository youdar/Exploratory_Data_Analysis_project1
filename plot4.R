# plot a 2x2 table of plots
library("sqldf")
library("tcltk")
dev.off()
data <- read.csv.sql("household_power_consumption.txt",sep=';',sql="select * from file where Date='1/2/2007' or Date='2/2/2007' ")
data <- na.omit(data)
par(mfrow=c(2,2), mar = c(4.5,5,1,1), cex = 0.5)
with (data,
      {
        x <- paste(data$Date, data$Time)
        x <- strptime(x, "%d/%m/%Y %H:%M:%S")
        plot(x,na.omit(data$Global_active_power),type='l',ylab="Global Active Powe (kilowatts)",xlab='')
        plot(x,na.omit(data$Voltage),type='l',ylab="Voltage",xlab='datetime')
        #
        y1 <- na.omit(data$Sub_metering_1)
        y2 <- na.omit(data$Sub_metering_2)
        y3 <- na.omit(data$Sub_metering_3)
        plot(x,y1,type='l',ylab="Energy sub metering",xlab='',ylim=(c(min(y1,y2,y3),6 + max(y1,y2,y3))))
        lines(x,y2,type='l',col='green')
        lines(x,y3,type='l',col='blue')
        legend('topright',lty =1,legend = c("Sub_metering_1", "Sub_metering_2",'Sub_metering_3'),col=c('black','green','blue'), bty="n")
        #
        plot(x,na.omit(data$Global_reactive_power),type='l',ylab="Global_reactive_power",xlab='datetime')
      })
dev.copy(png, file='plot4.png')
dev.off()