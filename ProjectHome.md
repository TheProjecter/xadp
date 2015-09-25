The X AOLserver Dynamic Platform (xADP) is a "batteries included" distribution for AOLserver. It includes, but is not limited to, [Tcl](http://www.tcl.tk/), [AOLserver](http://www.aolserver.com/), [MySQL](http://www.mysql.com/), [cURL](http://curl.haxx.se/), [TclCurl](http://personal1.iddeo.es/andresgarci/tclcurl/english/), [tDOM](http://www.tdom.org/), [Tcllib](http://tcllib.sourceforge.net/doc/), [nsrpc](http://xadp.googlecode.com/svn/trunk/nsrpc-1.0.0/README), and [nsdb](http://xadp.googlecode.com/svn/trunk/nsdb-1.0.0/nsdb.tcl).  Using a single Makefile to build and link these features together, xADP offers an out-of-the-box experience for AOLserver.  xADP provides simple mechanisms for starting and stopping servers, server communication via RPC, and a nsdb Tcl package that wraps the ns\_db API for ease of use.

To install xADP, first check out the src from svn:

> `svn checkout http://xadp.googlecode.com/svn/trunk/ xadp`

Then read the [README](http://xadp.googlecode.com/svn/trunk/README) file for installation instructions and documentation.

Note: xADP has only been tested on Darwin\_i366. Please let me know if you have issues on other platforms.