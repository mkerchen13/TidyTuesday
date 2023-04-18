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
  geom_density(aes(x = n_eggs), 
               fill = "#F05039",          # Color blind friendly color
               color="#e9ecef",            
               alpha=0.8)+                # Makes density plot see-through
  theme_bw()+                             # Black and white theme
  labs(x = "Number of Eggs Produced (Per Billion)",  # Adds names for the x and y axis
       y = "Density")+
  theme(axis.text = element_text(size = 10,          # Changes the font size and color on the axis labels
                                 color = "black"),
        axis.title = element_text(size = 12,
                                  color = "black"))

Hen_Plot <- Egg_Data %>%            # Giving a name to the second plot
  mutate(n_hens = n_hens/100000000) %>%    # Dividing the number of hens by 100 million
  ggplot()+                               # Black and white theme
  geom_density(aes(x = n_hens),       
               fill = "#3D65A5",         # Another color blind friendly color
               color = "#e9ecef",
               alpha = 0.8)+            # Makes density plot see-through
  theme_bw()+
  labs(x = "Number of Hens (Per Hundred Million)",  # Adds names for the x and y axis 
       y = "Density")+
  theme(axis.text = element_text(size = 10,
                                 color = "black"),  # Changes the font size and color for the axis labels
        axis.title = element_text(size = 12,
                                  color = "black"))

#### Combining the Plots ####

Egg_Plots <- Hen_Plot+Egg_Plot   # Using patchwork to combine the plots side by side and giving the new plot a new name

Egg_Plots +
  plot_annotation(title = "Egg Production in the U.S.",               # Adds title, subtitle, and caption to new combined plots
                  subtitle = "Comparison of Densities Between Total Eggs and Hens",
                  caption = "Data obtained from the Tidy Tuesday repository",
                  theme(plot.title = element_text(size = 16,   # Changes the font size and color of the text on the plot title and subtitle added by patchwork
                                 color = "black"),
       plot.subtitle = element_text(size = 14,
                                    color = "black")))+
  plot_annotation(tag_levels = 'A') & # Adds 'A' and 'B' labels to the two different plots
  theme(text = element_text('serif')) # Changes the font of the plot labels and patchwork additions

#### Save the Plot ####

ggsave(here("Week_07", "Output", "Egg_Prod_Plot.png"),    # Saves the plot and sets the height and width of the image
       width = 10, height = 8)
