#### Tidy Tuesday: Week 8 ####
#### Created by: Mikayla Kerchen
#### Updated on: 2023-04-25
#################################

#### Load Libraries ####

library(tidyverse)
library(here)
library(readr)
library(patchwork)

#### Load Data ####

urlfile <- "https://raw.githubusercontent.com/rfordatascience/tidytuesday/master/data/2021/2021-03-16/games.csv"

Game_Data <- read.csv(url(urlfile)) # Reads in the data from the Tidy Tuesday Repo

view(Game_Data) # Allows me to view the whole data set

#### Filtering Out Top 5 Games ####

Game_Data_Top5 <- Game_Data%>%
  filter(gamename %in% c("Counter-Strike: Global Offensive", "Dota 2", "PLAYERUNKNOWN'S BATTLEGROUNDS", "Team Fortress 2", "Rust"))
# I did not use Apex Legends since it is a fairly new game with not much data.

#### Plotting ####

Plot1 <- Game_Data_Top5%>% 
  mutate(avg = avg/100000) %>% # I mutated the column to divide the avg values by a hundred thousand
  ggplot(aes(x=year, 
             y=avg,
             fill = gamename,
             color = gamename)) +
  geom_line()+  # Makes a line plot
  geom_area(alpha = 0.5)+  # Turns the line plot inot an area plot and makes the fill area see-through
  theme_bw()+
  scale_fill_viridis_d()+  # Color blind friendly color pallete
  scale_color_viridis_d()+ # Color blind friendly color palette
  facet_wrap(~gamename)+  # Facet wraps the plot by game name
  theme(legend.position = "none")+ # Removes the legend since the legend from the second plot uses the same colors
  labs(x = "Year",
       y = "Average Number of Players (by Hundred Thousand)")+  # Adds pretty names to the a x and y axis on the plot
  theme(axis.title = element_text(size = 12,
                                  color = "black"))
  
Plot2 <- Game_Data_Top5 %>%
  mutate(peak = peak/1000000) %>%  # I mutated the column to divide the peak values by one million
  ggplot(aes(x = year,
             y = peak,
             fill = gamename))+ 
  geom_col()+  # Makes a column plot
  theme_bw()+
  scale_fill_viridis_d()+ # Color friendly color palette
  facet_wrap(~gamename)+  # Facet wraps the plot by game name 
  theme(legend.position = "bottom",  # Places the legend on the bottom to save space on the image
        legend.title = element_text(size = 12,     # Changes the size and color of the axis and legend titles
                                    color = "black"),
        axis.title = element_text(size = 12,
                                  color = "black"))+
  labs(x = "Year",                                    # Adds pretty names to the axis labels and the legend
       y = "Peak Number of Players (by Million)",
       fill = "Game Name")

#### Patchwork the Plots Together ####

Game_Plots <- Plot1/Plot2   # Puts the two plots together with Plot 1 being above Plot 2. Gave the new plot a new name

Game_Plots+
  plot_annotation(title = "Statistics for Top 5 Steam Games",               # Adds title, subtitle, and caption to new combined plots
                  subtitle = "Comparison of Average and Peak Numbers of Players",
                  caption = "Data obtained from the Tidy Tuesday repository")+
  plot_annotation(tag_levels = 'A') & # Adds 'A' and 'B' labels to the two different plots
  theme(text = element_text('sans')) & # Changes the font of the plot labels and patchwork additions
  theme(plot.title = element_text(size = 16,   # Changes the font size, color, and face of the text on the plot title and subtitle added by patchwork
                                color = "black",
                                face = 'bold'),
        plot.subtitle = element_text(size = 14,
                                   color = "black",
                                   face = 'italic'))
#### Saving the Plots ####

ggsave(here("Week_08", "Output", "Game_Stat_Plot.png"),    # Saves the plot and sets the height and width of the image
       width = 12, height = 10)
