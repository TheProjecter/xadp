include ../Makefile.inc

TARGZFILE = aolserverHead.tar.gz
PACKAGE = aolserver-head
BUILDPATH = $(PLATFORMROOT)/$(PACKAGE)

all:
	@echo "BUILDPATH = $(BUILDPATH)"
	@echo "make |unpack|configure|build|install|clean|remove"

unpack:
	tar -xvzf $(TARGZFILE)
	rm -f configure build install
	touch unpack

configure: unpack
	@-(cd aolserver ; make clean ; make distclean)
	@(cd aolserver ; $(PLATFORMROOT)/tcl/bin/tclsh nsconfig.tcl -debug -install $(BUILDPATH))
	rm -f build install
	touch configure

build:  configure
	(cd aolserver ; make)
	rm -f install
	touch build

install: unpack configure build
	(cd aolserver ; make install)
	(cd $(PLATFORMROOT) ; ln -s $(PACKAGE) aolserver)
	touch install

clean:
	-(cd aolserver ; make clean)
	rm -f configure build install

uninstall:
	rm -f $(PLATFORMROOT)/aolserver
	rm -rf $(BUILDPATH)
	rm -rf aolserver
	rm -f unpack configure build install
