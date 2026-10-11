CC = gcc
CFLAGS = -Wall -Wextra

SRCS = main.c
TARGET = sml

all: $(TARGET)

$(TARGET): $(SRCS)
	$(CC) $(CFLAGS) $(SRCS) -o $(TARGET) -lm

clean:
	rm -f $(TARGET)

.PHONY: all clean
