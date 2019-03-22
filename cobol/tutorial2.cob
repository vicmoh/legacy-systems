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
       77 ws-a pic 9(2).
       77 ws-b pic a(5).
       77 ws-c pic x(10).

       linkage section.
       
       screen section.

       procedure division.
       main-routine section.
       main-para.
           display "Hello World!".
           accept ws-a.
           accept ws-b.
           accept ws-c.
           display "Type something to exit.".
           stop run.


