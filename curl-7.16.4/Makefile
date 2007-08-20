include ../Makefile.inc

TARGZFILE = curl-7.16.4.tar.gz
PACKAGE = curl-7.16.4
BUILDPATH = $(PLATFORMROOT)/$(PACKAGE)

unpack:
	tar -xvzf $(TARGZFILE)
	rm -f configure build install
	touch unpack

configure: unpack
	-(cd $(PACKAGE) ; make distclean)
	(cd $(PACKAGE) ; ./configure --enable-threads --enable-shared --enable-symbols --prefix=$(BUILDPATH))
	rm -f build install
	touch configure

build:  configure
	(cd $(PACKAGE) ; make)
	rm -f install
	touch build

install: unpack configure build
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
	rm -f unpack configure build install
