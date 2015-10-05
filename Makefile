#########################################
# Build the Visual LaTeX FAQ            #
# By Scott Pakin <scott+vfaq@pakin.org> #
#########################################

SOURCES = anotherarticle.pdf book-montage.png fuzzytext.png labelgraph.pdf \
          lorem-ipsum-logo.png musixtex.png visfaq-html.png visualFAQ.ind \
          visualFAQ.ind2 visualFAQ.out visualFAQ.tex watermark.pdf

all: visualFAQ.pdf

visualFAQ.pdf: $(SOURCES)
	pdflatex '\let\vlfpoweruser=1\input visualFAQ'
	pdflatex '\let\vlfpoweruser=1\input visualFAQ'

troubleshoot-vlf.pdf: troubleshoot-vlf.tex
	pdflatex troubleshoot-vlf.tex
	pdflatex troubleshoot-vlf.tex

dist: visualFAQ.tar.gz

visualFAQ.tar.gz: all README troubleshoot-vlf.pdf
	mkdir visualFAQ
	cp README visualFAQ.pdf troubleshoot-vlf.pdf visualFAQ/
	mkdir visualFAQ/source
	cp README-SRC visualFAQ/source/README
	cp $(SOURCES) visualFAQ/source/
	tar -czvf visualFAQ.tar.gz visualFAQ
	$(RM) -r visualFAQ

clean:
	$(RM) visualFAQ.pdf visualFAQ.aux visualFAQ.log
	$(RM) -r visualFAQ
	$(RM) troubleshoot-vlf.pdf
	$(RM) troubleshoot-vlf.out troubleshoot-vlf.aux troubleshoot-vlf.log
