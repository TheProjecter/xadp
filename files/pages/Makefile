include ../../Makefile.inc

install:
	mkdir -p $(BUILDROOT)/pages
	@(cd ./generic ; make install)
	touch install

clean:
	rm -f install

uninstall: clean
