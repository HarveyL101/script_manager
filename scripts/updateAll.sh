!#bash
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
			"putty" 
		       )
	
	echo "UpdateAll() called, updating dev softwares..."
	
	for i in "${arr[@]}"
	do
		if [ command -v "${arr[$i]}" ]
			echo "${arr[$i]} found, updating to the latest version now..."
			sudo apt upgrade ${arr[$i]}
		else
			echo "${arr[$i]} is not installed, installing now..."
			sudo apt install ${arr[$i]}
		fi
	done

	echo "UpdateAll() concluded."
}
