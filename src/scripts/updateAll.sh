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
	
	// Currently checks for apt, dnf and yum
	package_manager="USER INPUT"
	if [ command -v apt >/dev/null 2>&1 ]; then
		package_manager="apt"
	else if [ command -v dnf >/dev/null 2>&1]; then
		package_manager="dnf"
	else if [ command -v yum >/dev/null 2>&1]; then
		package_manager="yum"
	else 
		package_manager="missing"
	fi

	if [ "$package_manager"=="missing" ]; then
		res=''
		read -p "Package manager not found, would you like to enter the name of your package manager? [y/n] (E.g. apt, dnf, yum)" "$res"
		case "$res" in
			[yY][eE][sS]|[yY])
				read -p "Enter the name of your package manager in lowercase" "$package_manager"
				;;
			*)
				echo "package manager declined, exiting the program now."
				exit 1
				;;
		esac
	else
		echo "Updating dev softwares..."
	fi

	for pkg in "${arr[@]}"; do
		if [ command -v "$pkg" >/dev/null 2>&1 ]; then
			echo "${arr[$i]} found, updating to the latest version now..."
			sudo "$package_manager" update --only-upgrade "$pkg"
		else
			echo "${arr[$i]} is not installed, installing now..."
			sudo "$package_manager" install -y "$pkg"
		fi
	done
	
	echo "UpdateAll() concluded."
}
