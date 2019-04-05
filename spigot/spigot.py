# Spigot function
# @param numOfDec
# @return result string
def spigot(numOfDec = 1000):
    # declare variable
    array = []
    toBeReturn = ''
    c = 0
    
    # For loop and initialize the array
    for x in range(0, numOfDec+1):
        array.insert(x, 2000)
    
    # For loop
    k = numOfDec
    while k > 0:
        d = 0
        i = k
        # Loop until i equal to 0
        while True:
            d += array[i] * 10000
            b = 2 * i - 1
            array.insert(i, (d % b))
            d /= b
            i -= 1
            if (i == 0): 
                break
            d *= i
        # Print each digittt
        toBeReturn = toBeReturn + str(c + d / 10000)
        c = d % 10000
        # k value changed
        k = k - 14
        # Return the string output
    return toBeReturn

# Main function to run the program
# for organizing the code.
print(spigot())
