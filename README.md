# carsonocker2_my_evr_repository
Graphs Comparing Combined Groundfish Catch by Gear Type in the Bering Sea and Gulf of Alaska in 2025

By Carson Ocker

Citations: Fisheries, N. (2026, August 28). Fisheries catch and landings reports in Alaska. https://www.fisheries.noaa.gov/alaska/commercial-fishing/fisheries-catch-and-landings-reports-alaska 

My repository contains data and code used to create graphs that show the recorded catch of multiple species groundfish in lbs in the Bering Sea and Gulf of Alaska in 2025. The data is then loaded into two R scripts to process the data and to explore how the groundfish species catch varied with each gear type and within the two survey areas

How the graphs were made:

1) Searching Catch Data and Preparing Repository: I searched for catch data for Alaskan groundfish on Google and was shown the NOAA website. In the NOAA website, I clicked the Commercial Fishing Tab, then clicked on the Alaska region, then clicked on Groundfish, then under the Fisheries Resources section clicked on Catch and Landing to get to the page that had multiple datasets for reported groundfish catch in Alaska going back to 2013 (https://www.fisheries.noaa.gov/alaska/commercial-fishing/fisheries-catch-and-landings-reports-alaska). Under the section titled "BSAI/GOI Groundfish Combined", I clicked on the Groundfish by Gear data for 2025, which downloaded  car220_gear2025.csv Microsoft Excel file to my laptop. Then in my repository, I created a file labeled "data", then within that file I labeled two files: one labeled "raw" and the other "processed". In my repository I also created a file labeled "results/img" and a file labeled "scripts". In my scripts file I made two files: one labeled "01_processing" and the other "03_content." I then moved the car_220_gear2025.csv excel file to the raw file within the data file of my repository.

2) Processing Data: On my laptop I clicked on my File Explorer application, clicked on Documents, then clicked on the file labeled  "carsonocker2_my_evr_repostory", then clicked on carsonocker2_my_repository.Rproj to open up R studio. In R studio I made I clicked on New File, selected R Script, named the R script as "data_processing", then saved the R script to the 01_processing file in the scripts file in my repository. In this script I loaded the tidyverse and janitor libraries so I could read the groundfish data within the car220_gear.csv excel file. In the R script I read the groundfish data using the read_csv function, while also adding pipes for clean_data() and mutate(catch_in_lb = metric_tons*2204.62) so I could make easier to read names for each of the variables in the groundfish data and convert the catch weight in metric tons to ibs. In the data_processing R script this dataset was named "groundfish_data", and the the data was saved as an rds file using the write_rds function to save the dataset as "groundfish_data_processed.rds" in the processed file inside my data file in my repository.

5) Combining Data and Generating Graphs: In R studio, I created another R script, named it "exploratory_data_visualization", then saved the R script to the 03_content file in the processed file in the data file in my repository. In this script I loaded the tidyverse library so I could filter for specific variables within my groundfish data and generate graphs. I used read_rds to read groundfish_data_processed.rds, then labeled this dataset as "grnd_data_pr" within the R script. I then used the ggplot function on grnd_data_pr to generate 3 bar graphs:

grnd_data_gear: A set of bar plots that compares the catch weigth of each species caught with each of the 5 gear types: Hook-and-line gear, Pelagic trawl gear, Non-pelagic trawl gear, Pot gear, and Jig gear, showing which gear type is most efficient at catching specific species.

grnd_data_tcatch: A bar plot that compares the total catch weight for every species caught in both the Gulf of Alaska and the Bering Sea/Aleutian Islands to illustrate which species had the highest overall catch in lbs.

grnd_data_compare_areas: A set of 2 bar plots that compares the catch weight of each species caught specifically in the Gulf of Alaska with the catch weight of each species caught in the Bering Sea/Aleutian Islands to show which species were more abundant between the two survey areas.

Each of bar plots generated for grnd_data_gear, grnd_data_tcatch, and grnd_data_compare_areas were saved as separate png files using the ggsave function in the exploratory_data_visualization R script. The groundfish_data_gear.png, groundfish_data_totalcatch.png, and groundfish_data_areas.png files are located in the results/img file inside the repository.
