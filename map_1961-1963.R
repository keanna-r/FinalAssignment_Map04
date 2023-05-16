#load the packages from my library

library(maps)
library(tidyverse)
library(viridis)
library(scales)
library(readxl)

#read the excel file and specific sheet with my data set
scores <- read_excel("C:/Users/keann/Documents/JewishStats01.xlsx", sheet="Sheet4")

#plot the world map by using the 'scores' label we named the data set and then using the colour gradient 'magma' to display the numerical data.

world_map <- map_data("world")
gg <- ggplot(scores) + geom_map(dat=world_map, map=world_map, aes(map_id=region), fill="white", color="black") + geom_map(map=world_map, aes(map_id=Country, fill=Population), color="black") + 
  expand_limits(x = world_map$long, y = world_map$lat) +  scale_fill_gradientn(colours=rev(magma(6)), name="Population", na.value = "grey100", values =  rescale(seq(0, 400, length.out = 3)))
gg