d1<-read.table("./household_power_consumption.txt", header = TRUE, sep = ";",na.strings = "?")

#choose the dates we are extracting data from
dt1 <- as.Date("2007/02/01")
dt2 <- as.Date("2007/02/02")

#use subset to choose the data we are plotting
d3<-subset(d1,format(as.Date(d1[,1],"%d/%m/%Y"))==dt1 | format(as.Date(d1[,1],"%d/%m/%Y"))==dt2)

# Save plot1 in png
png("plot1.png", width = 480, height = 480)
hist(d3[,3],col = "red",xlab="Global Active Power (kilowatts)",main = paste("Global Active Power"))
dev.off()
