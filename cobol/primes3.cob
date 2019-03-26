       *> identification division.
       *> it provides the program name and other items used to uniquely.
       *> identify the program. it is required in every cobol program.
       identification division.
       program-id. primes2.
    
       *> environment division.
       *> describes the computer and other devices used to compile.
       *> it is optional to provide the information.
       environment division.
       *> configuration section.
       *> is the section to tell which computer is being created.
       *> as well as describe the computer environment of the program.
       configuration section.
       *> input output section.
       *> it is for the reading and writing files.
       input-output section.
       file-control.
       select inputFile assign to inputFileName
           organization is line sequential.
       select outputFile assign to outputFileName
           organization is line sequential.

       *> data division.
       *> is a division for working and declarering data.
       data division.
       *> file section is for io data.    
       file section.
         fd inputFile.
             01 inputLine pic x(9999).
         fd outputFile.
             01 outLine pic x(9999) value spaces.
       *> working storage section is for main data.
       working-storage section.
           77 inputFileName pic x(99).
           77 ouputFileName pic x(99).
           77 num pic s9(9).
           77 divisor pic s9(9) usage is computational.
           77 product pic s9(9) usage is computational.
           77 loop pic 9.
           77 eof pic 9.
           77 backToTop pic 9.
           77 userStandardInput pic 9(9).
           77 userOption pic x(9).
       *> declare a record when reading from user data.
       01 inCard.
           02 inNum pic 9(9).
           02 filler pic x(71).
       *> declare a record if the tille line 
       01 titleLine.
           02 filler pic x(6) value spaces.
           02 filler pic x(20) value 'PRIME NUMBER RESULTS'.
       01 theUnderLine.
           02 filler pic x(32) value
        ' -------------------------------'.
       01 notAPrimeLine.
           02 filler pic x value space.
           02 outNum2 pic z(8)9.
           02 filler pic x(15) value ' IS NOT A PRIME'.
       01 primeLine.
           02 filler pic x value space.
           02 outNum3 pic z(8)9.
           02 filler pic x(11) value ' IS A PRIME'.
       01 errorMess.
           02 filler pic x value space.
           02 outNum pic z(8)9.
           02 filler pic x(14) value ' ILLEGAL INPUT'.
       
       *> procedure division.
       *> this division is used to specify the operations.
       *> where the program performed actual logic and instructions.
       procedure division.


       *>---------------------------------------------------------------
       *> main program execution.
       *>---------------------------------------------------------------

       perform mainUserInputFunction.

       *> close the input and output file.
       *> then stop the program.
       close inputFile, outputFile.
       stop run.

       *>---------------------------------------------------------------
       *> code below are cobol functions.
       *>---------------------------------------------------------------

       *> function for asking user input for the 2 options.
       mainUserInputFunction.
           *> loop until the user enter exit
           perform until userOption = "x" or userOption = "x"
               *> initialize variables that is going to be used.
               move 0 to backToTop
               move 0 to eof
               move 1 to loop
               *> display the options to the user.
               display " "
               display "-------------------------------------------------"
               display "Program options."
               display "1 -> Enter prime numbers from the standard input."
               display "2 -> Enter user defined input and output files."
               display "x -> Exit."
               display "-------------------------------------------------"
               display "enter an option:"
               accept userOption
               *> option condition for standard input
               perform standardInputOptionFunction
               *> let user know program is exiting.
               if userOption = "x" or userOption = "x"
                   display "Terminating program..."
                   display "Good bye."
                   display " "
               end-if
           end-perform.

       *> function for the option of the standard input option.
       standardInputOptionFunction.
           if userOption = "1"
               display "Enter a prime number: "
               accept userStandardInput
               perform primeFunction
           else if userOption = "2"
               display "Enter input file name: "
               accept inputFileName
               display "Enter output file name: "
               accept outputFileName
               open input inputFile, output outputFile
               write outLine from titleLine after advancing 0 lines
               write outLine from theUnderLine after advancing 1 line
               display "Reading from file..."
               display "Writing result..."
               perform primeFunction
           end-if.
       
       *> prime function that will find whether a number is prime.
       primeFunction.
           *> loop the program until end of file is true.
           perform until eof = 1
               *> if it's user input option then use that number.
               *> else read input file in each line.
               *> then assign each line to the inCard.
               *> if it's end of file, set eof as true.
               if userOption = "1"
                   move userStandardInput to inNum
               else
                   read inputFile into inCard at end move 1 to eof end-read
               end-if
               *> if it is end of file close the io.
               *> then stop the program.
               if eof = 1 and userOption = "2"
                   display "Writing to a file result completed."
                   display "Terminating program..."
                   display "Good bye."
                   display " "
                   close inputFile, outputFile
                   stop run
               end-if
               *> assign num from the input file.
               *> where num will be the number to check whether it is prime.
               move inNum to num
               *> if the number is less than 1 write an error message.
               *> else find whether it is a prime number.
               if num is not > 1
                   *> write error message and continue.
                   move inNum to outNum
                   if userOption = "1"
                       display "Result: Illegal input."
                   else
                       write outLine from errorMess after advancing 1 line
                   end-if
               else
                   *> if number is greater than 3 then check if it is prime.
                   if num is not < 4
                       move 2 to divisor
                       *> loop keep looping to check if number is prime.
                       move 1 to loop
                       perform until loop is not = 1
                           *> divide the number to get the remainder.
                           *> so that we know if it is a prime or not.
                           compute product = num / divisor
                           compute product = product * divisor
        
                           *> if product is not the number add 1 to the remainder.
                           *> else show the number that it is not prime.
                           if product is not = num
                               compute divisor = divisor + 1
                           else
                               if userOption = "1"
                                   display "Result: It is not a prime number."
                               else
                                   move inNum to outNum2
                                   write outLine from notAPrimeLine after advancing 1 line
                               end-if
                               move 1 to backToTop
                           end-if
                           *> if the number shown that it is not a prime.
                           *> continuue to the top.
                           *> else if the number is bigger than divisor.
                           *> the loop, if not exit the loop.
                           if backToTop = 1
                               move 0 to loop
                           else if divisor < num
                               move 1 to loop
                           else
                               move 0 to loop
                           end-if
                       end-perform
                   end-if
                   *> if the number was not a prime number got back to top.
                   *> else if the number is prime, write and continue.
                   if backToTop = 1
                       move 0 to backToTop
                   else
                       if userOption = "1"
                           display "Result: It is a prime number."
                       else
                           move inNum to outNum3
                           write outLine from primeLine after advancing 1 line
                       end-if
                   end-if
               end-if
               *> exit if the program is the standard input
               if userOption = "1"
                   move 1 to eof
               end-if
           end-perform.
