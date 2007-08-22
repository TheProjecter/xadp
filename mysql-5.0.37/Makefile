include ../Makefile.inc

TARGZFILE = mysql-5.0.37.tar.gz
PACKAGE = mysql-5.0.37
BUILDPATH = $(PLATFORMROOT)/$(PACKAGE)

untar:
	tar -xvzf $(TARGZFILE)
	rm -f configure build install
	touch untar

configure: untar
	-(cd $(PACKAGE) ; make distclean)
	(cd $(PACKAGE) ; ./configure --enable-shared --enable-thread-safe-client --prefix=$(BUILDPATH) --exec-prefix=$(BUILDPATH) --with-charset=utf8)
	rm -f build install
	touch configure

build:  configure
	(cd $(PACKAGE) ; make)
	rm -f install
	touch build

install: build
	(cd $(PACKAGE) ; make install)
	(cd $(PLATFORMROOT) ; ln -s $(PACKAGE) mysql)
	touch install

clean:
	-(cd $(PACKAGE) ; make clean)
	rm -f configure build install

uninstall:
	rm -f $(PLATFORMROOT)/mysql
	rm -rf $(BUILDPATH)
	rm -rf $(PACKAGE)
	rm -f untar configure build install
