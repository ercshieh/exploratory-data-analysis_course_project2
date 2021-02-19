library(ggplot2)
library(dplyr)

NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

bcdata <- subset(NEI,fips == "24510")
bcdata$year <- as.factor(bcdata$year)
bcdata$type <- as.factor(bcdata$type)

summary_bc<-bcdata %>% group_by(type,year) %>% 
    summarize(mean_emis = mean(Emissions, na.rm=TRUE))


# open the png device
png(filename = "plot3.png", width = 480, height = 480)

# plot the plot :-)

qplot(year,mean_emis,data=summary_bc, facets=.~type, ylab="Average PM2.5 emission",
      main="PM2.5 emission for Baltimore City by type")

# close the device!!
dev.off() 
