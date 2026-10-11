# carsonocker2_my_evr_repository
Graphs Comparing Combined Groundfish Catch by Gear Type in the Bering Sea and Gulf of Alaska in 2025

By Carson Ocker

Citations: Fisheries, N. (2026, August 28). Fisheries catch and landings reports in Alaska. https://www.fisheries.noaa.gov/alaska/commercial-fishing/fisheries-catch-and-landings-reports-alaska 

My repository contains data and code used to create graphs that show the recorded catch of multiple species groundfish in lbs in the Bering Sea and Gulf of Alaska in 2025. The data is then loaded into two R scripts to process the data and to explore how the groundfish species catch varied with each gear type and within the two survey areas

How the graphs were made:

1) Searching Catch Data and Preparing Repository: I searched for catch data for Alaskan groundfish on Google and was shown the NOAA website. In the NOAA website, I clicked the Commercial Fishing Tab, then clicked on the Alaska region, then clicked on Groundfish, then under the Fisheries Resources section clicked on Catch and Landing to get to the page that had multiple datasets for reported groundfish catch in Alaska going back to 2013. Under the section titled "BSAI/GOI Groundfish Combined", I clicked on the Groundfish by Gear data for 2025, which downloaded  car220_gear2025.csv Microsoft Excel file to my laptop. Then in my repository, I created a file labeled "data", then within that file I labeled two files: one labeled "raw" and the other "processed". In my repository I also created a file labeled "results/img" and a file labeled "scripts". In my scripts file I made two files: one labeled "01_processing" and the other "03_content." I then moved the car_220_gear2025.csv excel file to the raw file within the data file of my repository.

2) Processing Data: On my laptop I clicked on my File Explorer application, clicked on Documents, then clicked on the file labeled  "carsonocker2_my_evr_repostory", then clicked on carsonocker2_my_repository.Rproj to open up R studio. In R studio I made I clicked on New File, selected R Script, named the R script as "data_processing", then saved the script to the 01_processing file in the scripts file in my repository. In this script I loaded the tidyverse and janitor libraries so I could read the groundfish data within the car220_gear.csv excel file. In the R script I read the groundfish data using read_csv, while also adding pipes for clean_data() and mutate(catch_in_lb = metric_tons*2204.62) so I could make easier to read names for each of the variable in the groundfish data and convert the catch weight in metric tons to ibs. In the R script this dataset was named "groundfish_data", and the the data was saved as an rds file using write_rds to save the dataset as "groundfish_data_processed.rds" in the processed file inside my data file in my repository.

5) Combining Data and Generating graphs

