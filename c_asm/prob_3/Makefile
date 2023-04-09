# Compiler
CC=x86_64-linux-android31-clang
# NDK_PATH
NDK_PATH=$(NDK_HOME)
# O/P Object File(s)
OBJA1=c_asm.o
OBJC=c_main.o
OBJA2=pro_asm.o
OBJS=$(OBJA1) $(OBJC) $(OBJA2)
# O/P Executable
OP=libcasm
# Build DIR
OP_DIR=build

build: $(OP)
	-if exist $(OP_DIR) (echo $(OP_DIR) ALREADY EXISTS !) else (mkdir $(OP_DIR))
	-move /y $(OBJA1) $(OP_DIR)
	-move /y $(OBJC) $(OP_DIR)
	-move /y $(OBJA2) $(OP_DIR)
	-move /y $(OP) $(OP_DIR)

clean:
	-if exist $(OP_DIR)\\$(OBJA1) (del $(OP_DIR)\\$(OBJA1)) else (echo $(OP_DIR)\\$(OBJA1) DOES NOT EXIST !)
	-if exist $(OP_DIR)\\$(OBJC) (del $(OP_DIR)\\$(OBJC)) else (echo $(OP_DIR)\\$(OBJC) DOES NOT EXIST !)
	-if exist $(OP_DIR)\\$(OBJA2) (del $(OP_DIR)\\$(OBJA2)) else (echo $(OP_DIR)\\$(OBJA2) DOES NOT EXIST !)
	-if exist $(OP_DIR)\\$(OP) (del $(OP_DIR)\\$(OP)) else (echo $(OP_DIR)\\$(OP) DOES NOT EXIST !)

libcasm: $(OBJS) Makefile
	-$(CC) -nostdlib -static -o $@ $< $(OBJC) $(OBJA2)

c_asm.o: c_asm.S Makefile
	-$(CC) -c -o $@ $<

c_main.o: c_main.C Makefile
	-$(CC) -c -o $@ $<

pro_asm.o: pro_asm.S Makefile
	-$(CC) -c -o $@ $<
