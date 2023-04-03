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
# Imported data from Tidy Tuesday repository on Github.

glimpse(Colony_Data)
# Allows me to look at a portion of the data.

#### Removing Row from Data Frame ####

Colony_Data_States <- Colony_Data[-c(47,94,141,188,235,282,329,376,423,470,517,564,611,658,705,752,799,846,893,940,987,1034,1081,1128,1175,1222),]
# Removed the rows that included data for the United States overall. Only wanted data for the states.
#### Plotting ####

Colony_Data_States %>%
  drop_na() %>%  # Dropping the NAs
  ggplot(aes(x=state, y=colony_lost)) +
  geom_bar(stat="identity", fill="#69b3a2") +   # Makes a bar plot
  labs( x = "State",                          # Gives "pretty names" to the plot
        y = "Number of Colonies Lost",
        title = "Bee Colony Losses in the United States",
        subtitle = "Colony Losses per State")+
  coord_flip() +            # Flips the coordinate plane.
  theme(
    panel.grid.minor.y = element_blank(),   # Removes the major and minor gridlines for the y axis.
    panel.grid.major.y = element_blank(),
    legend.position="none") +               # Removes the legend.
  transition_states(
    year,                  # What the plot is being animated by
    transition_length = 200, # The relative length of the transition.
    state_length = 200 # The length of the pause between transitions.
    )+
  ease_aes("sine-in-out") +    # Setting for the movement of the animation
  ggtitle('Bee Colony Losses in the United States',   # Titles the animation and adds a subtitle to show the year.
  subtitle = 'Year: {closest_state}')

#### Saving the Plot/Animation ####

anim_save(here("Week_05", "Output", "BeeColonyLosses.gif"))
