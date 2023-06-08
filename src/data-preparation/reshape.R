# Load needed libraries
library(readr)
library(tidyverse)

# Import the data from gen/data-preparation/aggregated_df.csv
file_path <- "../../gen/data-preparation/aggregated_df.csv"
aggregated_data <- read_csv(file_path)

# Reshape the data into wide format
reshaped_data <- aggregated_data %>%
  pivot_wider(names_from = neighbourhood, values_from = num_reviews)

# Store the result as pivot_table.csv in gen/data-preparation
file_path <- "../../gen/data-preparation/pivot_table.csv"
write_csv(reshaped_data, file_path)