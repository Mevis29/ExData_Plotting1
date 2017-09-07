##Setting the Working Directory
setwd("~/--IBM--/CURSOS/Data Science/4 - Exploratory Data Analysis/Week 1/Project Assigment/Final Project")

## Uploading the data
powerData <- read.table("./Raw data/household_power_consumption.txt", header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")

##Creating a variable with the specific dates
myData <- subset(powerData, Date %in% c("1/2/2007","2/2/2007"))

##Date Format
myData$Date <- as.Date(myData$Date, format="%d/%m/%Y")

##Pasting Date and Time columns
datetime <- paste(as.Date(myData$Date), myData$Time)
myData$Datetime <- as.POSIXct(datetime)

##Creating the plot
with(myData, {
    plot(Sub_metering_1~Datetime, type="l",
         ylab="Energy Sub metering", xlab="")
    lines(Sub_metering_2~Datetime,col='Red')
    lines(Sub_metering_3~Datetime,col='Blue')
})
legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, 
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

dev.copy(png, file="plot3.png", height=480, width=480)
dev.off()

