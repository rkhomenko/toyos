OBJECTS=
TARGET=toyos.elf

LDFLAGS=-Tlink.ld -melf_i386

all: subdirs
all: OBJECTS += $(wildcard asm/*.o)
all: OBJECTS += $(wildcard kernel/*.o)
all: link

link: $(OBJECTS)
	$(LD) $(LDFLAGS) $(OBJECTS) -o $(TARGET)

subdirs:
	$(MAKE) --directory=asm
	$(MAKE) --directory=kernel

clean:
	$(MAKE) --directory=asm clean
	$(MAKE) --directory=kernel clean
	$(RM) $(TARGET)
