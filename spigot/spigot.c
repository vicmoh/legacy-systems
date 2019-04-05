/**
 * Name: Vicky Mohammad
 * Email: mohammav@uoguelph.ca
 */
#include <stdio.h>
#include <stdlib.h>
#include <stdbool.h>
#include <string.h>

/**
 * Spigot function to find PI.
 * @return malloc string of the result. Should be freed.
 */
char* spigot(int numOfDec){
	char* toBeReturn = calloc(1024, sizeof(char));
	strcpy(toBeReturn, "0");
	// Declare varibles
	int array[numOfDec + 1];
    int i, k, b, d, c = 0;

	// For loop and initialize the array
    for (i = 0; i < numOfDec; i++) {
        array[i] = 2000;
    }// End for

	// For loop
    for (k = numOfDec; k > 0; k -= 14) {
        d = 0;
        i = k;
		// Loop until i equal to 0
        while (1) {
            d += array[i] * 10000;
            b = 2 * i - 1;
			// Calculate and find the remainder
            array[i] = d % b;
            d /= b;
            i--;
            if (i == 0) break;
            d *= i;
        }//End while
        sprintf(toBeReturn, "%s%.4d", toBeReturn, c + d / 10000);
		toBeReturn = realloc(toBeReturn, sizeof(char) * (strlen(toBeReturn) + 8));
        c = d % 10000;
    }// End for loop
	
	return toBeReturn;
}// End spigot function

/**
 * Write to an outout file
 * @filename for the output
 * @string to be outputed
 */
void write(char* fileName, char* string){
	printf("fileName = |%s|\n", fileName);
	FILE* file = fopen(fileName,  "w");
	fprintf(file, "%s", string);
	fclose(file);
}// End file

/**
 * Main function to run the code.
 */
int main(int argc, char** argv){
	// Get the output file name
	char* fileName = calloc(256, sizeof(char));
	printf("Enter the filename to output: \n");
	scanf("%s", fileName);

	// Write the output string to a file
	char* outputString = spigot(1000);
	printf("Writing...\n%s\n", outputString);
	write(fileName, outputString);

	// Free and return
	free(fileName);
	free(outputString);
	return 0;
}// End main function 
