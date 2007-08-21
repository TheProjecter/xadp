include ../../../Makefile.inc

install:
	mkdir -p $(PREFIX)/cfg/generic
	cp *.cfg $(PREFIX)/cfg/generic
	touch install

clean:
	rm -rf install

uninstall: clean
	rm -f $(PREFIX)/cfg/generic/*.cfg
