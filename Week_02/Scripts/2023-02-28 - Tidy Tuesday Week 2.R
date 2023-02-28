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

Australia <- map_data("world", region = "Australia")     # Allows me to make a plot using the shape of Australia

WDay_Clean <- NumbatsData %>%              # Removes the NAs from the week day column in the Numbats data frame
  drop_na(wday)

ggplot() + 
 geom_polygon(data = Australia, aes(x = long, y = lat, group = group, fill = region),      # Only makes the Australia plot 
               color = "black") + 
  facet_wrap(~wday)+
  geom_point(data = WDay_Clean, aes(x = decimalLongitude, y = decimalLatitude, color = wday), size = 3)+ # Adds points to the Australia plot
  labs(x = "Longitude",             # Makes "pretty labels" for the plots
       y = "Latitude",
       fill = "Region",
       color = "Week Day",
       title = "Numbat Sightings",
       subtitle = "By Week Day")+
  theme(axis.title = element_text(size = 14,          # Changes the size, color, face and adjustment of the plot titles.
                                  color = "black"),
        axis.title.x = element_text(vjust = -0.5),    # Moves the x-axis away from the tick marks
        plot.title = element_text(size = 16, 
                                  color = "black", 
                                  face = "bold", 
                                  hjust = 0.5),
        plot.subtitle = element_text(size = 13,
                                     color = "black",
                                     hjust = 0.5,
                                     face = "italic"),
        axis.text.x = element_text(size = 10,
                                   color = "black"),
        axis.text.y = element_text(size = 10,
                                   color = "black"))+
  scale_fill_manual(values = "beige")                  # Changed the color of the fill so it didn't match any of the week day points
  

ggsave(here("Week_02","Output","AustraliaPlot.png"),
       width = 10, height = 10)
  
