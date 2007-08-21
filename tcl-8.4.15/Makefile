include ../Makefile.inc

TARGZFILE = tcl-8.4.15.tar.gz
PACKAGE = tcl-8.4.15
BUILDPATH = $(PLATFORMROOT)/$(PACKAGE)

untar:
	tar -xvzf $(TARGZFILE)
	rm -f configure build install
	touch untar

configure: untar
	-(cd $(PACKAGE)/unix ; make distclean)
	(cd $(PACKAGE)/unix ; ./configure --prefix=$(BUILDPATH) --exec-prefix=$(BUILDPATH) --enable-threads --enable-shared --enable-symbols)
	rm -f build install
	touch configure

build:  configure
	(cd $(PACKAGE)/unix ; make)
	rm -f install
	touch build

install: build
	(cd $(PACKAGE)/unix ; make install)
	(cd $(PLATFORMROOT) ; ln -s $(PACKAGE) tcl)
	-(cd $(PLATFORMROOT)/tcl/bin ; rm tclsh ; ln -s tclsh8.4 tclsh)
	touch install

clean:
	-(cd $(PACKAGE)/unix ; make clean)
	rm -f configure build install

uninstall:
	rm -f $(PLATFORMROOT)/tcl
	rm -rf $(BUILDPATH)
	rm -rf $(PACKAGE)
	rm -f untar configure build install
