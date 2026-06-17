#!/bin/bash

: '
 Name: Script Manager
 Purpose: A simple entry point to a number of custom scripts made by the author
 Author: Harvey Lopez
'

scriptManager() {
	echo "Welcome to the script manager, see below for your options"

	response=$n
	
	while (( n != 'x' )); do 
		echo -e "1: UpdateAll()\n
			 2: Work in Progress\n
			 3: Work in Progress\n
			 d: View a description of each script's purpose.
			 x: Exit\n
			 "
		| read response;

		case "$response" in
			"1")
				/bin/bash ./scripts/updateAll.sh ;;
			"2")
				echo "This is a WIP script, and will be updated in the future." ;;
			"3")
				echo "This is a WIP script, and will be udpated in the future." ;;
			"d")
				echo -e "UpdateAll():\n\tA script for installing/ updating frequently used software & toolchain items.\n
					 Work in Progress:\n\tA placeholder option for a future script that has not yet been implemented.\n
					 Work in Progress:\n\tA placeholder option for a future script that has not yet been implemented.\n
					 x:\n\tThe exit command for this program.\n" ;;
		esac
	done
}
