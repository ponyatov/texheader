MODULE ?= $(notdir $(CURDIR))

TEX = $(MODULE).tex ../texheader/ebook.tex

#TEX += ../texheader/cyr.tex
#TEX += ../texheader/colors.tex
#TEX += ../texheader/relsec.tex
#TEX += ../texheader/comp.tex 
##TEX += ../../texheader/bI.sty
#TEX += ../texheader/misc.tex
##TEX += intro.tex install.tex warning.tex compiler.tex 
##TEX += files.tex core.tex lexer.tex parser.tex
##TEX += headers.tex cppcore.tex ast.tex makes.tex comment.tex scalars.tex

#FIG = tmp/compiler.png tmp/meta.png

#SRC = src/hpp.hpp src/cpp.cpp

.PHONY: all
all: .gitignore $(MODULE).pdf
.gitignore: ../texheader/gitignore
	cp $< $@

LATEX = pdflatex -halt-on-error

$(MODULE).pdf: $(MODULE).tex $(TEX) $(FIG) $(LST)
	$(LATEX) $< && $(LATEX) $<

tmp/%.png: fig/%.dot
	dot -Tpng -o $@ $<

tmp/%$(EXE): lst/%.lpp
	flex -o $@.c $< && $(CXX) -o $@ $@.c
