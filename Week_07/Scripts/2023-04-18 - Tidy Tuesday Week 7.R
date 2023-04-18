#### Tidy Tuesday: Week 7 ####
#### Created by: Mikayla Kerchen
#### Updated on: 2023-04-18
##################################

#### Load Libraries ####

library(tidyverse)
library(patchwork)
library(here)
library(readr)

#### Load Data ####

urlfile <- "https://raw.githubusercontent.com/rfordatascience/tidytuesday/master/data/2023/2023-04-11/egg-production.csv"

Egg_Data <- read.csv(url(urlfile)) # reads in the data from the Tidy Tuesday Repo

view(Egg_Data) # Allows me to view the whole data set

#### Plotting ####

Egg_Plot <- Egg_Data %>%    # Giving a name to the plot
  mutate(n_eggs = n_eggs/1000000000) %>%   # Dividing the number of eggs by a billion
  ggplot()+                                 
  geom_density(aes(x = n_eggs,             
                   y = ..density..), 
               fill = "#F05039",          # Color blind friendly color
               color="#e9ecef",            
               alpha=0.8)+                # Makes density plot see-through
  theme_bw()+
  labs(x = "Number of Eggs Produced (Per Billion)",  # Adds names for the x and y axis
       y = "Density")

Hen_Plot <- Egg_Data %>%            # Giving a name to the second plot
  mutate(n_hens = n_hens/100000000) %>%    # Dividing the number of hens by 100 million
  ggplot()+
  geom_density(aes(x = n_hens),       
               fill = "#3D65A5",         # Another color blind friendly color
               color = "#e9ecef",
               alpha = 0.8)+            # Makes density plot see-through
  theme_bw()+
  labs(x = "Number of Hens (Per Hundred Million)",  # Adds names for the x and y axis 
       y = "Density")

#### Combining the Plots ####

Egg_Plots <- Hen_Plot+Egg_Plot   # Using patchwork to combine the plots side by side and giving the new plot a new name

Egg_Plots +
  plot_annotation(title = "Egg Production in the U.S.",               # Adds title, subtitle, and caption to new combined plots
                  subtitle = "Comparison of Densities Between Total Eggs and Hens",
                  caption = "Data obtained from the Tidy Tuesday repository")+
  plot_annotation(tag_levels = 'A')            # Adds 'A' and 'B' labels to the two different plots
