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
       select inputFile assign to "./primes.dat"
           organization is line sequential.
       select outputFile assign to "./primes.out"
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
           77 num picture s9(9).
           77 divisor picture s9(9) usage is computational.
           77 product picture s9(9) usage is computational.
           77 loop pic 9.
           77 eof pic 9.
           77 backToTop pic 9.
       *> declare a record when reading from user data.
       01 inCard.
           02 inNum picture 9(9).
           02 filler picture x(71).
       *> declare a record if the tille line 
       01 titleLine.
           02 filler picture x(6) value spaces.
           02 filler picture x(20) value 'prime number results'.
       01 theUnderLine.
           02 filler picture x(32) value
        ' -------------------------------'.
       01 notAPrimeLine.
           02 filler picture x value space.
           02 outNum2 picture z(8)9.
           02 filler picture x(15) value ' is not a prime'.
       01 primeLine.
           02 filler picture x value space.
           02 outNum3 picture z(8)9.
           02 filler picture x(11) value ' is a prime'.
       01 error-mess.
           02 filler picture x value space.
           02 outNum picture z(8)9.
           02 filler picture x(14) value ' illegal input'.
       
       *> procedure division.
       *> this division is used to specify the operations.
       *> where the program performed actual logic and instructions.
       procedure division.
       *> initialize variables that is going to be used.
       move 0 to backToTop.
       move 0 to eof.
       move 1 to loop.
       open input inputFile, output outputFile.
       write outLine from titleLine after advancing 0 lines.
       write outLine from theUnderLine after advancing 1 line.

       *> loop the program until end of file is true.
       perform until eof = 1
           *> read input file in each line.
           *> then assign each line to the inCard.
           *> if it's end of file, set eof as true.
           read inputFile into inCard at end move 1 to eof end-read

           *> if it is end of file close the io.
           *> then stop the program.
           if eof = 1
               close inputFile, outputFile
               stop run
           end-if
           
           *> assign num from the input file.
           *> where num will be the number to check whether it is prime.
           move inNum to num
           display num

           *> if the number is less than 1 write an error message.
           *> else find whether it is a prime number.
           if num is not > 1
               *> write error message and continue.
               move inNum to outNum
               write outLine from error-mess after advancing 1 line
           else
               *> if number is greater than 3 then check if it is prime.
               if num is not < 4
                   move 2 to divisor
    
                   *> loop keep looping to check if number is prime.
                   move 1 to loop
                   perform until loop is not = 1
                       *> divide the number to get the remainder.
                       *> so that we know if it is a prime or not.
                       divide divisor into num giving product
                       multiply divisor by product
    
                       *> if product is not the number add 1 to the remainder.
                       *> else show the number that it is not prime.
                       if product is not = num
                           add 1 to divisor
                       else
                           move inNum to outNum2
                           write outLine from notAPrimeLine after advancing 1 line
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
                   move inNum to outNum3
                   write outLine from primeLine after advancing 1 line
               end-if
           end-if
       end-perform.
