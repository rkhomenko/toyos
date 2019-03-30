SOURCES=main.c
OBJECTS=$(SOURCES:.c=.o)

CFLAGS=-m32 -Wall -Wextra -pedantic -std=gnu99 -ffreestanding -O2

kernel: $(OBJECTS)

clean:
	$(RM) $(OBJECTS)
