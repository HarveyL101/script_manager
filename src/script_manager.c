/*
 * ***************************************************************************************************************
 * Name: Script Manager
 * Purpose: A simple entry point where utility scripts can be run from, aimed at automating some common processes.
 * Author: Harvey Lopez
 * ***************************************************************************************************************
*/

#include <stdio.h>
#include <stdlib.h>
#include <string.h>

void stripNewline(char *string)
{
	// Removes the '\n' from a string, to avoid linebreaks in the ProjectTemplate() substring catenation.
	size_t length = strlen(string);
	if (length > 0 && string[length - 1] == '\n')
	{
		string[length - 1] = '\0';
	}
}

void printMenu()
{

		printf("*************************************\n");
		printf("* Option | Description              *\n");
		printf("*************************************\n");
		printf("*   1    | Update All               *\n");
		printf("*   2    | Project Template         *\n");
		printf("*   3    | System Specifications    *\n");
		printf("*   d    | View script descriptions *\n");
		printf("*   r    | Refresh the options menu *\n");
		printf("*   x    | Exit                     *\n");
		printf("*************************************\n");
}

int main(void)
{
	char response;
	char script_path[] = "./src/scripts/projectTemplate.sh"; // Only used for script no. 2
	char project_path[100];
	char project_name[30];
	char command[256];
	int c;

	printf("\nWelcome to the script manager, see below for your options\n");
	
	printMenu(); 

	// Ensures the user has execution privileges on the given scripts.
	system("chmod +x src/scripts/updateAll.sh");
	system("chmod +x src/scripts/projectTemplate.sh");
	system("chmod +x src/scripts/systemSpecs.sh");

	while(1)
	{
		printf("\nEnter your response here: ");
		scanf("%c", &response);

		switch(response)
		{
			case '1': 
				// system() call for ./scripts/updateAll.sh here.
				system("./src/scripts/updateAll.sh");
				break;
			case '2':
				// Flushes stdin to avoid old '\n' from scanf's slipping into later fgets() calls
				while ((c = getchar()) != '\n' && c != EOF) {} 

				printf("\nprojectTemplate follows the formula:\n\t./projectTemplate.sh -p <project_directory> <project_name>\n");
				printf("E.g.\n\t./projectTemplate.sh -p ~/foo/bar helloWorld\ncreates the directory\n\t~/foo/bar/helloWorld");
				
				printf("\n\nEnter <project_directory>: ");
				fgets(project_path, sizeof(project_path), stdin);
				stripNewline(project_path);

				printf("\nEnter <project_name>: ");
				fgets(project_name, sizeof(project_name), stdin);
				stripNewline(project_name);

				snprintf(command, sizeof(command), "%s -p %s %s", script_path, project_path, project_name);

				printf("Executing command: %s\n", command);

				system(command);
				break;
			case '3':
				// system() call for ./scripts/systemSpecs.sh here.
				system("./src/scripts/systemSpecs.sh");
				break;
			case 'd':
				printf("\nUpdate All:\n\tA script for installing/ updating frequently used softwares & toolchain items.\n\n");

				printf("Project Template:\n\tBy passing in a directory with ./projectTemplate -p (PATH), a starting template for C/ C++ development is created. This automates commonly used files like .gitignores, Makefiles and file structures like build, include and src.\n\n");

				printf("System Specifications:\n\tScans the linux filesystem (/proc/*) to retrieve hardware specifications of the current device. This currently only works on Linux devices\n\n");
				break;
			case 'r':
				printMenu();
				break;
			case 'x':
				return 0;
			default:
				printf("Invalid response (%c), please try again\n", response);
		}
	}
	
	return 0;
}
