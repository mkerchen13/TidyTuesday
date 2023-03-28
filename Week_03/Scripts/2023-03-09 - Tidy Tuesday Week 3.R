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

plot_usmap(data = CatvDog_Data,           # Plots a flat map of the US.
           values = "percent_cat_owners",  # Uses the data set and plots the percentage data.
           regions = "states",
           exclude = c("AK", "HI"),       # Excluding Alaska and Hawaii from the map since there is no data for them.
           color = "blue")+
  labs(title = "Cat Owners of the United States",         # Adds titles to the plot.
       subtitle = "Percentage of Cat Owners by State")+
  theme(panel.background = element_blank(),             # Makes the map blank inside and put the legend to the right.
        legend.position = "right",
        plot.background = "black")+
  scale_fill_continuous(low = "white", high = "blue", name = "Percentage of Cat Owners")    # Gives a gradient effect in order of how high ot low tyhre percentage is.

ggsave(here("Week_03", "Output", "PercentageCats.png"),
       width = 7, height = 7) # Saves the plot and changes the size of the output.

plot_usmap(data = CatvDog_Data,           # Plots a flat map of the US.
           values = "percent_dog_owners",  # Uses the data set and plots the percentage data.
           regions = "states",
           exclude = c("AK", "HI"),       # Excluding Alaska and Hawaii from the map since there is no data for them.
           color = "red")+
  labs(title = "Dog Owners of the United States",         # Adds titles to the plot.
       subtitle = "Percentage of Dog Owners by State")+
  theme(panel.background = element_blank(),             # Makes the map blank inside and put the legend to the right.
        legend.position = "right")+
  scale_fill_continuous(low = "white", high = "red", name = "Percentage of Dog Owners")    # Gives a gradient effect in order of how high ot low tyhre percentage is.

ggsave(here("Week_03", "Output", "PercentageDogs.png"),
       width = 7, height = 7)