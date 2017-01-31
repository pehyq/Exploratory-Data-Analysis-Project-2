# Plot 5
library(dplyr)
library(ggplot2)
## Data preprocessing
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")
fulldat<-merge(NEI, SCC, by = "SCC")

## Filter Baltimore City data and vehicle data 
full.Bal.dat<-filter(fulldat, fips=="24510")
Bal.veh<-full.Bal.dat[grep("Mobile", full.Bal.dat$EI.Sector,ignore.case = TRUE),]
## Sum data across each year
Bal.veh.tot <- aggregate(Emissions ~ year, Bal.veh, sum)

## Create Plot 5
png(filename = "Plot05.png")
plot5<-qplot(year, Emissions, data=Bal.veh.tot)+geom_line()
print(plot5)
dev.off()
