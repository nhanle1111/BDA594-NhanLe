setwd("/Users/ren/Documents/webexercise-2")
# Load & install required libraries
# install.packages("dplyr")
library(ggplot2) 
library(dplyr)
# Read csv data into R dataframe
cause_of_death_data <- read.csv("Leading_Causes_of_Death_in_SD_2011_2016.csv")
# List all the field names
names(cause_of_death_data)
top5_causes <- cause_of_death_data %>%
select(Year, Rank, `San.Diego.County.Underlying.Cause.of.Death`, `San.Diego.County.Percent.Deaths`) %>%
filter(Rank <= 5)
# Rename columns 
colnames(top5_causes) <- c("Year", "Rank", "Cause", "Percent")
ggplot(top5_causes, aes(x = reorder(Cause, -Percent), y = Percent, fill = factor(Year))) + geom_bar(stat = "identity", position = "dodge") + facet_wrap(~Year, scales = "free_x") + labs(title = "Top 5 Leading Causes of Death in San Diego (2011–2016)",  x = "Cause of Death", y = "Percent of Total Deaths",  fill = "Year") + theme_minimal() +  theme(axis.text.x = element_text(angle = 70, hjust = 1))
ggsave("Top5_Causes_By_Year_by_Nhan_Le_1.png", width = 14, height = 8, bg= "white”)

