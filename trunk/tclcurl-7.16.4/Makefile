include ../Makefile.inc

TARGZFILE = TclCurl-7.16.4.tar.gz
UNPACKDIR = TclCurl-7.16.4
PACKAGE = tclcurl-7.16.4
BUILDPATH = $(PLATFORMROOT)/$(PACKAGE)
CURLDIR = $(PLATFORMROOT)/curl

untar:
	tar -xvzf $(TARGZFILE)
	mv $(UNPACKDIR) $(PACKAGE)
	rm -f configure build install
	touch untar

configure: untar
	-(cd $(UNPACKDIR) ; make distclean)
	(cd $(UNPACKDIR) ; ./configure --prefix=$(BUILDPATH) --exec-prefix=$(BUILDPATH) --enable-threads --enable-shared --enable-symbols --with-curlprefix=$(CURLDIR))
	rm -f build install
	touch configure

build:  configure
	(cd $(UNPACKDIR) ; make)
	rm -f install
	touch build

install: build
	(cd $(UNPACKDIR) ; make install)
	(cd $(PLATFORMROOT) ; ln -s $(PACKAGE) tclcurl)
	touch install

clean:
	-(cd $(UNPACKDIR) ; make clean)
	rm -f configure build install

uninstall:
	rm -f $(PLATFORMROOT)/tclcurl
	rm -rf $(BUILDPATH)
	rm -rf $(PACKAGE)
	rm -f untar configure build install
