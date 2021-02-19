NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

bcdata <- subset(NEI,fips == "24510")

totalEm <- tapply(bcdata$Emissions,bcdata$year,FUN=sum, na.rm=TRUE)

# open the png device
png(filename = "plot2.png", width = 480, height = 480)

# plot the plot :-)
plot(names(totalEm),totalEm, xlab="year", ylab="total PM2.5 emission", pch=19,
     main="Total PM2.5 emission for Baltimore City, Maryland")

# close the device!!
dev.off() 
