!#bin/bash
:'
	Name: Project Template
	Purpose: Creates a new project directory with name given by the user, containing standard files like .gitignore, Makefiles and best practice directory structure to start projects properly.
	Author: Harvey Lopez
'

project="$1"

# creates the project file structure within the given directory.
mkdir -p "$project"/{src, include, build}

# creates the files within these new directories
touch "$project"/src/main.c
touch "$project"/README.md
touch "$project"/Makefile
touch "$project"/.gitignore

# src/main.c template text.
cat > "$project/src/main.c" << EOF
#include <stdio.h>

int main(void)
{
	printf("Hello World\n");
	return 0;
}
EOF

# README template text.
cat > "$project/README.md" << EOF
# Template Title

Brief Description: This is a README.md file created for use as part of the template creator script "projectTemplate.sh".

## Installation & Setup
EOF

# Makefile template text.
cat > "$project/Makefile" << EOF
CC = gcc
CFLAGS = -Wall -Wextra -pedantic

SRC = src/main.c
TARGET = build/main

make:
	$(CC) $(SRC) $(CFLAGS) -o $(TARGET)

clean:
	rm -f $(TARGET)
EOF

# .gitignore template text.
cat > "$project/.gitignore" << EOF
// binaries and object files
build/*.exe
build/*.o
// Swap files
**/*.swp
**/*.swo
EOF
