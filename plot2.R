##  Read the project data that you have downloaded and unzipped into your working directory
##  Then create a subset of the data containig the dates we are interested in
projD <- read.table("household_power_consumption.txt",header=TRUE,na.strings=c("?"),
                    colClasses=c("character","character","numeric","numeric","numeric","numeric",
                                 "numeric","numeric","numeric"),sep=";")
projD2 <- subset(projD,Date=="1/2/2007" | Date=="2/2/2007")

## set the device to the png file, create the plot, close the device
png("plot2.png")
plot(strptime(paste(projD2$Date,projD2$Time,sep=" "), "%d/%m/%Y %H:%M:%S"),projD2$Global_active_power,type="l",
     xlab="",ylab="Global Active Power (kilowatts)")
dev.off()