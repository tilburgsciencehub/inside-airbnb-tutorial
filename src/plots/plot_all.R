# Load needed libraries
library(readr)
library(dplyr)
library(ggplot2)

# Import the data from gen/data-preparation/aggregated_df.csv
file_path <- "../../gen/data-preparation/aggregated_df.csv"
aggregated_data <- read_csv(file_path)

# Convert the date (month) column into date format
aggregated_data$month <- as.Date(aggregated_data$month)

# Group by month and calculate the sum of all reviews across neighbourhoods
grouped_data <- aggregated_data %>%
  group_by(month) %>%
  summarise(total_reviews = sum(num_reviews))

# A time-series plot that shows the total number of reviews over time (across all neighbourhoods)
plot <- ggplot(grouped_data, aes(x = month, y = total_reviews)) +
  geom_line() +
  labs(y = "Total Number of Reviews", title = "Effect of COVID-19 pandemic on Airbnb review count") +
  theme_minimal()

# Store the plot as plot_all.pdf in gen/plots
file_path <- "../../gen/plots/plot_all.pdf"
ggsave(plot, file = file_path)