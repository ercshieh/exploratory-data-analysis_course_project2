NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

totalEm <- tapply(NEI$Emissions,NEI$year,FUN=sum, na.rm=TRUE)

# open the png device
png(filename = "plot1.png", width = 480, height = 480)

# plot the plot :-)
plot(names(totalEm),totalEm, xlab="year", ylab="total PM2.5 emission", pch=19)

# close the device!!
dev.off() 
