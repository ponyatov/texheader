
LATEX = pdflatex -halt-on-error

.PHONY: pdf
pdf: $(MODULE).pdf
$(MODULE).pdf: $(TEX) $(FIG) $(SRC)
	$(LATEX) $(MODULE) && makeindex $(MODULE) && $(LATEX) $(MODULE)

tmp/%.pdf: fig/%.dot
	dot -Tpdf -o $@ $<

tmp :
	mkdir $@
fig:
	mkdir $@	