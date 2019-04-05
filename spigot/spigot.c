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
char* spigot() {
	// Declare variables for spigot function
	char* result = calloc(1024, sizeof(char));
	int length, nines=0, predigit=0,numOfDec=1000;
	int q = 0, x;

	// Define the length of the array
	length = (10 * numOfDec/3) +1;
	int array[length];

	// Initialize the array for the decimals
	for (int i=0; i<length; i=i+1){
		array[i] = 2;
	}//End of for

	// Loop and each decimals to the string
	// to be ablee to print as PI.
	for (int j=1; j<=1000; j=j+1) {
		// Set and initialize q as 0
		q = 0;

		// For loop each until the i is zero
		for (int i=length; i>0; i--) {
			x = 10 * array[i-1] + q*i;
			array[i-1] = x % (2*i-1);
			q = x / (2*i-1);
		}//End for loop
		
		// Find the remainder of q from mod 10
		// then assign to the fist index.
		array[0] = q % 10;
		q = q / 10;

		// If q is nine the counter the number of nine
		// else if it's 10 print the predigit plus 1 and so on.
		// Basically find the next PI sequence and assign it to a string.
		if (q == 9){
			nines++;
		}else if (q == 10) {
			sprintf(result, "%s%d", result, predigit+1);
			result = realloc(result, sizeof(char) * (strlen(result)+8));
			for (int k=0; k<nines; k=k+1){
				sprintf(result, "%s%d", result, 0);
				result = realloc(result, sizeof(char) * (strlen(result)+8));
			}// End for loop
			predigit = 0;
			nines = 0;
		}else {
			sprintf(result, "%s%d", result, predigit);
			result = realloc(result, sizeof(char) * (strlen(result)+8));
			predigit = q;
			if (nines != 0) {
				for (int k=0; k<nines; k=k+1){
					sprintf(result, "%s%d", result, 9);
					result = realloc(result, sizeof(char) * (strlen(result)+8));
				}// End for loop
				nines = 0;
			}// End if
		}//End if
	}// End for loop

	// Return the result
	sprintf(result, "%s%d\n", result, predigit);
	result = realloc(result, sizeof(char) * (strlen(result)+8));
	return result;
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
	char* outputString = spigot();
	printf("Writing...\n%s\n", outputString);
	write(fileName, outputString);

	// Free and return
	free(fileName);
	free(outputString);
	return 0;
}// End main function 
