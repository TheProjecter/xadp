include Makefile.inc

PLATFORMDIRS = tcl-8.4.15 aolserver-head curl-7.16.2 tclcurl-7.16.2 tdom-0.8.1 mysql-5.0.37 nsmysql-1.0.0

OTHERLIBS = nsrpc-1.0.0 tcllib-1.9

install: installfilesystem installplatform installotherlibs

clean: cleanplatform cleanotherlibs

uninstall: uninstallplatform uninstallotherlibs uninstallfilesystem

installplatform:
	@for DIR in $(PLATFORMDIRS); do (echo $$DIR ; cd $$DIR ; make install); done;

cleanplatform:
	@for DIR in $(PLATFORMDIRS); do (echo $$DIR ; cd $$DIR ; make clean); done;

cleanotherlibs:
	@for DIR in $(OTHERLIBS); do (echo $$DIR ; cd $$DIR ; make clean); done;

uninstallplatform:
	@for DIR in $(PLATFORMDIRS); do (echo $$DIR ; cd $$DIR ; make uninstall); done;
	rm -rf $(BUILDROOT)

installfilesystem:
	-mkdir -p $(BUILDROOT)/bin $(BUILDROOT)/cfg/generic $(BUILDROOT)/lib $(BUILDROOT)/logs $(BUILDROOT)/pages $(BUILDROOT)/servers
	cp other/bin/startserver $(BUILDROOT)/bin
	cp other/bin/stopserver $(BUILDROOT)/bin
	cp other/cfg/common.cfg $(BUILDROOT)/cfg
	cp other/cfg/README $(BUILDROOT)/cfg
	cp other/cfg/generic/threads.cfg $(BUILDROOT)/cfg/generic

uninstallfilesystem:
	rm -rf $(BUILDROOT)/bin $(BUILDROOT)/cfg $(BUILDROOT)/lib $(BUILDROOT)/logs $(BUILDROOT)/pages $(BUILDROOT)/servers

installotherlibs:
	@for DIR in $(OTHERLIBS); do (echo $$DIR ; cd $$DIR ; make install); done;

uninstallotherlibs:
	@for DIR in $(OTHERLIBS); do (echo $$DIR ; cd $$DIR ; make uninstall); done;
