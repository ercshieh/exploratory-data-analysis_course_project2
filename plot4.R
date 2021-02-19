NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

# get only get the rows with Coal in the Short.Name
coalSCC <- SCC[grepl('Coal',SCC$Short.Name),]
# get only the SCC column
namesCoal <- coalSCC$SCC

coaldata <- subset(NEI,SCC %in% namesCoal)

totalEm <- tapply(coaldata$Emissions,coaldata$year,FUN=mean, na.rm=TRUE)

# open the png device
png(filename = "plot4.png", width = 480, height = 480)

# plot the plot :-)

plot(names(totalEm),totalEm, xlab="year", ylab="mean PM2.5 emission", pch=19,
     main="Mean PM2.5 emission for Coal sources")

# close the device!!
dev.off() 
