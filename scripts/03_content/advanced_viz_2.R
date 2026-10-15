################################################################################
# Advanced Viz 2
################################################################################
#
# Carson Ocker
# cco67@miami.edu
# 09/10/2026
#
# Description
#
################################################################################

#load packages
library(EVR628tools)
library(tidyverse)

#load data
data("data_lionfish")

#Compare the position adjustments in a bar graph

#First, default by stack
ggplot(data = data_lionfish,
      mapping = aes(x = size_class, fill = site)) + 
  geom_bar()

# Option 2: Identity
ggplot(data = data_lionfish,
      mapping = aes(x = size_class, fill = site)) + 
  geom_bar(position = "identity",
           alpha = 0.2, color = "black")

# Option 3: Dodge
ggplot(data = data_lionfish,
      mapping = aes(x = size_class, fill = site)) + 
  geom_bar(position = "dodge",
          color = "black")

# Option 4: Fill
ggplot(data = data_lionfish,
      mapping = aes(x = size_class, fill = site)) + 
  geom_bar(position = "fill") +
  scale_y_continuous(labels = scales::percent)

#Jitter some points
ggplot(data = data_lionfish,
      mapping = aes(  y = total_length_mm,
                    color = site)) + 
  geom_bar(position = position_jitter(width = 0.2),
           alpha = 0.5) +
 coord_flip() +
  theme(grid)


#Adding math and special characters to labels
co2data <- read_csv("https://gml.noaa.gov/webdata/ccgg/trends/co2/co2_daily_mlo.csv",
  skip = 32,
col_names = c("year", "month", "day", "decimal", "co2_ppm"))

co2data

ggplot(co2data,
       aes(x = decimal, y = co2_ppm)) + 
  geom_line() +
  theme_minimal(base_size = 10) +
  labs(x = "Date",
       y = quote(CO[2]~(concentration)~(bold(ppm))~beta),
       caption = "Source: Global Monitoring Laboratory, 2026")


#Summarizing data on the fly

#First the tidyverse way

mean_data <- data_heatwaves |>
  group_by(fishery, year) |>
  summarize(mean_temp = median(temp_mean),
            sd_temp = sd(temp_mean),
            .groups = "drop")
  
view(mean_data)

  
  

ggplot(data_heatwaves,
       aes(x = year,
           y = temp_mean)) +
  stat_summary(geom = "point", fun = "mean") +
  stat_summary(geom = "linerange", fun.data = "mean_se") +
  stat_summary(geom = "line", fun = "mean") +
  scale_x_continuous(breaks = seq(1985, 2020, by = 10)) +
  facet_wrap(~str_to_sentence(str_replace(fishery, "_", " ")),
             ncol = 2,
             scales = "free_y") +
  labs(x = "Year",
       y = "Mean Temperature (°C)")


#Second the tidyverse way

ggplot(data = data_heatwaves,
       mapping = aes(x = year, y = temp_mean)) +
  stat_summary(geom = "point", fun = "median") + 
  stat_summary(geom = "line", fun = "median") +
  #stat_summary(geom = "linerange)
  facet_wrap(~fishery, ncol = 2)
_