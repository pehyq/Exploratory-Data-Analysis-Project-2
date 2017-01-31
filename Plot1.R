# Plot 1
## Data preprocessing
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

## Sum data from each source
totalemissions<-tapply(NEI$Emissions, NEI$year, sum)
totalemissions

## Create plot 1
png(filename="Plot01.png")
plot(c(1999, 2002, 2005, 2008), totalemissions, "l",
     xlab = "Year", ylab = "Total Emissions", 
     main = "total PM2.5 emission from all sources")
dev.off()
