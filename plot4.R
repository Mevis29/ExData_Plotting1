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

par(mfrow=c(2,2))
with(myData, {
    plot(Global_active_power~Datetime, type="l", 
         ylab="Global Active Power", xlab="")
    plot(Voltage~Datetime, type="l", 
         ylab="Voltage", xlab="datetime")
    plot(Sub_metering_1~Datetime, type="l", 
         ylab="Energy sub metering", xlab="")
    lines(Sub_metering_2~Datetime,col='Red')
    lines(Sub_metering_3~Datetime,col='Blue')
    legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, bty="n",
           legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
    plot(Global_reactive_power~Datetime, type="l", 
         ylab="Global_reactive_power",xlab="datetime")
})

dev.copy(png, file="plot4.png", height=480, width=480)
dev.off()


