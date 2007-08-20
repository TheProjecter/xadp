include ../Makefile.inc

install:
	mkdir -p ${BUILDROOT}/lib/nsrpc-1.0.0
	echo "pkg_mkIndex -verbose . *.tcl" | ${PLATFORMROOT}/tcl/bin/tclsh
	cp *.tcl ${BUILDROOT}/lib/nsrpc-1.0.0
	touch install

clean:
	rm -f pkgIndex.tcl
	rm -f install

uninstall: clean
	rm -rf ${BUILDROOT}/lib/nsrpc-1.0.0
