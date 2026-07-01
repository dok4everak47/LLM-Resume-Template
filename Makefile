LATEXMK := /Library/TeX/texbin/latexmk
ROOT := $(shell pwd)
# 公司文件夹
DIRS := kimi deepseek model dji

.PHONY: all clean cleanall $(DIRS)

all: $(DIRS)

# make kimi  → 编译 kimi/kimi-code.tex  (Coding Agent)
# make dji   → 编译 dji/dji-fullstack.tex (全栈后端)
# make deepseek → 编译 deepseek/deepseek.tex
# make model → 编译 model/model.tex
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
