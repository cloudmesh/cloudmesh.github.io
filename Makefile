all: html

html: clean
	cd doc; make -f Makefile html
	make -f Makefile clean

clean:
	cd doc; make -f Makefile clean

