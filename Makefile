CC=g++
CFLAGS=-O2 -Wall
LDFLAGS=-lfmt

SRCS=$(notdir $(wildcard *.cpp))
$(info Sources:$(SRCS))
OBJS=$(SRCS:.cpp=.o)
$(info Objects:$(OBJS))

OBJ_DIR=./obj
OBJECTS=$(patsubst %.o,$(OBJ_DIR)/%.o,$(OBJS))
$(info Real Objects:$(OBJECTS))

DEPS=$(OBJECTS:.o=.d)
$(info Dependencies:$(DEPS))

TARGET=test

$(TARGET): $(OBJECTS)
	$(CC) -o $@ $(CFLAGS) $^ $(LDFLAGS)

$(OBJ_DIR)/%.o: %.cpp
	mkdir -p obj
	$(CC) -c -o $@ $(CFLAGS) $< $(LDFLAGS) -MD

.PHONY:clean
clean:
	rm -rf $(DEPS) $(OBJECTS) $(TARGET)
	rmdir obj