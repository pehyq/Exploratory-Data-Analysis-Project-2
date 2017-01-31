# Plot 6
library(dplyr)
library(ggplot2)
## Data preprocessing
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")
fulldat<-merge(NEI, SCC, by = "SCC")

## Filter Baltimore City vehicle data and sum across each year 
full.Bal.dat<-filter(fulldat, fips=="24510")
Bal.veh<-full.Bal.dat[grep("Mobile", full.Bal.dat$EI.Sector,ignore.case = TRUE),]
Bal.veh.tot <- aggregate(Emissions ~ year, Bal.veh, sum)

## Filter LA City vehicle data and sum across each year 
full.LAC.dat<-filter(fulldat, fips=="06037")
LAC.veh<-full.LAC.dat[grep("Mobile", full.LAC.dat$EI.Sector,ignore.case = TRUE),]
LAC.veh.tot <- aggregate(Emissions ~ year, LAC.veh, sum)

## Merge data
mergedat<- merge(LAC.veh.tot, Bal.veh.tot, by = "year")
names(mergedat)<-c("year", "Los.Angeles.City", "Baltimore.City")

## Create Plot 6
png(filename = "Plot06.png")
plot6<-ggplot(data = mergedat, aes(x=year)) +
  geom_line(aes(y = Los.Angeles.City, colour = "Los.Angeles.City")) +
  geom_line(aes(y = Baltimore.City, colour = "Baltimore.City")) +
  ylab("Vehicle Emissions")
print(plot6)
dev.off()
