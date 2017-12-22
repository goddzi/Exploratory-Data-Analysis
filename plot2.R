## read data to dataframe
hpc<-read.table(file = targetFile,header=TRUE,sep = ";",na.strings = "?")

## change date and time format
hpc[,1]<-as.Date(hpc[,1],format = "%d/%m/%Y")
hpcN<-hpc[hpc[,1]=="2007-02-01 "|hpc[,1]=="2007-02-02",]

## conbine date and time
hpcN[,1]<-as.POSIXct(paste(hpcN[,1],hpcN[,2]))
hpcN[,2]<-NULL

## plot data
plot(hpcN$Date,hpcN$Global_active_power,type="l",xlab = "",ylab = "Global Active Power (kilowatts)")

## write plot data to file
dev.copy(png,"plot3.png", height = 480 , width = 480)
dev.off()
