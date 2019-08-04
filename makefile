FC := gfortran
CC := gcc

BIN_DIR := ./bin
SUBDIRS := ./lib


ALL:  subdirs \
	  $(BIN_DIR)/structure.out 	$(BIN_DIR)/variable.out 	$(BIN_DIR)/type-intrinsic.out \
      $(BIN_DIR)/constant.out  	$(BIN_DIR)/type-derived.out	$(BIN_DIR)/exec-ctrl.out \
      $(BIN_DIR)/attribute.out	$(BIN_DIR)/array.out		$(BIN_DIR)/enum.out \
	  $(BIN_DIR)/fortran-c.out  $(BIN_DIR)/procedure.out 	$(BIN_DIR)/c-fortran.out \
	  clean
#.PHONY: ALL


OBJ1  := structure.o modules.o
OBJ2  := variable.o
OBJ3  := type-intrinsic.o
OBJ4  := constant.o
OBJ5  := type-derived.o
OBJ6  := exec-ctrl.o
OBJ7  := attribute.o
OBJ8  := array.o
OBJ9  := enum.o
OBJ10 := fortran-c.o
OBJ11 := procedure.o
OBJ12 := c-fortran.o

OBJS := $(OBJ1)  $(OBJ2)  $(OBJ3)  $(OBJ4)  $(OBJ5)  \
	    $(OBJ6)  $(OBJ7)  $(OBJ8)  $(OBJ9)  $(OBJ10) \
		$(OBJ11) $(OBJ12) \

# generate c and fortran libs
subdirs:
	@for dir in $(SUBDIRS); do \
			$(MAKE) -C $$dir; \
		done


# generate structure.out
$(BIN_DIR)/structure.out: $(OBJ1)
	$(FC) -o $@ $^
structure.o: structure.f95 modules.o
	$(FC) -c $<
modules.o: modules.f95
	$(FC) -c $<


# generate variable.out
$(BIN_DIR)/variable.out: $(OBJ2)
	$(FC) -o $@ $^ 
variable.o: variable.f95
	$(FC) -c $<


# generate type-intrinsic.out
$(BIN_DIR)/type-intrinsic.out: $(OBJ3)
	$(FC) -o $@ $^ 
type-intrinsic.o: type-intrinsic.f95
	$(FC) -c $<


# generate constant.out
$(BIN_DIR)/constant.out: $(OBJ4)
	$(FC) -o $@ $^ 
constant.o: constant.f95
	$(FC) -c $<



# generate type-derived.out
$(BIN_DIR)/type-derived.out: $(OBJ5)
	$(FC) -o $@ $^ 
type-derived.o: type-derived.f95
	$(FC) -c $<


# generate exec-ctrl.out
$(BIN_DIR)/exec-ctrl.out: $(OBJ6)
	$(FC) -o $@ $^ 
exec-ctrl.o: exec-ctrl.f95
	$(FC) -c $<


# generate attribute.out
$(BIN_DIR)/attribute.out: $(OBJ7)
	$(FC) -o $@ $^ 
attribute.o: attribute.f95
	$(FC) -c $<



# generate array.out
$(BIN_DIR)/array.out: $(OBJ8)
	$(FC) -o $@ $^ 
array.o: array.f95
	$(FC) -c $<


# generate enum.out
$(BIN_DIR)/enum.out: $(OBJ9)
	$(FC) -o $@ $^ 
enum.o: enum.f95
	$(FC) -c $<

# generate fortran-c.out
$(BIN_DIR)/fortran-c.out: $(OBJ10)
	$(FC) -o $@ $^ -L./bin/ -lclib
fortran-c.o: fortran-c.f95
	$(FC) -c $<

# generate procedure.out
$(BIN_DIR)/procedure.out: $(OBJ11)
	$(FC) -o $@ $^ 
procedure.o: procedure.f95
	$(FC) -c $<

# generate c-fortran.out
$(BIN_DIR)/c-fortran.out: $(OBJ12)
	$(FC) -o $@ $^ -L./bin/ -lflib
c-fortran.o: c-fortran.c
	$(FC) -c $<

# do clean
.PHONY: clean
clean:
	@rm -rf $(OBJS) *.mod
	