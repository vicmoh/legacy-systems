# Name: Vicky Mohammad
# Email: mohammav@uoguelph.ca
# Description: Spigot in Python

# Spigot function
# @param numOfDec
# @return result string
def spigot(numOfDec = 1000):
    # Declare variables for spigot function
    result = ""
    nines = 0
    predigit = 0
    q = 0
    x = 0
    numOfDec = 1000
    # Define the length of the array
    length = (10 * numOfDec/3) +1
    array = []
	# Initialize the array for the decimals
    for i in range(0, int(length)):
		array.insert(i, 2)
	# Loop and each decimals to the string
	# to be ablee to print as PI.
    for j in range(1, 1000+1):
		# Set and initialize q as 0
		q = 0
        # For loop each until the i is zero
		i = int(length)
		while i > 0:
			x = 10 * array[i-1] + q*i
			array[i-1] = x % (2*i-1)
			q = x / (2*i-1)
			i = i - 1
		# Find the remainder of q from mod 10
		# then assign to the fist index.
		array.insert(0, (q % 10))
		q = q / 10
		# If q is nine the counter the number of nine
		# else if it's 10 print the predigit plus 1 and so on.
		# Basically find the next PI sequence and assign it to a string.
		if q == 9:
			nines+=1
		elif q == 10:
			result = result + str(predigit+1)
			for k in range(0, nines):
				result = result + str(0)
			predigit = 0
			nines = 0
		else:
			result = result + str(predigit)
			predigit = q
			if nines != 0:
				for k in range(0, nines):
					result = result + str(9)
                nines = 0
	# Return the result
    result = result + str(predigit)
    return result

# Write to an output file
# @filename for the output
# @string to be outputed
def write(filename, string):
    file = open(filename, "w")
    file.write(string)
    file.close

# Main function to run the program
# for organizing the code.
print("Enter the filename to output: ")
val = raw_input()
result = spigot(1000)
write(val, result)
