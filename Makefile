CC = gcc
PY = python3
CFLAGS = -Wall -fPIC
ASFLAGS = 
DEBUG_CFLAGS = -Wall -fPIC -g -O0
DEBUG_ASFLAGS = --64 -g

SRC_DIR = .
OUTPUT = to_int_plus_one.so

ASM_OBJ = to_int.o plus_one.o
C_OBJ = converter.o
ALL_OBJ = $(ASM_OBJ) $(C_OBJ)

.PHONY: all clean run rebuild debug

all: $(OUTPUT)

$(OUTPUT): $(ALL_OBJ)
	$(CC) -shared -o $@ $^

to_int.o: to_int.s
	as $(ASFLAGS) -o $@ $<

plus_one.o: plus_one.s
	as $(ASFLAGS) -o $@ $<

converter.o: converter.c
	$(CC) $(CFLAGS) -c -o $@ $<

run: $(OUTPUT)
	$(PY) main.py

clean:
	rm -f $(ALL_OBJ) $(OUTPUT)

rebuild: clean all

debug: clean
	$(MAKE) ASFLAGS="$(DEBUG_ASFLAGS)" CFLAGS="$(DEBUG_CFLAGS)" all
