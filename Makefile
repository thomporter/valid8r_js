# Valid8r Makefile - just copies resources from _src_files to where they belong.

MAKEFLAGS = --no-print-directory --always-make
MAKE = make $(MAKEFLAGS)

all:
	$(MAKE) build;

build:
	cp ./_src_files/valid8r.js ./lib;
	cp ./_src_files/valid8r.js ./examples;

