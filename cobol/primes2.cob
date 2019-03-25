       *> IDENTIFICATION DIVISION
       IDENTIFICATION DIVISION.
       PROGRAM-ID. tutorial1.
    
       *> ENVIRONMENT DIVISION
       ENVIRONMENT DIVISION.

       *> CONFIGURATION SECTION
       CONFIGURATION SECTION.
       SPECIAL-NAMES.

       *> INPUT OUTPUT SECTION
       INPUT-OUTPUT SECTION.
       FILE-CONTROL.
       SELECT INPUT-FILE ASSIGN TO "./cobol/assets/primes.dat"
           ORGANIZATION IS LINE SEQUENTIAL.
       SELECT OUTPUT-FILE ASSIGN TO "./cobol/assets/primes.out"
           ORGANIZATION IS LINE SEQUENTIAL.

       *> DATA DIVISION
       DATA DIVISION.
       FILE SECTION.
         FD INPUT-FILE.
             01 INPUT-VAL PIC X(9999).
         FD OUTPUT-FILE.
             01 OUT-LINE PIC x(9999) VALUE SPACES.
       
       *> WORKING STORAGE SECTION
       WORKING-STORAGE SECTION.
           77 N PICTURE S9(9).
           77 R PICTURE S9(9) USAGE IS COMPUTATIONAL.
           77 I PICTURE S9(9) USAGE IS COMPUTATIONAL.
           77 TO-BE-PRINT PIC X(9).
           77 WS-EOF PIC X.
           77 LOOP PIC 9.
           77 EOF PIC 9.
           77 BACK-TO-TOP PIC 9.
       01 IN-CARD.
           02 IN-N PICTURE 9(9).
           02 FILLER PICTURE X(71).
       01 TITLE-LINE.
           02 FILLER PICTURE X(6) VALUE SPACES.
           02 FILLER PICTURE X(20) VALUE 'PRIME NUMBER RESULTS'.
       01 UNDER-LINE.
           02 FILLER PICTURE X(32) VALUE
        ' -------------------------------'.
       01 NOT-A-PRIME-LINE.
           02 FILLER PICTURE X VALUE SPACE.
           02 OUT-N-2 PICTURE Z(8)9.
           02 FILLER PICTURE X(15) VALUE ' IS NOT A PRIME'.
       01 PRIME-LINE.
           02 FILLER PICTURE X VALUE SPACE.
           02 OUT-N-3 PICTURE Z(8)9.
           02 FILLER PICTURE X(11) VALUE ' IS A PRIME'.
       01 ERROR-MESS.
           02 FILLER PICTURE X VALUE SPACE.
           02 OUT-N PICTURE Z(8)9.
           02 FILLER PICTURE X(14) VALUE ' ILLEGAL INPUT'.
       
       PROCEDURE DIVISION.
           COMPUTE BACK-TO-TOP = 0.
           COMPUTE EOF = 0.
           COMPUTE LOOP = 1.
           OPEN INPUT INPUT-FILE, OUTPUT OUTPUT-FILE.
           WRITE OUT-LINE FROM TITLE-LINE AFTER ADVANCING 0 LINES.
           WRITE OUT-LINE FROM UNDER-LINE AFTER ADVANCING 1 LINE.

        PERFORM UNTIL EOF = 1
           *> READ INPUT FILE
           READ INPUT-FILE INTO IN-CARD AT END MOVE 1 TO EOF END-READ

           *> IF IT IS END OF FILE CLOSE THE PROGRAM
           IF EOF = 1
               CLOSE INPUT-FILE, OUTPUT-FILE
               STOP RUN
           END-IF
           
           *> MOVE IN-N TO N
           COMPUTE N = IN-N
           DISPLAY "N = ", N

           *> WRITE ERROR MESSAGE
           IF N IS NOT > 1
               MOVE IN-N TO OUT-N
               WRITE OUT-LINE FROM ERROR-MESS AFTER ADVANCING 1 LINE
           ELSE
               *> B1. IF N IS LESS THAN 4 GO TO 3
               IF N IS NOT < 4
                   COMPUTE R = 2
    
                   *> THIS IS 2.
                   COMPUTE LOOP = 1
                   PERFORM UNTIL LOOP IS NOT = 1
    
                       DIVIDE R INTO N GIVING I
                       MULTIPLY R BY I
    
                       *> GO TO B2
                       IF I IS NOT = N
                           ADD 1 TO R
                       ELSE
                           DISPLAY "NOT-A-PRIME-LINE = ", NOT-A-PRIME-LINE
                           COMPUTE OUT-N-2 = IN-N
                           WRITE OUT-LINE FROM NOT-A-PRIME-LINE AFTER ADVANCING 1 LINE
                           COMPUTE BACK-TO-TOP = 1
                       END-IF
    
                       *> IF R IS LESS THAN N GO TO 2.
                       IF BACK-TO-TOP = 1
                           COMPUTE LOOP = 0
                       ELSE IF R < N
                           COMPUTE LOOP = 1
                       ELSE
                           COMPUTE LOOP = 0
                       END-IF
                   END-PERFORM
               END-IF
    
               *> GO BACK TO THE TO OF THE PROGRAM
               IF BACK-TO-TOP = 1
                   COMPUTE BACK-TO-TOP = 0
                   DISPLAY "CONTINUE"
               ELSE
                   DISPLAY "PRIME-LINE = ", PRIME-LINE
                   COMPUTE OUT-N-3 = IN-N
                   WRITE OUT-LINE FROM PRIME-LINE AFTER ADVANCING 1 LINE
               END-IF
           END-IF
       END-PERFORM.
