CC ?= gcc
CPPFLAGS ?=
CFLAGS ?= -Wall -Wextra
ASFLAGS ?=
LDFLAGS ?=


SRC=main.c
OBJ=${SRC:.c=.o}

BIN=main


.PHONY: all $(BIN) release debug clean


all: debug


release: CPPFLAGS += -DNDEBUG
release: CFLAGS += -O3
release: $(OBJ)
	$(CC) -o $(BIN) $^ $(LDFLAGS)


debug: CFLAGS += -ggdb
debug: LDFLAGS += -fsanitize=address
debug: $(OBJ)
	$(CC) -o $(BIN)-debug $^ $(LDFLAGS)


clean:
	$(RM) $(OBJ) $(BIN) $(BIN)-debug
