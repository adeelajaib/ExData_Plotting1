
d1<-read.table("./household_power_consumption.txt", header = TRUE, sep = ";",na.strings = "?")

#choose the dates we are extracting data from
dt1 <- as.Date("2007/02/01")
dt2 <- as.Date("2007/02/02")

#use subset to choose the data we are plotting
d3<-subset(d1,format(as.Date(d1[,1],"%d/%m/%Y"))==dt1 | format(as.Date(d1[,1],"%d/%m/%Y"))==dt2)

# plot2
png("plot2.png", width = 480, height = 480)
d4<-paste(d3[,1],d3[,2])
d5<-strptime(d4, "%d/%m/%Y %H:%M:%S")
head(d5)
plot(d5,d3[,3],type="l",ylab="Global Active Power (kilowatts)",xlab="")
dev.off()
