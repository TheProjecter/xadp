include ../../Makefile.inc

all:
	@echo "BUILDPATH = $(BUILDPATH)"
	@echo "make |install|uninstall

install:
	mkdir -p $(BUILDROOT)/bin
	cp startserver $(BUILDROOT)/bin
	cp stopserver $(BUILDROOT)/bin
	touch install

clean:
	rm -rf install

uninstall: clean
	rm -f $(BUILDROOT)/bin/startserver
	rm -f $(BUILDROOT)/bin/stopserver
