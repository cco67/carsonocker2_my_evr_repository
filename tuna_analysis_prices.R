library(readxl)
library(janitor)
library(tidyverse)

?read_excel
tuna_prices <-read_excel(path = "data/raw/Economic-and-Development-Indicators-and-Statistics-Tuna-Fishery-of-the-Western-and-Central-Pacific-Ocean-2024-32765/Compendium of Economic and Development Statistics 2024.xlsx",
                         sheet = 3, 
                         range = "A35:E63",
                         na = "na") |>
  clean_names()

#How many columns and rows do you ahev
colnames(tuna_prices)
nrow(tuna_prices)

#any missing values

tuna_prices |>
  filter_all(any_vars(is.na(.)))

class(tuna_prices$us_freshc)

#do we need to make the data wider or longer?

#longer (Year/market/presenttation/price)

?pivot_longer


#Tidy your price data

tidy_tuna_prices <- tuna_prices |>
  pivot_longer(cols = 2:5,
               names_to = c("market", "presentation"),
               names_sep = "_",
               values_to = "price",
               values_drop_na = T)

tidy_tuna_prices

#Calculate mean annual price

tidy_tuna_prices <- tuna_prices |>
  pivot_longer(cols = 2:5,
               names_to = c("market", "presentation"),
               names_sep = "_",
               values_to = "price",
               values_drop_na = T) |>
  group_by(year) |>
  summarize(price = mean(price),
            .groups = "drop")

tidy_tuna_prices

#Clean tuna catch data

tuna_data <- read_csv("data/raw/CatchByFlagGear/CatchByFlagGear1918-2024.csv") |>
  clean_names() |>
  rename(year = ano_year,
         flag = bandera_flag,
         gear = arte_gear,
         species = especies_species,
         catch = t)

ps_tuna_data <- tuna_data |> 
  filter(species == "BET", # Retain BET values only
         gear == "PS",     # Retain PS values only
         year >= 2000) |>  # Retain data from 2000
  group_by(year) |>        # Specify that I am grouping by year
  # Tell summarize that I want to collapse the catch column by summing all its values
  summarize(catch = sum(catch))

ps_tuna_data


#Perform the join
#I will combine the catch by year the right, with price by year from the left
#combining them based on year as hey

tuna_revenues <- ps_tuna_data |>
  left_join(tidy_tuna_prices,
            by = join_by(year == year)) |>
  mutate(revenues = catch * price)

write_rds(x = tuna_revenues,
          file = "data/processed/tuna_revenues.rds")


write_rds(x = tuna_revenues,
          file = "data/processed/tuna_revenues.csv")


