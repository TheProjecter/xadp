include ../../Makefile.inc

install:
	mkdir -p $(PREFIX)/cfg
	cp common.cfg $(PREFIX)/cfg
	touch install

clean:
	rm -rf install

uninstall: clean
	rm -f $(PREFIX)/cfg/common.cfg
