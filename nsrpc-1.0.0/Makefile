include ../Makefile.inc

install:
	mkdir -p ${PREFIX}/lib/nsrpc-1.0.0
	echo "pkg_mkIndex -verbose . *.tcl" | ${PLATFORMROOT}/tcl/bin/tclsh
	cp *.tcl ${PREFIX}/lib/nsrpc-1.0.0
	touch install

clean:
	rm -f pkgIndex.tcl
	rm -f install

uninstall: clean
	rm -rf ${PREFIX}/lib/nsrpc-1.0.0
