#Plot 2
#Have total emissions from PM2.5 decreased in the Baltimore City, Maryland (\color{red}{\verb|fips == "24510"|}fips == "24510")
#from 1999 to 2008? Use the base plotting system to make a plot answering this question.

setwd("C:/Users/rkrishnaramanujam/Desktop/Data_Science/ExploratoryDataAnalysis/Week_4/Project2")

scc <- readRDS("C:/Users/rkrishnaramanujam/Desktop/Data_Science/ExploratoryDataAnalysis/Week_4/Project2/exdata_data_NEI_data/Source_Classification_Code.rds")
NEI <- readRDS("C:/Users/rkrishnaramanujam/Desktop/Data_Science/ExploratoryDataAnalysis/Week_4/Project2/exdata_data_NEI_data/summarySCC_PM25.rds")


Balt_Tot <- NEI %>% group_by(year) %>% 
  filter( fips == "24510") %>% 
  summarize(Emi_by_year_Type = sum(Emissions));


png("C:/Users/rkrishnaramanujam/Desktop/Data_Science/ExploratoryDataAnalysis/Week_4/Project2/Plot_Codes/Plot2.png")

x1<-barplot(height=Balt_Tot$Emi_by_year_Type/1000, names.arg=Balt_Tot$year,
            xlab="years", ylab=expression('Total PM'[2.5]*' Emission in Tons'),ylim=c(0,4),
            main=expression('Total PM'[2.5]*' Emission Over Years in Baltimore City'))

dev.off()
