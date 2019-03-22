    *>    header of the program
       identification division.
       program-id. tutorial1.
    
    *>    environtment division
       environment division.
       configuration section.
       special-names.
       input-output section.
       file-control.

    *>    data division
       data division.
       file section.

    *>    working storage section
       working-storage section.
       77 ws-a pic x.

    *>    linkage section
       linkage section.
       screen section.
       procedure division.
       main-routine section.
       main-para.
           display "hello".
           display "press x to exit".
           accept ws-a.
           stop run.
       
       