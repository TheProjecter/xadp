include ../../Makefile.inc

install:
	mkdir -p $(PREFIX)/bin
	cp startserver $(PREFIX)/bin
	cp stopserver $(PREFIX)/bin
	touch install

clean:
	rm -rf install

uninstall: clean
	rm -f $(PREFIX)/bin/startserver
	rm -f $(PREFIX)/bin/stopserver
