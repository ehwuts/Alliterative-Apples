NAME=AlliterativeApples

SOURCE=./src/
OUTPUT=./bin/

CC=g++
CFLAGS=-c -Wall
LFLAGS=-lws2_32

EXE=$(OUTPUT)$(NAME)
SOURCES=$(wildcard $(SOURCE)*.cpp)
OBJECTS=$(SOURCES:.cpp=.o)

build: $(SOURCES) $(EXE)

debug: CFLAGS:=$(CFLAGS) -g
debug: $(SOURCES) $(EXE)	

$(EXE): $(OBJECTS)
	$(CC) $(OBJECTS) -o $@ $(LFLAGS)

.cpp.o:
	$(CC) $(CFLAGS) $< -o $@	

.PHONY: clean
clean:
	rm $(SOURCE)*.o $(OUTPUT)*