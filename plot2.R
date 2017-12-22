targetFile<-"D:/Users/susum/Anaconda3/envs/Python36_CudaGpu/R/Data Science/exdata_data_household_power_consumption/household_power_consumption.txt"
hpc<-read.table(file = targetFile,header=TRUE,sep = ";",na.strings = "?")
hpc[,1]<-as.Date(hpc[,1],format = "%d/%m/%Y")
hpcN<-hpc[hpc[,1]=="2007-02-01 "|hpc[,1]=="2007-02-02",]
hpcN[,1]<-as.POSIXct(paste(hpcN[,1],hpcN[,2]))
hpcN[,2]<-NULL
plot(hpcN$Date,hpcN$Global_active_power,type="l",xlab = "",ylab = "Global Active Power (kilowatts)")
dev.copy(png,"plot2.png", height = 480 , width = 480)
dev.off()