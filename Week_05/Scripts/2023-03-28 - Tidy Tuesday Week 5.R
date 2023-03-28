#### Tidy Tuesday: Week 5 ####
#### Created by: Mikayla Kerchen
#### Updated on: 2023-03-28

#### Load Libraries ####
library(tidyverse)
library(here)
library(readr)
library(gganimate)

#### Load Data ####

Colony_Data <- read.csv(url("https://raw.githubusercontent.com/rfordatascience/tidytuesday/master/data/2022/2022-01-11/colony.csv"))

glimpse(Colony_Data)

#### Removing Row from Data Frame ####

Colony_Data_States <- Colony_Data[-c(47,94,141,188,235,282,329,376,423,470,517,564,611,658,705,752,799,846,893,940,987,1034,1081,1128,1175,1222),]

#### Plotting ####

Colony_Data_States %>%
  drop_na() %>%
  ggplot(aes(x=state, y=colony_lost) ) +
  geom_bar(stat="identity", fill="#69b3a2") +
  labs( x = "State",
        y = "Number of Colonies Lost",
        title = "Bee Colony Losses in the United States",
        subtitle = "Colony Losses per State")+
  coord_flip() +
  theme(
    panel.grid.minor.y = element_blank(),
    panel.grid.major.y = element_blank(),
    legend.position="none") +
  transition_states(
    year, # what are we animating by
    transition_length = 10, #The relative length of the transition.
    state_length = 10 # The length of the pause between transitions
    )+
  ease_aes("sine-in-out") +
  ggtitle('Year: {closest_state}')
