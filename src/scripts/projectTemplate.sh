#!/bin/bash

# Name: Project Template
# Purpose: Creates a new project directory with name given by the user, containing standard files like .gitignore, Makefiles and best practice directory structure to start projects properly.
# Author: Harvey Lopez

path='.'

# Enables the use of options/ flags when calling the script. Enabling ./projectTemplate.sh -p <project_directory> <project_name>
while getopts "p:" opt; do
	case "$opt" in 
		p)
			path="$OPTARG"
			;;
		*)
			echo "Usage: $0 [-p path] project_name"
			exit 1
			;;
	esac

done

shift $((OPTIND - 1))

project="$1"

if [ -z "$project" ]; then
	echo "Usage: $0 [-p path] project_name"
	exit 1
fi

# Pattern substitution allows for '~/' linux pathways.
path="${path/#\~/$HOME}"

TARGET_DIR="$path/$project"

# creates the project file structure within the given directory.
mkdir -p "$TARGET_DIR"/{src,include,build}

# creates the files within these new directories
touch "$TARGET_DIR"/src/main.c
touch "$TARGET_DIR"/README.md
touch "$TARGET_DIR"/Makefile
touch "$TARGET_DIR"/.gitignore

# src/main.c template text.
cat > "$TARGET_DIR/src/main.c" << EOF
#include <stdio.h>

int main(void)
{
	printf("Hello World\n");
	return 0;
}
EOF

# README template text.
cat > "$TARGET_DIR/README.md" << EOF
# Template Title

Brief Description: This is a README.md file created for use as part of the template creator script "projectTemplate.sh".

## Installation & Setup
EOF

# Makefile template text.
cat > "$TARGET_DIR/Makefile" << EOF
CC = gcc
CFLAGS = -Wall -Wextra -pedantic

SRC = src/main.c
TARGET = build/main

make:
	\$(CC) \$(SRC) \$(CFLAGS) -o \$(TARGET)

clean:
	rm -f \$(TARGET)
EOF

# .gitignore template text.
cat > "$TARGET_DIR/.gitignore" << EOF
# binaries and object files
build/*.exe
build/*.o
# Swap files
**/*.swp
**/*.swo
EOF

# Confirmation of directory creation
if command ls "$TARGET_DIR" >/dev/null 2>&1; then
	echo "Creation success @ $TARGET_DIR:"
	if command -v tree >/dev/null 2>&1; then
		tree "$TARGET_DIR"
	else 
		echo "Cannot show result, 'tree' is not installed"
	fi
else 
	echo "Creation failed, please check inputs and try again."
fi
