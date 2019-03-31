DEBUG=

OBJECTS=
TARGET=toyos.elf
IMAGE=toyos.img

LDFLAGS=-Tlink.ld -melf_i386

all: subdirs
all: OBJECTS += $(wildcard asm/*.o)
all: OBJECTS += $(wildcard kernel/*.o)
all: link
all: image

debug: DEBUG += "debug"
debug: all

link: $(OBJECTS)
	$(LD) $(LDFLAGS) $(OBJECTS) -o $(TARGET)

subdirs:
	$(MAKE) --directory=asm $(DEBUG)
	$(MAKE) --directory=kernel $(DEBUG)

image: $(TARGET)
	./create_toyos_image.sh -i $(IMAGE) -e $(TARGET)

clean:
	$(MAKE) --directory=asm clean
	$(MAKE) --directory=kernel clean
	$(RM) $(TARGET) $(IMAGE)
