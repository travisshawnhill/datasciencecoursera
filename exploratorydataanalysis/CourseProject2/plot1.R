## Exploratory Data Analysis, Course Project 2
## EPA PM2.5 Data Analysis
## Plot 1

## Read data from summarySCC_PM25.rds and Source_Classification_Code.rds
## into environment, assuming these two datasets are downloaded and 
## unzipped in your working directory

NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

PM25Totals <- tapply(NEI$Emissions, NEI$year, FUN=sum) # Determine Emissions totals by year

png(filename = "plot1.png", width = 480, height = 480) ## Initialize PNG device
par(mar = c(5,5,5,5)) # Set margins for base graphic system

## Create a bar chart, with totals added as text for each year
plot1 = barplot(PM25Totals, col = c("thistle4", "thistle3", "thistle2", "thistle1"))
title(main = "Total PM 2.5 Emissions in the United States", xlab = "Year", ylab = "Total PM 2.5 Emissions (Tons)")
text(plot1, y = PM25Totals/2, labels=as.character(round(PM25Totals, 2)), cex = .8)

dev.off() ## Close connection to PNG device