##Set Working Directory

setwd("~/--IBM--/CURSOS/Data Science/4 - Exploratory Data Analysis/Week 1/Project Assigment/Final Project")

## Read data
powerData <- read.table("./Raw data/household_power_consumption.txt", header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")

##Creating a variable with the specific dates 
myData <- subset(powerData, Date %in% c("1/2/2007","2/2/2007"))

##Date Format
myData$Date <- as.Date(myData$Date, format="%d/%m/%Y")

##Creating the histogram

hist(as.numeric(myData$Global_active_power), main = "Global Active Power", xlab = "Global Active Power(kilowatts)", ylab = "Frecuency", col = "Red")

##Creating the plot

png("plot1.png", width = 480, height = 480)
dev.off()

