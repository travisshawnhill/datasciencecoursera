## EPA PM2.5 Data Analysis
## Plot 3

## Read data from summarySCC_PM25.rds and Source_Classification_Code.rds
## into environment, assuming these two datasets are downloaded and 
## unzipped in your working directory

NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

NEIBaltimore <- subset(NEI, NEI$fips == "24510") ## Subset to work with Baltimore City data only

png(filename = "plot3.png", width = 480, height = 480) ## Initialize PNG device

##Construct the plot, 4 graphs of PM2.5 vs Year, separated by Type
library(ggplot2)
g <- ggplot(NEIBaltimore, aes(factor(year), Emissions, fill=type))
g <- g + geom_bar(stat="identity") + facet_grid(.~type)
g <- g + labs(title = "PM2.5 Emissions in Baltimore City by Source Type")
g <- g + labs(x = "Year", y = "Total PM2.5 Emissions (Tons)")
g <- g + guides(fill=FALSE) ## Remove legend as it is unnecessary and crowds graph
g

dev.off() ## Close connection to PNG device