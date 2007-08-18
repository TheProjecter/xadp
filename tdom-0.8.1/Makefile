include ../Makefile.inc

TARGZFILE = tdom0.8.1.tar.gz
UNPACKDIR = tdom
PACKAGE = tdom-0.8.1
BUILDPATH = $(PLATFORMROOT)/$(PACKAGE)
TCLPATH = $(PLATFORMROOT)/tcl

all:
	@echo "BUILDPATH = $(BUILDPATH)"
	@echo "make |unpack|configure|build|install|clean|remove"

unpack:
	tar -xvzf $(TARGZFILE)
	mv $(UNPACKDIR) $(PACKAGE)
	rm -f configure build install
	touch unpack

configure: unpack
	-(cd $(PACKAGE)/unix ; make distclean)
	(cd $(PACKAGE)/unix ; ../configure --prefix=$(BUILDPATH) --exec-prefix=$(BUILDPATH) --enable-threads --enable-shared --enable-symbols --with-tcl=$(TCLPATH)/lib --disable-tdomalloc)
	rm -f build install
	touch configure

build:  configure
	(cd $(PACKAGE)/unix ; make)
	rm -f install
	touch build

install: unpack configure build
	(cd $(PACKAGE)/unix ; make install)
	(cd $(PLATFORMROOT) ; ln -s $(PACKAGE) tdom)
	touch install

clean:
	-(cd $(PACKAGE)/unix ; make clean)
	rm -f configure build install

uninstall:
	rm -f $(PLATFORMROOT)/tdom
	rm -rf $(BUILDPATH)
	rm -rf $(PACKAGE)
	rm -f unpack configure build install
