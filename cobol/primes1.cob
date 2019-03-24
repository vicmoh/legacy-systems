    *>    header of the program
       IDENTIFICATION DIVISION.
       PROGRAM-ID. tutorial1.
    
    *>    environtment division
       ENVIRONMENT DIVISION.

    *>    configuration section
       CONFIGURATION SECTION.
       SPECIAL-NAMES.

    *>    input output section
       INPUT-OUTPUT SECTION.
       FILE-CONTROL.
       SELECT INPUT-FILE ASSIGN TO "./cobol/assets/primes.dat"
           ORGANIZATION IS LINE SEQUENTIAL.
       SELECT OUTPUT-FILE ASSIGN TO "./cobol/assets/primes.out"
           ORGANIZATION IS LINE SEQUENTIAL.

    *>    data division
       DATA DIVISION.
       FILE SECTION.
       FD INPUT-FILE.
           01 INPUT-VAL PIC X(9999).
       FD OUTPUT-FILE.
           01 OUT-LINE PIC x(9999) VALUE SPACES.
           
       WORKING-STORAGE SECTION.
           77 N PICTURE S9(9).
           77 R PICTURE S9(9) USAGE IS COMPUTATIONAL.
           77 I PICTURE S9(9) USAGE IS COMPUTATIONAL.
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
           OPEN INPUT INPUT-FILE, OUTPUT OUTPUT-FILE.
           WRITE OUT-LINE FROM TITLE-LINE AFTER ADVANCING 0 LINES.
           WRITE OUT-LINE FROM UNDER-LINE AFTER ADVANCING 1 LINE.
       1.  READ INPUT-FILE INTO IN-CARD AT END GO TO FINISH.
           MOVE IN-N TO N.
           DISPLAY N.
           IF N IS GREATER THAN 1 GO TO B1.
           MOVE IN-N TO OUT-N.
           WRITE OUT-LINE FROM ERROR-MESS AFTER ADVANCING 1 LINE.
           GO TO 1.
       B1. IF N IS LESS THAN 4 GO TO 3.
           MOVE 2 TO R.
       2.  DIVIDE R INTO N GIVING I.
           MULTIPLY R BY I.
           IF I IS NOT EQUAL TO N GO TO B2.
           MOVE IN-N TO OUT-N-2.
           WRITE OUT-LINE FROM NOT-A-PRIME-LINE AFTER ADVANCING 1 LINE.
           GO TO 1.
           B2. ADD 1 TO R.
           IF R IS LESS THAN N GO TO 2.
       3.  MOVE IN-N TO OUT-N-3.
           WRITE OUT-LINE FROM PRIME-LINE AFTER ADVANCING 1 LINE.
           GO TO 1.
       FINISH.
           CLOSE INPUT-FILE, OUTPUT-FILE.
           STOP RUN.
