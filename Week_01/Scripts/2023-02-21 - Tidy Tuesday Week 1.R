#### Tidy Tuesday Plot: Week 1 ####
### Created by: Mikayla Kerchen
### Updated on: 2023-02-21
########################################

#### Load Libraries ####
library(tidyverse)
library(here)

#### Load Data ####

BobRoss_Data <- read.csv(here("Week_01", "Data", "bob_ross.csv"))

#### Data Analysis and Plotting ####

View(BobRoss_Data)

BobRoss_Data %>%
  group_by(painting_index, painting_title, num_colors, season) %>%  # Grouping the data by the painting title, index, number of colors, and season
  filter(season == 1 | season == 2 | season == 3) %>%               # Filtering the data by the first three seasons
  ggplot(aes(x = painting_title,
             y = num_colors,
             color = season))+
  labs( x = "Name of Painting",                                     # Adds pretty titles to the x-axis, y-axis, title, subtitle, and legend
        y = "Number of Colors Used",
        title = "Number of Colors Used in Bob Ross Paintings",
        subtitle = "Seasons 1-3",
        color = "Season")+
  theme_bw()+
  theme(axis.title = element_text(size = 14,          # Changes the size, color, face and adjustment of the plot titles.
                                  color = "black"),
        axis.title.x = element_text(vjust = -0.5),    # Moves the x-axis away from the tick marks
        plot.title = element_text(size = 16, 
                                  color = "black", 
                                  face = "bold", 
                                  hjust = 0.5),
        plot.subtitle = element_text(size = 14, 
                                     color = "black", 
                                     hjust = 0.18,
                                     face = "italic"),
        axis.text.x = element_text(size = 10,
                                   color = "black"),
        axis.text.y = element_text(size = 10,
                                   color = "black",
                                   face = "italic"))+   # Italicizes the painting names
  geom_segment(aes(x=painting_title ,                   # Changes the bar plot sections to a small stick segment.
                    xend = painting_title, 
                    y=0, 
                    yend = num_colors), 
                    color="black") +          # Colors the segment black
  geom_point(size=4) +                        # Changes size of the points on the plot
  coord_flip()             # Flips the coordinate plane

ggsave(here("Week_01", "Output", "BobRoss_Colors.png"),
       width = 10, height = 10)
