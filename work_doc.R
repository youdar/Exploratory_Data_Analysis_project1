# read few line to see data
library("sqldf")
library("tcltk")
setwd("C:/Users/youva_000/OneDrive/Education/Data/Exploratory Data Analysis/work/project_1")
# install.packages("sqldf")
a<-read.csv("household_power_consumption.txt",nrows=5,sep=';')
summary(a)

a<-read.csv.sql("household_power_consumption.txt",sep=';',sql="select * from file where Date='2/1/2007' or Date='2/2/2007' ")