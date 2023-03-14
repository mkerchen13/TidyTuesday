###### Tidy Tuesday: Week 4 ######
#### Created by: Mikayla Kerchen
#### Updated on: 2023-03-14
#######################################

#### Load Libraries ####
library(tidyverse)
library(here)
library(readr)
library(ggridges)
library(paletteer)
library(ggthemes)

#### Load Data ####

urlfile="https://raw.githubusercontent.com/rfordatascience/tidytuesday/master/data/2022/2022-01-18/chocolate.csv"

Choc_Data <- read.csv(url(urlfile))  # Importing the data from github

#### Making a Palette ####
Choc_palette <- paletteer_c("ggthemes::Brown", 48)   # Making a palette of browns to color the plot with

#### Data and Plotting ####

Choc_Data <- na.omit(Choc_Data)

Choc_Data %>%
  group_by(country_of_bean_origin) %>%      # Grouping by country of bean origin
  filter(!is.na(rating)) %>%
  ggplot(aes(y = country_of_bean_origin, x = rating, fill = country_of_bean_origin)) +    
  geom_density_ridges(alpha = 0.6, bandwidth = 0.1)+               # Makes a ridge line plot
  labs(title = "Chocolate Ratings by Country of Bean Origin",      # Gives pretty names to the plot
       x = "Rating",
       y = "Country of Bean Origin")+
  theme_bw()+
  theme(legend.position = "none",                     # Gets rid of the legend
        axis.title = element_text(size = 15,          # Changes the size, color, face and adjustment of the plot titles.
                                   color = "black"),   
         plot.title = element_text(size = 16, 
                                   color = "black", 
                                   face = "bold", 
                                   hjust = 0.5))+
  scale_fill_manual(values = Choc_palette)            # Fills the plot with the custom palette made earlier
 

ggsave(here("Week_04", "Output", "ChocolateRatings.png"),    # Saves the plot
       width = 10, height = 10)
