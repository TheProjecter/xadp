PREFIX = /usr/local/xadp
SYSNAME = $(shell uname -s)
MACHINE = $(shell uname -m)
PLATFORM = $(SYSNAME)_$(MACHINE)
PLATFORMROOT = $(PREFIX)/platform/$(PLATFORM)
