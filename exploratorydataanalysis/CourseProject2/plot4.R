## EPA PM2.5 Data Analysis
## Plot 4

## Read data from summarySCC_PM25.rds and Source_Classification_Code.rds
## into environment, assuming these two datasets are downloaded and 
## unzipped in your working directory

NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

## Use grepl() to subset out "comb" and "coal" entries from SCC Data
combustion <- grepl("comb", SCC$SCC.Level.One, ignore.case = TRUE)
coal <- grepl("coal", SCC$SCC.Level.Four, ignore.case = TRUE)
combustionCoal <- (combustion & coal)

combustionSCCData <- SCC[combustionCoal,]$SCC ## Find SCC values for coal/comb entries
combustionNEIData <- NEI[NEI$SCC %in% combustionSCCData,] #Find Emissions values from subsetted SCC values

library(ggplot2)

png("plot4.png",width=480,height=480) ## Initialize PNG device

## Plot the subsetted emissions data against year
g <- ggplot(combustionNEIData, aes(factor(year), Emissions))
g <- g + geom_bar(stat="identity", fill="thistle4")
g <- g + labs(x="Year", y="Total PM2.5 Emissions (Tons)")
g <- g + labs(title = "PM2.5 Coal Combustion Emissions in United States")
g

dev.off() ## Close connection to PNG device
