# Produce PDF, RTF, HTML and DOCX versions of the CV

TARGETS := $(patsubst %.md,%.pdf,$(wildcard *.md)) $(patsubst %.md,%.docx,$(wildcard *.md)) $(patsubst %.md,%.html,$(wildcard *.md)) 

all: $(TARGETS)

clean:
	rm -f $(TARGETS)

rebuild: clean all

%.pdf : %.md
	pandoc -f markdown -t latex $< -o $@

%.docx : %.md
	pandoc -f markdown -t docx $< -o $@

%.html : %.md
	pandoc -f markdown -t html5 $< -o $@
