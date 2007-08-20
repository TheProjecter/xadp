include ../../Makefile.inc

all:
	@echo "BUILDPATH = $(BUILDPATH)"
	@echo "make |install|clean|uninstall

install:
	mkdir -p $(BUILDROOT)/cfg
	cp common.cfg $(BUILDROOT)/cfg
	touch install

clean:
	rm -rf install

uninstall: clean
	rm -f $(BUILDROOT)/cfg/common.cfg
