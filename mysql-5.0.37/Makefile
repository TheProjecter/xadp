include ../Makefile.inc

TARGZFILE = mysql-5.0.37.tar.gz
PACKAGE = mysql-5.0.37
BUILDPATH = $(PLATFORMROOT)/$(PACKAGE)

unpack:
	tar -xvzf $(TARGZFILE)
	rm -f configure build install
	touch unpack

configure: unpack
	-(cd $(PACKAGE) ; make distclean)
	(cd $(PACKAGE) ; ./configure --enable-shared --enable-thread-safe-client --prefix=$(BUILDPATH) --exec-prefix=$(BUILDPATH))
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
	rm -f unpack configure build install
