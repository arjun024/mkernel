/*
* Copyright (C) 2014  Arjun Sreedharan
* License: GPL version 2 or higher http://www.gnu.org/licenses/gpl.html
*/

void kmain(void)
{
	char *str = "my first kernel";
	char *vidptr = (char*)0xb8000; //video mem begins here
	unsigned int i = 0;
	unsigned int j = 0;
	//clear all
	while(j < 80 * 25 * 2) {
		vidptr[j] = ' '; //blank character
		vidptr[j+1] = 0x07; //shows prev character should
							 // be white on black screen
		j = j + 2;
	}
	j = 0;
	while(str[j] != '\0') {
		vidptr[i] = str[j]; //the character's ascii
		vidptr[i+1] = 0x07; //shows prev character should
							 // be white on black screen
		++j;
		i = i + 2;
	}
	return;
}
