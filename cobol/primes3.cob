       *> IDENTIFICATION DIVISION.
       *> IT PROVIDES THE PROGRAM NAME AND OTHER ITEMS USED TO UNIQUELY.
       *> IDENTIFY THE PROGRAM. IT IS REQUIRED IN EVERY COBOL PROGRAM.
       IDENTIFICATION DIVISION.
       PROGRAM-ID. primes2.
    
       *> ENVIRONMENT DIVISION.
       *> DESCRIBES THE COMPUTER AND OTHER DEVICES USED TO COMPILE.
       *> IT IS OPTIONAL TO PROVIDE THE INFORMATION.
       ENVIRONMENT DIVISION.
       *> CONFIGURATION SECTION.
       *> IS THE SECTION TO TELL WHICH COMPUTER IS BEING CREATED.
       *> AS WELL AS DESCRIBE THE COMPUTER ENVIRONMENT OF THE PROGRAM.
       CONFIGURATION SECTION.
       *> INPUT OUTPUT SECTION.
       *> IT IS FOR THE READING AND WRITING FILES.
       INPUT-OUTPUT SECTION.
       FILE-CONTROL.
       SELECT INPUT-FILE ASSIGN TO "./cobol/assets/primes.dat"
           ORGANIZATION IS LINE SEQUENTIAL.
       SELECT OUTPUT-FILE ASSIGN TO "./cobol/assets/primes.out"
           ORGANIZATION IS LINE SEQUENTIAL.

       *> DATA DIVISION.
       *> IS A DIVISION FOR WORKING AND DECLARERING DATA.
       DATA DIVISION.
       *> FILE SECTION IS FOR IO DATA.    
       FILE SECTION.
         FD INPUT-FILE.
             01 INPUT-VAL PIC X(9999).
         FD OUTPUT-FILE.
             01 OUT-LINE PIC x(9999) VALUE SPACES.
       *> WORKING STORAGE SECTION IS FOR MAIN DATA.
       WORKING-STORAGE SECTION.
           77 N PICTURE S9(9).
           77 R PICTURE S9(9) USAGE IS COMPUTATIONAL.
           77 I PICTURE S9(9) USAGE IS COMPUTATIONAL.
           77 TO-BE-PRINT PIC X(9).
           77 WS-EOF PIC X.
           77 LOOP PIC 9.
           77 EOF PIC 9.
           77 BACK-TO-TOP PIC 9.
           77 USER-STANDARD-INPUT PIC 9(9).
           77 USER-OPTION PIC X(9).
       *> DECLARE A RECORD WHEN READING FROM USER DATA.
       01 IN-CARD.
           02 IN-N PICTURE 9(9).
           02 FILLER PICTURE X(71).
       *> DECLARE A RECORD IF THE TILLE LINE 
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
       
       *> PROCEDURE DIVISION.
       *> THIS DIVISION IS USED TO SPECIFY THE OPERATIONS.
       *> WHERE THE PROGRAM PERFORMED ACTUAL LOGIC AND INSTRUCTIONS.
       PROCEDURE DIVISION.
       OPEN INPUT INPUT-FILE, OUTPUT OUTPUT-FILE.
       WRITE OUT-LINE FROM TITLE-LINE AFTER ADVANCING 0 LINES.
       WRITE OUT-LINE FROM UNDER-LINE AFTER ADVANCING 1 LINE.

       *>---------------------------------------------------------------
       *> MAIN PROGRAM EXECUTION.
       *>---------------------------------------------------------------

       PERFORM MAIN-USER-INPUT-FUNCTION.

       *> CLOSE THE INPUT AND OUTPUT FILE.
       *> THEN STOP THE PROGRAM.
       CLOSE INPUT-FILE, OUTPUT-FILE.
       STOP RUN.

       *>---------------------------------------------------------------
       *> CODE BELOW ARE COBOL FUNCTIONS.
       *>---------------------------------------------------------------

       *> FUNCTION FOR ASKING USER INPUT FOR THE 2 OPTIONS.
       MAIN-USER-INPUT-FUNCTION.
           *> LOOP UNTIL THE USER ENTER EXIT
           PERFORM UNTIL USER-OPTION = "X" OR USER-OPTION = "x"
               *> INITIALIZE VARIABLES THAT IS GOING TO BE USED.
               COMPUTE BACK-TO-TOP = 0
               COMPUTE EOF = 0
               COMPUTE LOOP = 1
               *> DISPLAY THE OPTIONS TO THE USER.
               DISPLAY " "
               DISPLAY "-------------------------------------------------"
               DISPLAY "PROGRAM OPTIONS."
               DISPLAY "1 -> ENTER PRIME NUMBERS FROM THE STANDARD INPUT."
               DISPLAY "2 -> ENTER USER-DEFINED INPUT AND OUTPUT FILES."
               DISPLAY "X -> EXIT."
               DISPLAY "-------------------------------------------------"
               DISPLAY "ENTER AN OPTION:"
               ACCEPT USER-OPTION
               *> OPTION CONDITION FOR STANDARD INPUT
               PERFORM STANDARD-INPUT-OPTION-FUNCTION
               *> LET USER KNOW PROGRAM IS EXITING.
               IF USER-OPTION = "X" OR USER-OPTION = "x"
                   DISPLAY "TERMINATING PROGRAM..."
                   DISPLAY " "
               END-IF
           END-PERFORM.

       *> FUNCTION FOR THE OPTION OF THE STANDARD INPUT OPTION.
       STANDARD-INPUT-OPTION-FUNCTION.
           IF USER-OPTION = "1"
               DISPLAY "ENTER A PRIME NUMBER: "
               ACCEPT USER-STANDARD-INPUT
               PERFORM PRIME-FUNCTION
           ELSE IF USER-OPTION = "2"
               DISPLAY "READING FROM FILE..."
               DISPLAY "WRITING RESULT..."
               PERFORM PRIME-FUNCTION
           END-IF.
       
       *> PRIME FUNCTION THAT WILL FIND WHETHER A NUMBER IS PRIME.
       PRIME-FUNCTION.
           *> LOOP THE PROGRAM UNTIL END OF FILE IS TRUE.
           PERFORM UNTIL EOF = 1
               *> IF IT'S USER INPUT OPTION THEN USE THAT NUMBER.
               *> ELSE READ INPUT FILE IN EACH LINE.
               *> THEN ASSIGN EACH LINE TO THE IN-CARD.
               *> IF IT'S END OF FILE, SET EOF AS TRUE.
               IF USER-OPTION = "1"
                   COMPUTE IN-N = USER-STANDARD-INPUT
               ELSE IF USER-OPTION = "2"
                   READ INPUT-FILE INTO IN-CARD AT END MOVE 1 TO EOF END-READ
               END-IF
               *> IF IT IS END OF FILE CLOSE THE IO.
               *> THEN STOP THE PROGRAM.
               IF EOF = 1
                   DISPLAY "WRITING TO A FILE RESULT COMPLETED."
                   CLOSE INPUT-FILE, OUTPUT-FILE
                   STOP RUN
               END-IF
               *> ASSIGN N FROM THE INPUT FILE.
               *> WHERE N WILL BE THE NUMBER TO CHECK WHETHER IT IS PRIME.
               COMPUTE N = IN-N
               *> IF THE NUMBER IS LESS THAN 1 WRITE AN ERROR MESSAGE.
               *> ELSE FIND WHETHER IT IS A PRIME NUMBER.
               IF N IS NOT > 1
                   *> WRITE ERROR MESSAGE AND CONTINUE.
                   MOVE IN-N TO OUT-N
                   IF USER-OPTION = "1"
                       DISPLAY "RESULT: ILLEGAL INPUT."
                   ELSE IF USER-OPTION = "2"
                       WRITE OUT-LINE FROM ERROR-MESS AFTER ADVANCING 1 LINE
                   END-IF
               ELSE
                   *> IF NUMBER IS GREATER THAN 3 THEN CHECK IF IT IS PRIME.
                   IF N IS NOT < 4
                       COMPUTE R = 2
                       *> LOOP KEEP LOOPING TO CHECK IF NUMBER IS PRIME.
                       COMPUTE LOOP = 1
                       PERFORM UNTIL LOOP IS NOT = 1
                           *> DIVIDE THE NUMBER TO GET THE REMAINDER.
                           *> SO THAT WE KNOW IF IT IS A PRIME OR NOT.
                           DIVIDE R INTO N GIVING I
                           MULTIPLY R BY I
        
                           *> IF I IS NOT THE NUMBER ADD 1 TO THE REMAINDER.
                           *> ELSE SHOW THE NUMBER THAT IT IS NOT PRIME.
                           IF I IS NOT = N
                               ADD 1 TO R
                           ELSE
                               IF USER-OPTION = "1"
                                   DISPLAY "RESULT: IT IS NOT A PRIME NUMBER."
                               ELSE IF USER-OPTION = "2"
                                   COMPUTE OUT-N-2 = IN-N
                                   WRITE OUT-LINE FROM NOT-A-PRIME-LINE AFTER ADVANCING 1 LINE
                               END-IF
                               COMPUTE BACK-TO-TOP = 1
                           END-IF
                           *> IF THE NUMBER SHOWN THAT IT IS NOT A PRIME.
                           *> CONTINUUE TO THE TOP.
                           *> ELSE IF THE NUMBER IS BIGGER THAN R.
                           *> THE LOOP, IF NOT EXIT THE LOOP.
                           IF BACK-TO-TOP = 1
                               COMPUTE LOOP = 0
                           ELSE IF R < N
                               COMPUTE LOOP = 1
                           ELSE
                               COMPUTE LOOP = 0
                           END-IF
                       END-PERFORM
                   END-IF
                   *> IF THE NUMBER WAS NOT A PRIME NUMBER GOT BACK TO TOP.
                   *> ELSE IF THE NUMBER IS PRIME, WRITE AND CONTINUE.
                   IF BACK-TO-TOP = 1
                       COMPUTE BACK-TO-TOP = 0
                   ELSE
                       IF USER-OPTION = "1"
                           DISPLAY "RESULT: IT IS A PRIME NUMBER."
                       ELSE IF USER-OPTION = "2"
                           COMPUTE OUT-N-3 = IN-N
                           WRITE OUT-LINE FROM PRIME-LINE AFTER ADVANCING 1 LINE
                       END-IF
                   END-IF
               END-IF
               *> EXIT IF THE PROGRAM IS THE STANDARD INPUT
               IF USER-OPTION = "1"
                   COMPUTE EOF = 1
               END-IF
           END-PERFORM.
