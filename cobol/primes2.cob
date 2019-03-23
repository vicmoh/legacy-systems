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
           MOVE 1 TO LOOP.
           OPEN INPUT INPUT-FILE, OUTPUT OUTPUT-FILE.
           WRITE OUT-LINE FROM TITLE-LINE AFTER ADVANCING 0 LINES.
           WRITE OUT-LINE FROM UNDER-LINE AFTER ADVANCING 1 LINE.
       1. READ INPUT-FILE INTO IN-CARD AT END GO TO FINISH.
           
           *> MOVE IN-N TO N
           MOVE IN-N TO N.
           DISPLAY N.

           *> WRITE ERROR MESSAGE
           IF N < 2
               MOVE IN-N TO OUT-N
               WRITE OUT-LINE FROM ERROR-MESS AFTER ADVANCING 1 LINE
               *> CONTINUE
               GO TO 1
           END-IF.

           *> B1. IF N IS LESS THAN 4 GO TO 3
           IF N > 3
               MOVE 2 TO R

               *> IF R IS LESS THAN N GO TO 2.    
               PERFORM UNTIL LOOP < 1
                   DIVIDE R INTO N GIVING I
                   MULTIPLY R BY I
                   
                   *> GO TO B2
                   IF I IS NOT EQUAL TO N
                       ADD 1 TO R
                   ELSE
                       MOVE IN-N TO OUT-N-2
                       WRITE OUT-LINE FROM NOT-A-PRIME-LINE AFTER ADVANCING 1 LINE
                       *> CONTINUE
                       GO TO 1
                   END-IF

                   *> IF R IS LESS THAN N GO TO 2.
                   SUBTRACT 1 FROM N
                   IF R > N
                       MOVE 0 TO LOOP
                   END-IF
               END-PERFORM

           END-IF. 
            
           *> THIS IS 3.
           MOVE IN-N TO OUT-N-3.
           WRITE OUT-LINE FROM PRIME-LINE AFTER ADVANCING 1 LINE.
           *> CONTINUE
           GO TO 1.
           
       FINISH.
           CLOSE INPUT-FILE, OUTPUT-FILE.
           STOP RUN.
