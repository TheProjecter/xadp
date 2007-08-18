include ../Makefile.inc

install:
	mkdir -p ${BUILDROOT}/lib/nsrpc-1.0.0
	echo "pkg_mkIndex -verbose . *.tcl" | ${PLATFORMROOT}/tcl/bin/tclsh
	cp *.tcl ${BUILDROOT}/lib/nsrpc-1.0.0

clean:
	rm pkgIndex.tcl

uninstall: clean
	rm -rf ${BUILDROOT}/lib/nsrpc
