# Compiler
CC=x86_64-linux-android31-clang
# NDK_PATH
NDK_PATH=$(NDK_HOME)
# O/P Object File(s)
OBJC=pro_c.o
OBJA=pro_asm.o
OBJS=$(OBJC) $(OBJA)
# O/P Executable
OP=libcasm
# Build DIR
OP_DIR=build

build: $(OP)
	-if exist $(OP_DIR) (echo $(OP_DIR) ALREADY EXISTS !) else (mkdir $(OP_DIR))
	-move /y $(OBJC) $(OP_DIR)
	-move /y $(OBJA) $(OP_DIR)
	-move /y $(OP) $(OP_DIR)

clean:
	-if exist $(OP_DIR)\\$(OBJC) (del $(OP_DIR)\\$(OBJC)) else (echo $(OP_DIR)\\$(OBJC) DOES NOT EXIST !)
	-if exist $(OP_DIR)\\$(OBJA) (del $(OP_DIR)\\$(OBJA)) else (echo $(OP_DIR)\\$(OBJA) DOES NOT EXIST !)
	-if exist $(OP_DIR)\\$(OP) (del $(OP_DIR)\\$(OP)) else (echo $(OP_DIR)\\$(OP) DOES NOT EXIST !)

libcasm: $(OBJS) Makefile
	-$(CC) -static -o $@ $< $(OBJA)

pro_c.o: pro_c.C Makefile
	-$(CC) -c -o $@ $<

pro_asm.o: pro_asm.S Makefile
	-$(CC) -c -o $@ $<
