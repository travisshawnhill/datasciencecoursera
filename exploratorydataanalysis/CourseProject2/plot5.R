## EPA PM2.5 Data Analysis
## Plot 5

## Read data from summarySCC_PM25.rds and Source_Classification_Code.rds
## into environment, assuming these two datasets are downloaded and 
## unzipped in your working directory

NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

library(dplyr) ## Include dplyr package to use filter command for regex subsetting

## Filter NEI data for "ON-ROAD" PM2.5 sources in Baltimore City, based on wikipedia
## definition of "motor vehicle", found here:
## https://en.wikipedia.org/wiki/Motor_vehicle
## Note: this definition excludes trains, trams and airplanes, as the data shows.

motorVehicles <- filter(NEI, NEI$fips == "24510" & NEI$type == 'ON-ROAD')

library(ggplot2)

png("plot5.png",width=480,height=480) ## Initialize PNG device

## Plot the subsetted emissions data against year
g <- ggplot(motorVehicles, aes(factor(year), Emissions))
g <- g + geom_bar(stat="identity", fill="tomato3")
g <- g + labs(x="Year", y="Total PM2.5 Emissions (Tons)")
g <- g + labs(title = "PM2.5 Motor Vehicle Emissions in Baltimore City")
g

dev.off() ## Close connection to PNG device

