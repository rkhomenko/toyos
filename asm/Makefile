SOURCES=boot.S
OBJECTS=$(SOURCES:.S=.o)

AS=gcc
ASFLAGS=-m32 -I../include

all: $(OBJECTS)

debug: ASFLAGS += -g
debug: all

clean:
	$(RM) $(OBJECTS)
