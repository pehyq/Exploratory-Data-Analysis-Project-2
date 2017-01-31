# Plot 4
library(dplyr)
library(ggplot2)
## Data preprocessing
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")
fulldat<-merge(NEI, SCC, by = "SCC")

## Filter coal data and sum across each year
coaldat<-fulldat[grep("coal", fulldat$Short.Name,ignore.case = TRUE),]
coaltot <- aggregate(Emissions ~ year, coaldat, sum)

## Create Plot 4
png(filename = "Plot04.png")
plot4<-qplot(year, Emissions, data=coaltot)+geom_line()
print(plot4)
dev.off()