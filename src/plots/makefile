DPREP = ../../gen/data-preparation/
PLOTS = ../../gen/plots/

all: $(PLOTS)/plot_all.pdf $(PLOTS)/plot_Amsterdam.pdf

$(PLOTS)/plot_all.pdf: $(DPREP)/aggregated_df.csv plot_all.R
	R --vanilla < plot_all.R

$(PLOTS)/plot_Amsterdam.pdf: $(DPREP)/pivot_table.csv plot_Amsterdam.R
	R --vanilla < plot_Amsterdam.R