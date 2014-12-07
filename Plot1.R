# Downloaded text file has to be saved in the working directoty
# Read full dataset
x1<-read.table("./household_power_consumption.txt",sep=";",header=TRUE,na.strings="?",stringsAsFactors=F)

# Subset  data
x2<-x1[x1$Date %in% c("1/2/2007","2/2/2007"),]

# Plotting the data
hist(x2$Global_active_power, main="Global Active Power", xlab="Global Active Power(kilowatts)", ylab="Frequency", col="Red") 

# Graph
dev.copy(png, file="plot1.png", height=480, width=480) 
dev.off() 
