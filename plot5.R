NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

mobileSCC <- SCC[grepl('Mobile Sources',SCC$SCC.Level.One),]
# get only the SCC column
mobileSCC <- mobileSCC$SCC

bcdata <- subset(NEI,fips == "24510")

mobileVehdata <- subset(bcdata,SCC %in% mobileSCC)

totalEm <- tapply(mobileVehdata$Emissions,mobileVehdata$year,FUN=mean, na.rm=TRUE)

# open the png device
png(filename = "plot5.png", width = 480, height = 480)

# plot the plot :-)

plot(names(totalEm),totalEm, xlab="year", ylab="mean PM2.5 emission", pch=19,
     main="Mean PM2.5 emission for motor vehicle sources in Baltimore City")

# close the device!!
dev.off() 
