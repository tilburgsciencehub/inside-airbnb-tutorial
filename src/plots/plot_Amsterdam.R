# Load needed libraries
library(readr)
library(dplyr)
library(ggplot2)

# Import the data from gen/data-preparation/pivot_table.csv
file_path <- "../../gen/data-preparation/pivot_table.csv"
pivot_data <- read_csv(file_path)

# Convert the date (month) column into date format
pivot_data$month <- as.Date(pivot_data$month)

# Calculate the sum of reviews for each neighbourhood
neighbourhood_totals <- colSums(pivot_data[, -1], na.rm = TRUE)

# Create a data frame with the neighbourhood totals
totals_df <- data.frame(neighbourhood = names(neighbourhood_totals), total_reviews = neighbourhood_totals)

# Get the top 3 neighbourhoods
top_3_neighbourhoods <- totals_df %>%
  arrange(desc(total_reviews)) %>%
  top_n(3) %>%
  pull(neighbourhood)

print(top_3_neighbourhoods)

# Filter the data for the top 3 neighbourhoods
filtered_data <- pivot_data %>% 
  select(month, all_of(top_3_neighbourhoods))

# A time-series plot that shows the total number of reviews over time for the top 3 neighbourhoods
plot <- ggplot() +
  geom_line(data = filtered_data, aes(x = month, y = !!sym(top_3_neighbourhoods[[1]]), color = "blue")) +
  geom_line(data = filtered_data, aes(x = month, y = !!sym(top_3_neighbourhoods[[2]]), color = "red")) +
  geom_line(data = filtered_data, aes(x = month, y = !!sym(top_3_neighbourhoods[[3]]), color = "green")) +
  labs(title = "Total Number of Reviews over Time for Top 3 neighbourhoods",
       x = '', y = "Total Number of Reviews") +
  scale_color_manual(values = c("blue", "red", "green"),
                     labels = c(top_3_neighbourhoods[[1]], top_3_neighbourhoods[[2]], top_3_neighbourhoods[[3]]),
                     name = "Neighbourhoods") +
  theme_minimal()

# Store the plot as plot_Amsterdam.pdf in gen/plots
file_path <- "../../gen/plots/plot_Amsterdam.pdf"
ggsave(plot, file = file_path, width = 10, height = 7, units = "in")