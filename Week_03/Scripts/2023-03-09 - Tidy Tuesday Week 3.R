#### Tidy Tuesday: Week 3 ####
### Created by: Mikayla Kerchen
### Updated on: 2023-03-09  
###################################

#### Load Libraries ####

library(tidyverse)
library(here)
library(usmap)

#### Load Data ####

CatvDog_Data <- read.csv(here("Week_03", "Data", "cats_vs_dogs.csv"))

View(CatvDog_Data)

#### Map Data ####

plot_usmap(data = CatvDog_Data, 
           values = "percent_cat_owners",
           regions = "states",
           exclude = c("AK", "HI"),
           color = "blue")+
  labs(title = "Cat Owners of the United States",
       subtitle = "Percentage of Cat Owners by State")+
  theme(panel.background = element_blank(),
        legend.position = "right")+
  scale_fill_continuous(low = "white", high = "blue", name = "Percentage of Cat Owners")

ggsave(here("Week_03", "Output", "PercentageCats.png"),
       width = 7, height = 7)
