Notes=$(wildcard *.tex)
Pdfs=$(Notes:.tex=.pdf)

.PHONY: all clean

all: $(Pdfs) index.html

%.pdf: %.tex
	latexmk -gg -pdf $<

clean:
	git clean -fX
	rm -rf *.pdf index.html

index.html: $(Pdfs)
	echo "<html><head><title>Scribe notes for Seq2Class EN.601.765</title></head><body><h1>Scribe notes</h1><ol>" > index.html
	for i in *.pdf ; do echo "<li><a href=\"$$i\">$$i</a></li>" >> index.html; done
	echo "</ol></body></html>" >> index.html
