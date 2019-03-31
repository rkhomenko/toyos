SOURCES=main.c protected_mode.c
OBJECTS=$(SOURCES:.c=.o)

CFLAGS=-m32 -Wall -Wextra -pedantic -std=gnu99 -ffreestanding -O2 -I../include

all: $(OBJECTS)

debug: CFLAGS += -g
debug: all

clean:
	$(RM) $(OBJECTS)
