all: data-preparation plots

data-preparation:
	make -C src/data-preparation

plots: data-preparation
	make -C src/plots