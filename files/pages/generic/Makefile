include ../../../Makefile.inc

install:
	mkdir -p $(PREFIX)/pages/generic
	cp index.adp $(PREFIX)/pages/generic
	touch install

clean:
	rm -f install

uninstall: clean
	rm -f $(PREFIX)/pages/generic/index.adp
