all: pdf
pdf: tex/dissertation.tex
	xelatex tex/dissertation.tex
	xelatex tex/dissertation.tex
	bibtex dissertation.aux
	bibtex dissertation.aux
	xelatex tex/dissertation.tex
	xelatex tex/dissertation.tex
clean:
	mv dissertation.pdf /tmp/
	rm -f dissertation* */*.aux *.log
	mv /tmp/dissertation.pdf .
