#
# Simple Makefile to build PDF version.
# Uses `latexmk` (https://ctan.org/pkg/latexmk?lang=en)
#

# PDF viewer. Another alternatives are `xpdf` for Lunux
# On MacOS you can just use `open` to invoke default
# system viewer.
PDFVIEWER=evince

all: thesis.pdf

clean:
	latexmk -C
	rm -f thesis.bbl

thesis.pdf: thesis.tex cmu-ece-thesis.sty thesis.bib
	latexmk -g --pdf -latexoption=-shell-escape thesis.tex

run: thesis.pdf
	$(PDFVIEWER) thesis.pdf
