
#Plot 3
#Of the four types of sources indicated by the \color{red}{\verb|type|}type (point, nonpoint, onroad, nonroad) variable,
#which of these four sources have seen decreases in emissions from 1999-2008 for Baltimore City? Which have seen increases 
#in emissions from 1999-2008? Use the ggplot2 plotting system to make a plot answer this question.

setwd("C:/Users/rkrishnaramanujam/Desktop/Data_Science/ExploratoryDataAnalysis/Week_4/Project2")

scc <- readRDS("C:/Users/rkrishnaramanujam/Desktop/Data_Science/ExploratoryDataAnalysis/Week_4/Project2/exdata_data_NEI_data/Source_Classification_Code.rds")
NEI <- readRDS("C:/Users/rkrishnaramanujam/Desktop/Data_Science/ExploratoryDataAnalysis/Week_4/Project2/exdata_data_NEI_data/summarySCC_PM25.rds")

png("C:/Users/rkrishnaramanujam/Desktop/Data_Science/ExploratoryDataAnalysis/Week_4/Project2/Plot_Codes/Plot3.png", width = 480, height = 480)

Balt_Tot_byType <- NEI %>% group_by(year, type) %>% 
  filter( fips == "24510") %>% 
  summarize(Emi_by_year_Type = sum(Emissions));

library(ggplot2)

ggplot(data=Balt_Tot_byType, aes(x=year, y=Emi_by_year_Type, group=type, colour=type)) +
  geom_line() +
  geom_point()+
  ggtitle("Change in Emissions Over Time and Types of Sources in Baltimore City")
dev.off()
