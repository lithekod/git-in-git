.PHONY: main.pdf all clean

all: main.pdf handout.pdf

main.pdf: main.tex
	latexmk -pdf -pdflatex="pdflatex -interaction=nonstopmode" -use-make $< 

handout.pdf: main.pdf
	cp $< $@

clean:
	latexmk -CA
