FC := gfortran

BIN_DIR := ./bin

ALL:  $(BIN_DIR)/structure.out 	$(BIN_DIR)/variable.out 	$(BIN_DIR)/type-intrinsic.out \
      $(BIN_DIR)/constant.out  	$(BIN_DIR)/type-derived.out	$(BIN_DIR)/exec-ctrl.out\
      $(BIN_DIR)/attribute.out	$(BIN_DIR)/array.out\
	 clean
.PHONY: ALL


OBJ1 := structure.o modules.o
OBJ2 := variable.o
OBJ3 := type-intrinsic.o
OBJ4 := constant.o
OBJ5 := type-derived.o
OBJ6 := exec-ctrl.o
OBJ7 := attribute.o
OBJ8 := array.o

OBJS := $(OBJ1) $(OBJ2) $(OBJ3) $(OBJ4) $(OBJ5)\
	    $(OBJ6) $(OBJ7) $(OBJ8)


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



# do clean
.PHONY: clean
clean:
	rm -rf $(OBJS) *.mod
