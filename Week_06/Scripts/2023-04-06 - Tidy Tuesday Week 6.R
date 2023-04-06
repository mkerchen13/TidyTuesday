#### Tidy Tuesday: Week 6 ####
#### Created by: Mikayla Kerchen
#### Updated on: 2023-04-06
#####################################

#### Load Libraries ####

library(tidyverse)
library(here)
library(readr)


#### Load Data ####

urlfile <- "https://raw.githubusercontent.com/rfordatascience/tidytuesday/master/data/2021/2021-12-21/starbucks.csv"

Starbs_Data <- read.csv(url(urlfile))  # Importing the data from github

View(Starbs_Data)

#### Filtering the Data ####

Starbs_Data_Pop <-  Starbs_Data %>% # Filtering the data based on popular drinks from my personal experience/store I work at currently.
  filter(product_name %in% c("Caramel Macchiato", "Iced Caramel Macchiato", "White Chocolate Mocha", "Iced White Chocolate Mocha", "Chai tea Latte", "Iced Chai Tea Latte"))

#### Plotting ####

Starbs_Data_Pop %>%
  ggplot(aes(x =product_name,           # I wanted to plot how many calories were in the drinks compared to their names.
             y = calories))+
  geom_violin(fill = "#00704A")+  # I used the Starbucs green hexcode
  theme_bw()+
  coord_flip()+                   # Flips the coordinate plane
  labs(title = "Calories Per Popular Starbucks Drink",         # Gives pretty names to the plot
       x = "Product Name",
       y = "Calories")+
  theme(plot.title = element_text(size = 16,                  # Changes the size, color, and centering of the labels on the plot.
                                  color = "black",
                                  hjust = 0.5),
        plot.subtitle = element_text(size = 14,
                                     color = "black",
                                     hjust = 0.5),
        axis.text = element_text(size = 10,
                                 color = "black"),
        axis.title = element_text(size = 12,
                                  color = "black"))+
  facet_wrap(~milk, labeller = labeller(milk =                # facet wraps the plot based on milk used
                                          c("1" = "Nonfat Milk",   # Relabelled the titles since they were numbers
                                            "2" = "2%",
                                            "3" = "Soy Milk",
                                            "4" = "Coconut Milk",
                                            "5" = "Whole Milk")))

ggsave(here("Week_06", "Output", "StarbsPlot.png"),     # saves the plot
       width = 7, height = 7)
  
  

  
  
