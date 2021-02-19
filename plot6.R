NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

mobileSCC <- SCC[grepl('Mobile Sources',SCC$SCC.Level.One),]
# get only the SCC column
mobileSCC <- mobileSCC$SCC

bcdata <- subset(NEI,fips == "24510")
ladata <- subset(NEI,fips == "06037")

mobileVehdataBC <- subset(bcdata,SCC %in% mobileSCC)
mobileVehdataLA <- subset(ladata,SCC %in% mobileSCC)

totalEmBC <- tapply(mobileVehdataBC$Emissions,mobileVehdataBC$year,FUN=mean, na.rm=TRUE)
totalEmLA <- tapply(mobileVehdataLA$Emissions,mobileVehdataLA$year,FUN=mean, na.rm=TRUE)


# open the png device
png(filename = "plot6.png", width = 480, height = 480)

# plot the plot :-)
par(mfrow=c(1,2), mar=c(4,4,2,1))

plot(names(totalEmBC),totalEmBC, xlab="year", ylab="mean PM2.5 emission", pch=19,
     main="Baltimore City")

plot(names(totalEmLA),totalEmLA, xlab="year", ylab="mean PM2.5 emission", pch=19,
     main="Los Angeles")

# close the device!!
dev.off() 
