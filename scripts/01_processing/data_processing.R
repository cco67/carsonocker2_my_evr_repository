################################################################################
# Data_Processing
################################################################################
#
# Carson Ocker
# cco67@miami.edu
# 09/10/2026
#
# Writing code for the libraries used to build the graphs and writing the location
#of the processed data in the repository
#
################################################################################
#Loading the packages I need to read the excel file with my R code
library(tidyverse)
library(janitor)

#Reading the excel file with the NOAA groundfish Catch Data for 2025 into a csv file,
#then storing the csv file in the raw file inside the data file of the repository
groundfish_data <- read_csv( file = "data/raw/car220_gear2025.csv", skip = 25) |>
  clean_names() |>
  mutate(catch_in_lb = metric_tons*2204.62)#I put skip = 25 because the groundish data starts at line 26 in the
#original excel file. My data is already clean, so I added a column 
#where I convert the catch in metric tons into Ibs.

#Saving an rds file of the groundfish data in the processed file inside my data file in my repository
write_rds(groundfish_data, file = "data/processed/groundfish_processed_data.rds")

