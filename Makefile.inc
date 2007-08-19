SYSNAME := $(shell uname -s)
MACHINE := $(shell uname -m)
PLATFORM = $(SYSNAME)_$(MACHINE)

BUILDROOT = /usr/local/xadp
PLATFORMROOT = $(BUILDROOT)/platform/$(PLATFORM)
