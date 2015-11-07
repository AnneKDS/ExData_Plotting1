##  Read the project data that you have downloaded and unzipped into your working directory
##  Then create a subset of the data containig the dates we are interested in
projD <- read.table("household_power_consumption.txt",header=TRUE,na.strings=c("?"),
                    colClasses=c("character","character","numeric","numeric","numeric","numeric",
                                 "numeric","numeric","numeric"),sep=";")
projD2 <- subset(projD,Date=="1/2/2007" | Date=="2/2/2007")

## set the device to the png file, create the plot, close the device
png("plot3.png")
with(projD2, {
  plot(strptime(paste(Date,Time,sep=" "), "%d/%m/%Y %H:%M:%S"),Sub_metering_1,type="l",
     col="gray",xlab="",ylab="Energy sub metering")
  legend
  lines(strptime(paste(Date,Time,sep=" "), "%d/%m/%Y %H:%M:%S"),Sub_metering_2,
       col="red")
  lines(strptime(paste(Date,Time,sep=" "), "%d/%m/%Y %H:%M:%S"),Sub_metering_3,
       col="blue")
})
legend("topright",col=c("gray","red","blue"),
       legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty=c(1,1))
dev.off()