## EPA PM2.5 Data Analysis
## Plot 6

## Read data from summarySCC_PM25.rds and Source_Classification_Code.rds
## into environment, assuming these two datasets are downloaded and 
## unzipped in your working directory

NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

library(dplyr) ## Include dplyr package to use filter command for regex subsetting

## Filter NEI data for "ON-ROAD" PM2.5 sources in Baltimore City and LA, based on wikipedia
## definition of "motor vehicle", found here:
## https://en.wikipedia.org/wiki/Motor_vehicle
## Note: this definition excludes trains, trams and airplanes, as the data shows.


motorVehiclesBC <- filter(NEI, NEI$fips == "24510" & NEI$type == 'ON-ROAD')
motorVehiclesLA <- filter(NEI, NEI$fips == "06037" & NEI$type == 'ON-ROAD')

# Add city column to df for differentiation on plot
motorVehiclesBC$city <- "Baltimore City"
motorVehiclesLA$city <- "Los Angeles County"

# Combine two cities' subset data into single df using rbind
combineVehicles <- rbind(motorVehiclesBC, motorVehiclesLA)


library(ggplot2)

png("plot6.png",width=480,height=480) ## Initialize PNG device

## Plot the subsetted emissions data against year in two facets for each city
g <- ggplot(combineVehicles, aes(factor(year), Emissions, fill=city))
g <- g + geom_bar(stat="identity")
g <- g + facet_grid(.~city)
g <- g + labs(x = "Year", y = "Total PM2.5 Emissions (Tons)")
g <- g + labs(title = "Motor Vehicle Emissions in Baltimore City and Los Angeles County")
g <- g + guides(fill=FALSE)
g

dev.off()