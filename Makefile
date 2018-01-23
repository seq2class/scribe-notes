Notes=$(wildcard *.tex)
Pdfs=$(Notes:.tex=.pdf)

.PHONY: all clean

all: $(Pdfs) index.html

%.pdf: %.tex seq2class.sty
	latexmk -gg -pdf $<

clean:
	git clean -fX
	rm -rf *.pdf index.html

index.html: $(Pdfs)
	echo "<html><head><title>Scribe notes for Seq2Class EN.601.765</title></head><body><h1>Scribe notes</h1><ol>" > index.html
	for i in *.pdf ; do echo "<li><a href=\"$$i\">$$i</a></li>" >> index.html; done
	echo "</o><div style='text-align: center; vertical-align: middle; position: fixed; bottom: 50px; width: 100%;'><code>Git commit: `git describe --always --long --dirty --abbrev=12`, Build date: `TZ=America/New_York date`</code></div>" >> index.html
	echo "</body></html>" >> index.html
