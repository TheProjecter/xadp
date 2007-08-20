include ../Makefile.inc

TARGZFILE = aolserverHead.tar.gz
PACKAGE = aolserver-head
BUILDPATH = $(PLATFORMROOT)/$(PACKAGE)

download:
	@echo ""
	@echo "Downloading AOLserver"
	cvs -d:pserver:anonymous:@aolserver.cvs.sourceforge.net:/cvsroot/aolserver login
	@cvs -z3 -d:pserver:anonymous@aolserver.cvs.sourceforge.net:/cvsroot/aolserver co -P aolserver
	touch download

configure: download
	@-(cd aolserver ; make clean ; make distclean)
	@(cd aolserver ; $(PLATFORMROOT)/tcl/bin/tclsh nsconfig.tcl -debug -install $(BUILDPATH))
	rm -f build install
	touch configure

build:  configure
	(cd aolserver ; make)
	rm -f install
	touch build

install: build
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
	rm -f download configure build install

update: uninstall install
