SRC_DIR := src
PDF_DIR := pdf
ASSETS_DIR := assets
DEPS    := $(SRC_DIR)/resume.cls

# 列出所有简历，每行一个，用空格分隔
RESUMES := \
	resume-kimi \
	resume-deepseek

PDFS    := $(foreach r,$(RESUMES),$(PDF_DIR)/$(r).pdf)

all: $(PDFS)

LATEXMK := /Library/TeX/texbin/latexmk

$(PDF_DIR)/%.pdf: $(SRC_DIR)/%.tex $(DEPS)
	@mkdir -p $(PDF_DIR)
	cd $(SRC_DIR) && $(LATEXMK) -xelatex -output-directory=../$(PDF_DIR) $*.tex

clean:
	rm -rf $(PDF_DIR)

.PHONY: all clean
