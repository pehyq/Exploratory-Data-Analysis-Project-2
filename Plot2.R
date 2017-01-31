# Plot 2
library(dplyr)
## Data preprocessing
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

## Filter Baltimore City data and sum across each year
Bal.dat<-filter(NEI, fips=="24510")
Bal.tot<-tapply(Bal.dat$Emissions, Bal.dat$year, sum)
Bal.tot

## Create Plot 2
png(filename="Plot02.png")
plot(c(1999, 2002, 2005, 2008), Bal.tot, "l",
     xlab = "Year", ylab = "Total Emissions", 
     main = "Baltimore total PM2.5 emission from all sources")
dev.off()