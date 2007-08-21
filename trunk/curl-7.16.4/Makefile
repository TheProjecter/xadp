include ../Makefile.inc

TARGZFILE = curl-7.16.4.tar.gz
PACKAGE = curl-7.16.4
BUILDPATH = $(PLATFORMROOT)/$(PACKAGE)

untar:
	tar -xvzf $(TARGZFILE)
	rm -f configure build install
	touch untar

configure: untar
	-(cd $(PACKAGE) ; make distclean)
	(cd $(PACKAGE) ; ./configure --enable-threads --enable-shared --enable-symbols --prefix=$(BUILDPATH))
	rm -f build install
	touch configure

build:  configure
	(cd $(PACKAGE) ; make)
	rm -f install
	touch build

install: build
	(cd $(PACKAGE) ; make install)
	(cd $(PLATFORMROOT) ; ln -s $(PACKAGE) curl)
	touch install

clean:
	-(cd $(PACKAGE) ; make clean)
	rm -f configure build install

uninstall:
	rm -f $(PLATFORMROOT)/curl
	rm -rf $(BUILDPATH)
	rm -rf $(PACKAGE)
	rm -f untar configure build install
