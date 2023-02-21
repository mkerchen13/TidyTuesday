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
  group_by(painting_index, painting_title, num_colors, season) %>%
  filter(season == 1 | season == 2 | season == 3) %>%
  ggplot(aes(x = painting_title,
             y = num_colors,
             fill = season))+
  scale_y_continuous(pretty_breaks)+
  labs( x = "Name of Painting",
        y = "Number of Colors Used",
        title = "Number of Colors Used in Bob Ross Paintings",
        subtitle = "Season 1-3")+
  theme_bw()+
  theme(axis.title = element_text(size = 14, 
                                  color = "black"),
        plot.title = element_text(size = 16, 
                                  color = "black", 
                                  face = "bold", 
                                  hjust = 0.5),
        plot.subtitle = element_text(size = 14, 
                                     color = "black", 
                                     hjust = 0.05),
        axis.text.x = element_text(size = 10,
                                   color = "black"),
        axis.text.y = element_text(size = 10,
                                   color = "black",
                                   face = "italic"))+
  geom_segment( aes(x=painting_title ,
                    xend = painting_title, 
                    y=0, 
                    yend = num_colors), 
                color="black") +
  geom_point(size=3) +
  coord_flip() 

ggsave(here("Week_01", "Output", "BobRoss_Colors.png"),
       width = 10, height = 10)
