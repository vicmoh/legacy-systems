/**
 * Name: Vicky Mohammad
 * Email: mohammav@uoguelph.ca
 */
#include <stdio.h>
#include <stdlib.h>
#include <stdbool.h>

/**
 * Spigot function to find PI.
 * @return malloc string of the resultt. Should be freed.
 */
void spigot(int numOfDec){
	// Declare setup																																																							
	int array[numOfDec + 1];
	int i, k, b, d, c = 0;
	
	// Initalize the array
	for(int x=0; x<numOfDec; x++){
		array[x] = 2000;
	}// End for
	
	// Loop through the and get find the PI
	for(int x=numOfDec; x>0; x -= 14){
		d = 0;
		x = k;
		while(true){
			d += array[x] * 10000;
            b = 2 * x - 1;

            array[x] = d % b;
            d /= b;
            x--;
            if (x == 0) break;
            d *= x;
		}// End while

		// Print the spigot PI
		printf("%.4d", c + d / 10000);
        c = d % 10000;
	}// End for
}// End spigot function

/**
 * Main function to run the code.
 */
int main(int argc, char** argv){
	spigot(2800);
	return 0;
}// End main function 