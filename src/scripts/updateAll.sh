!#bin/bash
: '
 Name: UpdateAll script
 Purpose: A script for quick installation or updating of applications frequently used for development.
 Author: Harvey Lopez
'

updateAll() {
	declare -a arr=("vim" # IDE/ Text Editors
			"gcc" # Tooling
			"git" 
			"cmake" 
			"make"
			"gdb"
			"putty"	
		       )
	
	package_manager="USER INPUT"
	read -p "Enter your package manager command (E.g apt, dnf, ...)" "$package_manager"

	echo "Updating dev softwares..."
	
	for pkg in "${arr[@]}"; do
		if [ command -v "$pkg" >/dev/null 2>&1; ]
			echo "${arr[$i]} found, updating to the latest version now..."
			sudo "$package_manager" update --only-upgrade "$pkg"
		else
			echo "${arr[$i]} is not installed, installing now..."
			sudo "$package_manager" install -y "$pkg"
		fi
	done
	
	echo "UpdateAll() concluded."
}
