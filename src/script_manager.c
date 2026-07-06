/*
 * ***************************************************************************************************************
 * Name: Script Manager
 * Purpose: A simple entry point where utility scripts can be run from, aimed at automating some common processes.
 * Author: Harvey Lopez
 * ***************************************************************************************************************
*/

#include <stdio.h>

int main(void)
{
	char response;

	while(1)
	{
	
		printf("Welcome to the script manager, see below for your options\n\n");

		printf("*************************************\n");
		printf("* Option | Description              *\n");
		printf("*************************************\n");
		printf("*   1    | UpdateAll()              *\n");
		printf("*   2    | ProjectTemplate()        *\n");
		printf("*   3    | System Specifications    *\n");
		printf("*   d    | View script descriptions *\n");
		printf("*   x    | Exit                     *\n");
		printf("*************************************\n");

		scanf("%c", &response);

		switch(response)
		{
			case '1': 
				// system() call for ./scripts/updateAll() here.
				break;
			case '2':
				printf("By passing in a directory with ./projectTemplate -p (PATH), a starting template for C/ C++ development is created. This automates commonly used files like .gitignores, Makefiles and file structures like build, include and src.");
			case '3':
				printf("Scans the linux filesystem (/proc/*) to retrieve hardware specifications of the current device. This currently only works on Linux devices"\n);
				break;
			case 'd':
				printf("UpdateAll(): A script for installing/ updating frequently used softwares & toolchain items.");
				break;
			case 'x':
				return 0;
		}
	}
	
	return 0;
}
