include ../../../Makefile.inc

all:
	@echo "BUILDPATH = $(BUILDPATH)"
	@echo "make |install|clean|uninstall

install:
	mkdir -p $(BUILDROOT)/cfg/generic
	cp threads.cfg $(BUILDROOT)/cfg/generic
	touch install

clean:
	rm -rf install

uninstall: clean
	rm -f $(BUILDROOT)/cfg/generic/threads.cfg
