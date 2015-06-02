# plot histogram of Global active power
# read the needed libraries
#install.packages('sqldf')
#
setwd('C:\\Users\\youva_000\\OneDrive\\Education\\Data\\Exploratory Data Analysis\\work\\project_1')
library("sqldf")
library("tcltk")
# dev.off()
data <- read.csv.sql("household_power_consumption.txt",sep=';',sql="select * from file where Date='1/2/2007' or Date='2/2/2007' ")
x <- na.omit(data$Global_active_power)
hist(x, main="Global Active Power",xlab="Global Active Powe (kilowatts)",ylab="Frequancy",col="red")
dev.copy(png, file='plot1.png')
dev.off()