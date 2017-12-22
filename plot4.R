
## read data to dataframe
hpc<-read.table(file = targetFile,header=TRUE,sep = ";",na.strings = "?")

## change date and time format
hpc[,1]<-as.Date(hpc[,1],format = "%d/%m/%Y")
hpcN<-hpc[hpc[,1]=="2007-02-01 "|hpc[,1]=="2007-02-02",]

## env set
par(mfrow=c(2,2), mar=c(4,4,2,1), oma=c(0,0,2,0))

## conbine date and time
hpcN[,1]<-as.POSIXct(paste(hpcN[,1],hpcN[,2]))
hpcN[,2]<-NULL

## plot all 
plot(hpcN$Date,hpcN$Global_active_power,type="l",xlab = "datetime",ylab = "Global Active Power")

plot(hpcN$Voltage~hpcN$Date,type="l",xlab = "datetime",ylab = "Voltage")

with(hpcN, {plot(Sub_metering_1~Date,type="l",xlab = "",ylab = "Energy sub metering")
  lines(Sub_metering_2~Date,col="red")
  lines(Sub_metering_3~Date,col="blue")
  legend("topright", legend = c("Sub_metering_1", "Sub_metering_2","Sub_metering_3"),col = c("black","red","blue")
         , lty=1, lwd=2, bty="n")
  })

plot(hpcN$Global_reactive_power~hpcN$Date,type="l",xlab = "datetime",ylab = "Global_reactive_power")

## write file
dev.copy(png,"plot4.png", height = 480 , width = 480)
dev.off()
