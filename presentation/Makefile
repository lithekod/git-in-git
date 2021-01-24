SRC = main.tex handout.tex
PDF = $(SRC:.tex=.pdf)

.PHONY: all clean

all: $(PDF)

%.pdf: %.tex
	latexmk -pdf -pdflatex="pdflatex -interaction=nonstopmode" -use-make -quiet $<

clean:
	latexmk -CA
