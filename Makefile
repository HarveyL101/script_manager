CFLAGS= -Wall -Wextra -pedantic

CC="gcc"

SRC="src/script_manager.c"

TARGET="build/script_manager.exe"

make:
	$(CC) $(SRC) $(CFLAGS) -o $(TARGET)

clean:
	rm -f $(TARGET) 

run:
	make clean && make && ./$(TARGET)


