# Plot 3
library(dplyr)
library(ggplot2)
## Data preprocessing
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

## Filter Baltimore City data and sum across each year and type
Bal.dat<-filter(NEI, fips=="24510")
Bal.type <- aggregate(Emissions ~ year + type, Bal.dat, sum)

## Create Plot 3
png(filename = "Plot03.png")
g<-qplot(year, Emissions, data = Bal.type, color=type)
plot3<-g+geom_line()
print(plot3)
dev.off()