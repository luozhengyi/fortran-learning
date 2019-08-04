CC := gcc
FC := gfortran

CFLAGS := -Wall -fPIC -shared
FFLAGS := -Wall -fPIC -shared

DST_DIR := ../bin

ALL: $(DST_DIR)/libclib.so $(DST_DIR)/libflib.so
.PHONY: ALL

$(DST_DIR)/libclib.so: clib.c clib.h
	$(CC) $(CFLAGS) $^ -o $@

#$(DST_DIR)/libflib.so: flib.f95
#	$(FC) $(FFLAGS) $^ -o $@

$(DST_DIR)/libflib.so: flib.o
	$(CC) $(CFLAGS) $^ -o $@

flib.o: flib.f95
	$(FC) -c $^ 