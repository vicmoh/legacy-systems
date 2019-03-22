       identification division.
       program-id. sieve.
       environment division.
       input-output section.
       file-control.
           select STANDARD-INPUT assign to KEYBOARD.
           select STANDARD-OUTPUT assign to DISPLAY.

       data division.
       file section.

       fd STANDARD-INPUT.
           01 STDIN-RECORD	pic X(80).
       fd STANDARD-OUTPUT.
           01 STDOUT-RECORD pic X(80).

       working-storage section.
       01 upperLimitNum pic x(99).
       77 I pic s99 usage is comp.

       procedure division.
           open input STANDARD-INPUT, output STANDARD-OUTPUT.
           display "Enter the upper limit of prime numbers to calculate: "
           accept upperLimitNum
           display upperLimitNum
           perform LOOP thru END-LOOP varying I from 2 by 1
           until I is greater than upperLimitNum.
       LOOP.
           display upperLimitNum.
       END-LOOP.
           stop run.