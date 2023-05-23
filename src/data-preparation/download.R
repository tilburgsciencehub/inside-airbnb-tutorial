# Download listings
url_listings <- "http://data.insideairbnb.com/the-netherlands/north-holland/amsterdam/2023-03-09/visualisations/listings.csv"
download.file(url = url_listings, destfile = "../../data/listings.csv")

# Download reviews
url_reviews <- "http://data.insideairbnb.com/the-netherlands/north-holland/amsterdam/2023-03-09/visualisations/reviews.csv"
download.file(url = url_reviews, destfile = "../../data/reviews.csv")