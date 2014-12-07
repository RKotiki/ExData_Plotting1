# Downloaded text file has to be saved in the working directory
# Read full dataset
x1<-read.table("./household_power_consumption.txt",sep=";",header=TRUE,na.strings="?",stringsAsFactors=F)

# Subset  data
x2<-x1[x1$Date %in% c("1/2/2007","2/2/2007"),]

# Date and Time formatting
x2$Date <- as.Date(x2$Date, format="%d/%m/%Y")

DateTime <- paste(as.Date(x2$Date), x2$Time)

x2$DateTime <- as.POSIXct(DateTime)

# Plotting the data
plot(x2$Sub_metering_1~x2$DateTime,type="l",ylab="Energy sub metering", xlab="")
lines(x2$Sub_metering_2~x2$DateTime,type="l",col="Red")
lines(x2$Sub_metering_3~x2$DateTime,type="l",col="Blue")

legend("topright", col=c("black", "red", "blue"),lty=1,lwd=2,legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

# Graph
dev.copy(png, file="plot3.png", height=480, width=480) 
dev.off() 
