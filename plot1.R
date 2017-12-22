## read data to dataframe
hpc<-read.table(file = targetFile,header=TRUE,sep = ";",na.strings = "?")

## change date and time format
hpc[,1]<-as.Date(hpc[,1],format = "%d/%m/%Y")
hpcN<-hpc[hpc[,1]=="2007-02-01 "|hpc[,1]=="2007-02-02",]

## plot data 
hist(as.numeric(hpcN$Global_active_power), col="Red", main="Global Active Power", xlab="Global Active power (kilowatts)", ylab="Frequency")

## write plot data to file
dev.copy(png,"plot1.png", height = 480 , width = 480)
dev.off()
