PDF_FILES = competition.pdf in-schools.pdf kickstart-soton.pdf \
              tech-day-soton.pdf

.SUFFIXES: .pdf .tex

# How to convert a .tex into a .pdf
.tex.pdf:
	pdflatex $<

all: $(PDF_FILES)

competition.pdf: assessment-guidance.tex

tech-day-soton.pdf: assessment-guidance.tex

in-schools.pdf: in-schools.tex

.PHONY: clean

tidy:
	-rm -f `cat .gitignore | grep -v pdf`

clean: tidy
	-rm -f $(PDF_FILES)
