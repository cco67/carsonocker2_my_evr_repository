################################################################################
# Exploratory_Data_Visualization
################################################################################
#
# Carson Ocker
# cco67@miami.edu
# 09/10/2026
#
# Writing code for the ground fish data to generate graphs to compare different variables
# within the dataset
#
################################################################################
#Loading the packages I need to generate graphs with my R code
library(tidyverse)

#Writing a name for my processed groundfish data so that the data can
#be filtered in different graphs
grnd_data_pr <- read_rds("data/processed/groundfish_processed_data.rds")

grnd_data_pr

#Bar plots comparing the catch
#in metric tons of each species by each gear type to determine which gear types
#are the best at catching specific species
grnd_data_gear <-ggplot(grnd_data_pr, aes(x = species, y = metric_tons, fill = gear)) +
  geom_col() +
  facet_wrap(~gear, 
             scales = "free") +
  coord_flip()+
  labs(x = "species", y = "catch in lbs", fill = "gear type",
       title = "Groundfish Catch of Each Gear Type",
       caption = "Data provided by National Marine Fisheries Service 2025") 
  

grnd_data_gear

#Bar plot comparing the total catch of each species to determine which
#species had the highest overall catch
grnd_data_tcatch <- ggplot(grnd_data_pr, aes(x = species, y = metric_tons, fill = gear)) +
  geom_col() +
  labs(x = "species", y = "catch in lbs", fill = "gear type",
  title = "Total Catch of Each Groundfish Species",
  caption = "Data provided by National Marine Fisheires Service 2025")
  

grnd_data_tcatch


#Bar plot comparing the total catch of each species in each survey area
#(Gulf of Alaska and the Bering Sea) to determine which species were more
#abundant in which area

grnd_data_compare_areas <- ggplot(grnd_data_pr, aes (x= species, y =metric_tons, fill = gear)) +
  geom_col() +
  facet_wrap(~fmp_area,
             scales = "free") +
  labs(x = "species", y = "catch in lbs", fill = "gear type",
  title = "Comparing Groundfish Catch Between the Gulf of Alaska and Bering Sea",
  caption = "Data provided by National Marine Fisheires Service 2025")
  

grnd_data_compare_areas

#Saving a png file for each of the bar graphs in the img file inside the 
#results file inside my repository
ggsave(plot = grnd_data_gear, 
       filename = "results/img/groundfish_data_gear.png")

ggsave(plot = grnd_data_tcatch,
       filename = "results/img/groundfish_data_totalcatch.png")

ggsave(plot = grnd_data_compare_areas,
       filename = "results/img/groundfish_data_area.png")
