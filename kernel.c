/*
* Copyright (C) 2014  Arjun Sreedharan
* License: GPL version 2 or higher http://www.gnu.org/licenses/gpl.html
*/

void kmain(void)
{
	const char *str = "my first kernel";
	/* video memory begins at address 0xb8000 */
	char *vidptr = (char*)0xb8000;
	unsigned int i = 0;
	unsigned int j = 0;
	unsigned int screensize = 0; 

	/* this loops clears the screen
	* there are 25 lines each of 80 columns; each element takes 2 bytes */
	screensize = 80 * 25 * 2;
	while (j < screensize) {
		/* blank character */
		vidptr[j] = ' ';
		/* attribute-byte */
		vidptr[j+1] = 0x07;
		j+=2;
	}

	j = 0;

	/* this loop writes the string to video memory */
	while (str[j] != '\0') {
		/* the character's ascii */
		vidptr[i] = str[j];
		/* attribute-byte: give character black bg and light grey fg */
		vidptr[i+1] = 0x07;
	 	j++;
		i += 2;
	}

	return;
}

