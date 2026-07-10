# Simple Script Manager

**Description:**
A simple script manager aimed at automating some simpler processes made during setup/ development. All scripts are intended to be run from the `toolbox.c` file which serves as the entry-point to the program.

> [!NOTE]
> This project and the subsequent scripts are focused purely on linux based systems, and makes no attempt to function on Windows systems. Therefore it would be advisable to not be used on Windows.

## Scripts

Below are the currently written scripts and their intentions within this small project.

### UpdateAll.sh

A script responsible for the upgrading/ installation of frequently used dev softwares, these are centered around C/Embedded projects
and contain calls for the Text Editor (*Vim*), Toolchain (*git*, *gdb*, *make*) and Compilers (*gcc*, *g++*, *clang*)

This also attempts to detect the package manager used by the system, but has a fallback option of taking in user input if it fails.

> [!WARNING]
> This script assumes the package manager follows the format of `sudo <package-manager> install <package-name>` OR `sudo <package-manager> upgrade <package-name>`. This would therefore not work (currently) with package managers like pacman who use the command `pacman -S *package_name1 package_name2*`.

### ProjectTemplate.sh

A template provider for a basic but structured C program, being able to be created at the given directory.

The resulting directory contains:

```
.
└── project_name/
    ├── src/
    │   └── main.c
    ├── include/
    ├── build/
    ├── README.md
    ├── Makefile
    └── .gitignore
```

The files all contain a starting template relevant to their function, with only `/include` and `/build` being initially empty.

The method for using this script follows the formula:

`./<relative_script_path>/projectTemplate.sh -p <project_path> <project_name>`

### SystemSpecs.sh

Displays key information about the current device's hardware, pulling primarily from the linux filesystem's `/proc` directory. Currently displays information about the CPU and Storage, with information about connected devices, drives, ports and other aspects still being investigated.

## Installation & Setup

1. Navigate to the desired directory using `cd <path>`
2. Clone the repo using `git clone "https://Github.com/HarveyL101/toolbox"`
3. Compile the project using `make` in the root of the repo directory.
4. Either assign the resulting `toolbox.exe` within `/build` to a macro or easily accessible place.
    1. Assign `toolbox.exe` to a macro or easily accessible file location (E.g. Desktop).
    2. Run the program from the repo's directory using `make run`
5. Enjoy!

> `make run` as a command evaluates to:
> ```
> rm -f build/toolbox.exe &&
> gcc src/toolbox.c -Wall -Wextra -pedantic -o build/toolbox.exe &&
> ./build/toolbox.exe
> ```

> [!IMPORTANT]
> This project and its documentation are subject to change, and is intended to be a Work In Progress style of project that improves with my experience in bash, C and linux-based systems.
