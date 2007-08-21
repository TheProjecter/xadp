include ../Makefile.inc

TARGZFILE = tcllib-1.9.tar.gz
PACKAGE = tcllib-1.9
BUILDPATH = $(PLATFORMROOT)/$(PACKAGE)

untar:
	tar -xvzf $(TARGZFILE)
	rm -f configure build install
	touch untar

configure: untar
	-(cd $(PACKAGE) ; make distclean)
	(cd $(PACKAGE) ; ./configure --prefix=$(BUILDPATH) --exec-prefix=$(BUILDPATH))
	rm -f build install
	touch configure

build:  configure
	rm -f install
	touch build

install: build
	(cd $(PACKAGE) ; make install)
	(cd $(PLATFORMROOT) ; ln -s $(PACKAGE) tcllib)
	touch install

clean:
	-(cd $(PACKAGE) ; make clean)
	rm -f configure build install

uninstall:
	rm -f $(PLATFORMROOT)/tcllib
	rm -rf $(PLATFORMROOT)/$(PACKAGE)
	rm -rf $(PACKAGE)
	rm -f untar configure build install
