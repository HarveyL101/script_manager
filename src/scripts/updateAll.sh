#!/bin/bash
: '
 Name: UpdateAll script
 Purpose: A script for quick installation or updating of applications frequently used for development.
 Author: Harvey Lopez
'

# Colour declarations
NC='\033[0m' # No Colour
BLUE='\033[0;34m'
LIGHTBLUE='\033[1;34m'
GREEN='\033[0;32m'

function updateAll() {
	readonly packages=(vim 
		gcc
		git
		cmake 
		make
		gdb
		putty	
	)
	
	# Currently checks for apt, dnf and yum
	package_manager=""

	if command -v apt >/dev/null 2>&1; then
		package_manager="apt"
	elif command -v dnf >/dev/null 2>&1; then
		package_manager="dnf"
	elif command -v yum >/dev/null 2>&1; then
		package_manager="yum"
	else 
		package_manager="missing"
	fi

	if [ "$package_manager" == "missing" ]; then
		res=''
		read -rp "Package manager not found, would you like to enter the name of your package manager? [y/n] (E.g. apt, dnf, yum)" res
		case "$res" in
			[yY][eE][sS]|[yY])
				read -rp "Enter your package manager (apt, dnf, yum):" package_manager
				;;
			*)
				echo "package manager declined, exiting the program now."
				exit 1
				;;
		esac
	else
		echo -e "Package manager detected as ${GREEN}$package_manager${NC}"
		echo "Updating development tools..."
	fi

	for pkg in "${packages[@]}"; do
		if command -v "$pkg" >/dev/null 2>&1; then
			echo -e "${GREEN}$pkg${NC} found, updating to the latest version now..."
			sudo "$package_manager" update --only-upgrade "$pkg"
		else
			echo -e "${GREEN}$pkg${NC} is not installed, installing now..."
			sudo "$package_manager" install -y "$pkg"
		fi
	done
	
	echo -e "\n${LIGHTBLUE}UpdateAll()${NC} concluded."
}

updateAll
