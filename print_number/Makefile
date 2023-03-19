# Compiler
CC=x86_64-linux-android31-clang
# NDK_PATH
NDK_PATH=$(NDK_HOME)
# O/P Object File(s)
OBJS=print_number.o
# O/P Executable
OP=print_number
# Build DIR
OP_DIR=build

build: $(OP)
	-if exist $(OP_DIR) (echo $(OP_DIR) ALREADY EXISTS !) else (mkdir $(OP_DIR))
	-move /y $(OBJS) $(OP_DIR)
	-move /y $(OP) $(OP_DIR)

clean:
	-if exist $(OP_DIR)\\$(OBJS) (del $(OP_DIR)\\$(OBJS)) else (echo $(OP_DIR)\\$(OBJS) DOES NOT EXIST !)
	-if exist $(OP_DIR)\\$(OP) (del $(OP_DIR)\\$(OP)) else (echo $(OP_DIR)\\$(OP) DOES NOT EXIST !)

print_number: $(OBJS) Makefile
	-$(CC) -nostdlib -static -o $@ $<

print_number.o: print_number.S Makefile
	-$(CC) -c -o $@ $<
