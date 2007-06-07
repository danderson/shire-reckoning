# Makefile for the monogram, generated from a vector file.

all: monogram.png

monogram.png: monogram.svg
	inkscape -e monogram.png monogram.svg

clean:
	rm -f monogram.png

.PHONY: all clean
