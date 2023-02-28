#### Tidy Tuesday Plot: Week 2 ####
### Created by: Mikayla Kerchen
### Updated on: 2023-02-28
######################################

#### Load Libraries ####

library(tidyverse)
library(here)
library(maps)

#### Load Data ####

NumbatsData <- read.csv(here("Week_02", "Data","numbats.csv"))

View(NumbatsData)

#### Data Analysis and Plotting ####

Australia <- map_data("world", region = "Australia")

NumbatsData_Clean <- na.omit(NumbatsData) %>%
  group_by(decimalLongitude, decimalLatitude, eventDate) %>%
  mutate(long = decimalLongitude,
         lat = decimalLatitude)

merge_data <- full_join(Australia, NumbatsData_Clean)

ggplot() + 
  geom_polygon(data = Australia, aes(x = long, y = lat, group = group, fill = region), 
               color = "black") + 
  facet_wrap(~wday)+
  geom_point(data = NumbatsData_Clean, aes(x = decimalLongitude, y = decimalLatitude, color = wday), size = 3, na.rm = TRUE)+
  labs(x = "Longitude",
       y = "Latitude",
       fill = "Region",
       color = "Week Day")
  

ggsave(here("Week_02","Output","AustraliaPlot.png"),
       width = 10, height = 10)
  
