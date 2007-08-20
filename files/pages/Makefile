include ../../Makefile.inc

install:
	mkdir -p $(PREFIX)/pages
	@(cd ./generic ; make install)
	touch install

clean:
	@(cd ./generic ; make clean)
	rm -f install

uninstall: clean
