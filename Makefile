PDF_FILES = competition/competition.pdf in-schools.pdf \
              competition/setup.pdf competition/teardown.pdf \
	      kickstart/kickstart-london.pdf kickstart/kickstart-soton.pdf \
	      techdays/tech-day-soton.pdf

.SUFFIXES: .pdf .tex

# How to convert a .tex into a .pdf
.tex.pdf:
	pdflatex -output-directory $(dir $<) $<

all: $(PDF_FILES)

competition: competition/competition.pdf competition/setup.pdf competition/teardown.pdf

competition/competition.pdf: assessment-guidance.tex covid.tex
competition/setup.pdf: assessment-guidance.tex covid.tex
competition/teardown.pdf: assessment-guidance.tex covid.tex

techdays/tech-day-soton.pdf: assessment-guidance.tex

in-schools.pdf: in-schools.tex

.PHONY: clean

tidy:
	-rm -f `cat .gitignore | grep -v pdf`

clean: tidy
	-rm -f $(PDF_FILES)
