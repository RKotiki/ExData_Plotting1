# Downloaded text file has to be saved in the working directory
# Read full dataset
x1<-read.table("./household_power_consumption.txt",sep=";",header=TRUE,na.strings="?",stringsAsFactors=F)

# Subset  data
x2<-x1[x1$Date %in% c("1/2/2007","2/2/2007"),]

# Date and Time formatting
x2$Date <- as.Date(x2$Date, format="%d/%m/%Y")

DateTime <- paste(as.Date(x2$Date), x2$Time)

x2$DateTime <- as.POSIXct(DateTime)

# multiple panel
par(mfrow=c(2,2), mar=c(4,4,2,2))

# Plot 1,1
plot(x2$Global_active_power~x2$DateTime, type="l", xlab="", ylab="Global Active Power")

# Plot 1,2
plot(x2$Voltage~x2$DateTime, type="l", xlab="datetime", ylab="Voltage")

#Plot 2,1
plot(x2$Sub_metering_1~x2$DateTime,type="l",ylab="Energy sub metering",xlab="")
lines(x2$Sub_metering_2~x2$DateTime,type="l",col="Red")
lines(x2$Sub_metering_3~x2$DateTime,type="l",col="Blue")
 
legend("topright", col=c("black", "red", "blue"),lty=1,lwd=2,bty="n",legend=c("Sub_metering1", "Sub_metering2",
       "Sub_metering3"))

#Plot 2,2
plot(x2$Global_reactive_power~x2$DateTime, type="l", xlab="", ylab="Global Reactive Power")

# Graph
dev.copy(png, file="plot4.png", height=480, width=480) 
dev.off() 
