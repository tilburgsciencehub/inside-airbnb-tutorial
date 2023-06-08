# Load needed libraries
library(dplyr)
library(lubridate)
library(readr)

# Import raw data
raw_listings <- read.csv("../../data/listings.csv")
raw_reviews <- read.csv("../../data/reviews.csv")

# Convert the date column of reviews into date format
raw_reviews$date <- as.Date(raw_reviews$date)

# Filter for reviews published since January 1st 2015
filtered_reviews <- raw_reviews %>%
  filter(date >= as.Date("2015-01-01"))

# Filter for listings that have received at least 1 review
filtered_listings <- raw_listings %>%
  filter(number_of_reviews >= 1)

# Merge the reviews and listings dataframes on a common column
merged_data <- merge(filtered_reviews, filtered_listings, by.x = "listing_id", by.y = "id")

# Group the number of reviews by date and neighbourhood (aggregated on a monthly level)
aggregated_data <- merged_data %>%
  mutate(month = floor_date(date, unit = "month")) %>%
  group_by(month, neighbourhood) %>%
  summarise(num_reviews = n())

# Store the final data frames in gen/data-preparation as aggregated_df.csv
file_path <- "../../gen/data-preparation/aggregated_df.csv"
write_csv(aggregated_data, file = file_path)