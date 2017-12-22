targetFile<-"D:/Users/susum/Anaconda3/envs/Python36_CudaGpu/R/Data Science/exdata_data_household_power_consumption/household_power_consumption.txt"
hpc<-read.table(file = targetFile,header=TRUE,sep = ";",na.strings = "?")
hpc[,1]<-as.Date(hpc[,1],format = "%d/%m/%Y")
hpcN<-hpc[hpc[,1]=="2007-02-01 "|hpc[,1]=="2007-02-02",]
hist(as.numeric(hpcN$Global_active_power), col="Red", main="Global Active Power", xlab="Global Active power (kilowatts)", ylab="Frequency")
dev.copy(png,"plot1.png", height = 480 , width = 480)
dev.off()