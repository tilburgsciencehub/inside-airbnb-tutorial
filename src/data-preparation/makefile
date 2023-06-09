DATA = ../../data
DPREP = ../../gen/data-preparation

all: $(DATA)/reviews.csv $(DATA)/listings.csv $(DPREP)/aggregated_df.csv $(DPREP)/pivot_table.csv

$(DATA)/reviews.csv: download.R
	R --vanilla < download.R

$(DATA)/listings.csv: download.R
	R --vanilla < download.R

$(DPREP)/aggregated_df.csv: clean.R
	R --vanilla < clean.R

$(DPREP)/pivot_table.csv: reshape.R
	R --vanilla < reshape.R