
d1<-read.table("./household_power_consumption.txt", header = TRUE, sep = ";",na.strings = "?")

#choose the dates we are extracting data from
dt1 <- as.Date("2007/02/01")
dt2 <- as.Date("2007/02/02")

#use subset to choose the data we are plotting
d3<-subset(d1,format(as.Date(d1[,1],"%d/%m/%Y"))==dt1 | format(as.Date(d1[,1],"%d/%m/%Y"))==dt2)

#use strptime to combine date and time from column 1 and 2
d4<-paste(d3[,1],d3[,2])
d5<-strptime(d4, "%d/%m/%Y %H:%M:%S")

#plot 4
png("plot4.png", width = 480, height = 480)
par(mfrow=c(2,2))
plot(d5,d3[,3],type="l",ylab="Global Active Powe",xlab="")
plot(d5,d3[,5],type="l",ylab="Voltage",xlab="datetime")
plot(d5,d3[,7],type="l",ylab="Energy sub metering",xlab="")
lines(d5,d3[,8],col="red")
lines(d5,d3[,9],col="blue")
legend("topright", y=NULL,c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty=c(1,1,1),lwd=c(1,1,1),col=c("black","red","blue"))
plot(d5,d3[,4],type="l",ylab="Global_reactive_power",xlab="datetime")
dev.off()
