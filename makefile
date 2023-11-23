help:
	@make -npq | awk -v RS= -F: '$$1 ~ /^[^#%.]+$$/ { print $$1 }' | sort

build: projet-outils.html projet-outils.pdf

MAKEFLAGS += --no-print-directory
CONVERT := $(MAKE) -f etc/makefile-pandoc

%.html: %.md
	@$(CONVERT) THEME=bbb FILE=$@ html

%.pdf: %.md
	@$(CONVERT) THEME=ulille FILE=$@ beamer

.PHONY: clean reset
clean:
	@$(CONVERT) clean
	-rm -rf $(shell find . -name "*~" -o -name "_minted*")

reset: clean
	@$(CONVERT) reset
	-rm projet-outils.pdf projet-outils.html

sinclude makefile.$(shell uname -n)
sinclude makefile.$(shell id -un)

