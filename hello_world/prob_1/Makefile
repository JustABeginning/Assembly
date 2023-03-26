# Compiler
CC=x86_64-linux-android31-clang
# NDK_PATH
NDK_PATH=$(NDK_HOME)
# O/P Object File(s)
OBJS=hello_world.o
# O/P Executable
OP=hello_world
# Build DIR
OP_DIR=build

build: $(OP)
	-if exist $(OP_DIR) (echo $(OP_DIR) ALREADY EXISTS !) else (mkdir $(OP_DIR))
	-move /y $(OBJS) $(OP_DIR)
	-move /y $(OP) $(OP_DIR)

clean:
	-if exist $(OP_DIR)\\$(OBJS) (del $(OP_DIR)\\$(OBJS)) else (echo $(OP_DIR)\\$(OBJS) DOES NOT EXIST !)
	-if exist $(OP_DIR)\\$(OP) (del $(OP_DIR)\\$(OP)) else (echo $(OP_DIR)\\$(OP) DOES NOT EXIST !)

hello_world: $(OBJS) Makefile
	-$(CC) -nostdlib -static -o $@ $<

hello_world.o: hello_world.S Makefile
	-$(CC) -c -o $@ $<
