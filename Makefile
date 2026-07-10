CFLAGS= -Wall -Wextra -pedantic

CC="gcc"

SRC="src/toolbox.c"

TARGET="build/toolbox.exe"

make:
	$(CC) $(SRC) $(CFLAGS) -o $(TARGET)

clean:
	rm -f $(TARGET) 

run:
	make clean && make && ./$(TARGET)


