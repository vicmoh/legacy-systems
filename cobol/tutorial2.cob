    *>    Header of program.
       identification division.
       program-id. tutorial2.
       
    *>    Prorgram environment
    *> has two sections. The configuration sections and the
    *> the input and output section.
       environment division.
    *>    This is for the documentatio purpose only.
    *> The identification division and configuration is mostly used
    *> for documentation of the program.
       configuration section.
    *>    source-computer. IBM 390.
    *>    object-computer. IBM 390.
       special-names.

       input-output section.
       file-control.
       
       data division.
       file section.

    *>    Working section are where we can store the variables.
    *> There are three types which is scalar, array, records.
    *> Every variables must have level number. The piciture is the 
    *> type of the variable.
       working-storage section.
       77 a picture 9(2).
       77 b pic 9(2).
       77 result pic 9.
       77 x pic x.
       77 operator pic x.

       linkage section.
       screen section.

       procedure division.
       main-routine section.
       main-para.
    *>    Do some arithmetic.
       Display "Enter number 1:".
       accept a.
       Display "Enter number 2:". 
       accept b.
    *>    Calculate the two number.
       move 0 to result.
       add a to result.
       add b to result.
       display "Result: ", result.
    *>    Stop the program.
       stop run.
    *>    2:57
    *> https://www.youtube.com/watch?v=ucsayDHPdI4&list=PLByAM0wHjwJkcCAvgXSdvnvbOb3BIFUnB&index=4

