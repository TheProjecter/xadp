include Makefile.inc

BUNDLES = tcl-8.4.15 aolserver-head curl-7.16.4 tclcurl-7.16.4 tdom-0.8.1 tcllib-1.9 mysql-5.0.37 nsmysql-1.0.0

LIBS = nsrpc-1.0.0

install: installbundles installlibs installfiles
clean: cleanbundles cleanlibs cleanfiles
uninstall: uninstallfiles uninstalllibs uninstallbundles

installbundles:
	@for DIR in $(BUNDLES); do (cd $$DIR ; make install); done;
installlibs:
	@for DIR in $(LIBS); do (cd $$DIR ; make install); done;
installfiles:
	(cd files ; make install)

cleanbundles:
	@for DIR in $(BUNDLES); do (cd $$DIR ; make clean); done;
cleanlibs:
	@for DIR in $(LIBS); do (cd $$DIR ; make clean); done;
cleanfiles:
	(cd files ; make clean)

uninstallbundles:
	@for DIR in $(BUNDLES); do (cd $$DIR ; make uninstall); done;
uninstalllibs:
	@for DIR in $(LIBS); do (cd $$DIR ; make uninstall); done;
uninstallfiles:
	(cd files ; make uninstall)
