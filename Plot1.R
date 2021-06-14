#Plot 1
#Have total emissions from PM2.5 decreased in the United States from 1999 to 2008? Using the base plotting system,
#make a plot showing the total PM2.5 emission from all sources for each of the years 1999, 2002, 2005, and 2008

setwd("C:/Users/rkrishnaramanujam/Desktop/Data_Science/ExploratoryDataAnalysis/Week_4/Project2")

scc <- readRDS("C:/Users/rkrishnaramanujam/Desktop/Data_Science/ExploratoryDataAnalysis/Week_4/Project2/exdata_data_NEI_data/Source_Classification_Code.rds")
NEI <- readRDS("C:/Users/rkrishnaramanujam/Desktop/Data_Science/ExploratoryDataAnalysis/Week_4/Project2/exdata_data_NEI_data/summarySCC_PM25.rds")
sumEmi <- sum(NEI$Emissions, by = NEI$year)
sumEmi

Tot <- NEI %>% group_by(year) %>% 
  summarize(Emi_by_year = sum(Emissions));

png("C:/Users/rkrishnaramanujam/Desktop/Data_Science/ExploratoryDataAnalysis/Week_4/Project2/Plot_Codes/Plot1.png")
x1<-barplot(height=Tot$Emi_by_year/1000000, names.arg=Tot$year,
            xlab="years", ylab=expression('Total PM'[2.5]*' Emission in Tons'),ylim=c(0,8),
            main=expression('Total PM'[2.5]*' Emission Over Years in Tons'))
dev.off()