include ../Makefile.inc

TARGZFILE = nsmysql-1.0.0.tar.gz
PACKAGE = nsmysql-1.0.0
AOLSERVERPATH = $(PLATFORMROOT)/aolserver
MYSQLPATH = $(PLATFORMROOT)/mysql

untar:
	tar -xvzf $(TARGZFILE)
	rm -f configure build install
	touch untar

configure: untar
	rm -f build install
	touch configure

build:  configure
	(cd $(PACKAGE) ; make AOLSERVER=$(AOLSERVERPATH) MYSQL_PREFIX=$(MYSQLPATH) MYSQL_LIBDIR=$(MYSQLPATH)/lib/mysql MYSQL_INCDIR=$(MYSQLPATH)/include/mysql)
	rm -f install
	touch build

install: build
	(cd $(PACKAGE) ; make AOLSERVER=$(AOLSERVERPATH) install)
	touch install

clean:
	-(cd $(PACKAGE) ; make AOLSERVER=$(AOLSERVERPATH) clean)
	rm -f configure build install

uninstall:
	rm -f $(AOLSERVERPATH)/lib/*nsmysql*
	rm -f $(AOLSERVERPATH)/bin/*nsmysql*
	rm -rf $(PACKAGE)
	rm -f untar configure build install
