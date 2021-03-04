OBJECTS = test.obj cga.obj

test.exe : $(OBJECTS)
	tcc -G -O -Z -a $(OBJECTS)

test.obj : test.c
	$(CC) $(CFLAGS) -c -otest.obj test.c

cga.obj: cga.asm
	tasm /mx cga.asm