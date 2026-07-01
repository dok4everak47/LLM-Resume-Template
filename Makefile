LATEXMK := /Library/TeX/texbin/latexmk
ROOT := $(shell pwd)
DIRS := kimi deepseek model

.PHONY: all clean cleanall $(DIRS)

all: $(DIRS)

$(DIRS):
	@echo "=== Compiling $@ ==="
	cd $(ROOT)/$@ && $(LATEXMK) -xelatex $@.tex

clean:
	@for d in $(DIRS); do \
		cd $(ROOT)/$$d && $(LATEXMK) -C $$d.tex 2>/dev/null || true; \
	done

cleanall:
	@for d in $(DIRS); do \
		cd $(ROOT)/$$d && $(LATEXMK) -C $$d.tex 2>/dev/null || true; \
		rm -f $(ROOT)/$$d/*.pdf $(ROOT)/$$d/*.xdv $(ROOT)/$$d/*.aux \
		      $(ROOT)/$$d/*.log $(ROOT)/$$d/*.fls $(ROOT)/$$d/*.fdb_latexmk \
		      $(ROOT)/$$d/*.out $(ROOT)/$$d/*.synctex.gz; \
	done
