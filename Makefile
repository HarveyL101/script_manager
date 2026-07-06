CFLAGS="-Wall -Wextra -pedantic"

CC="gcc"

TARGET="build/script_manager.exe"

make: script_manager.c
	$(CC) $(CFLAGS) -o $(TARGET)

clean:
	rm -f $(TARGET) 
