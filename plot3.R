## read data to dataframe
hpc<-read.table(file = targetFile,header=TRUE,sep = ";",na.strings = "?")

## change date and time format
hpc[,1]<-as.Date(hpc[,1],format = "%d/%m/%Y")
hpcN<-hpc[hpc[,1]=="2007-02-01 "|hpc[,1]=="2007-02-02",]

## conbine date and time
hpcN[,1]<-as.POSIXct(paste(hpcN[,1],hpcN[,2]))
hpcN[,2]<-NULL

## plot data
with(hpcN, {plot(Sub_metering_1~Date,type="l",xlab = "",ylab = "Energy sub metering")
  lines(Sub_metering_2~Date,col="red")
  lines(Sub_metering_3~Date,col="blue")
  legend("topright", legend = c("Sub_metering_1", "Sub_metering_2","Sub_metering_3"),col = c("black","red","blue")
         , lty=1, lwd=2, bty="n")
         
## write plot data to file         
dev.copy(png,"plot3.png", height = 480 , width = 480)
dev.off()
