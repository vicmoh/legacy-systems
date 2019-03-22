       *> Hello world.
       identification division.
       program-id. hello.
       procedure division.
           display "Hello World! ".
       *> There are 3 types of variables:
       *> scalar for 1 variable, must be declared in 77.
       *> array for multiple values.
       *> records can hold multiple values of multiple types.

    *>    input-output section.
    *>    file-control.

    *>    data division.
    *>    file section.

       working-storage section.
       *> The picture clause is used to describe the class and 
       *> other attributes.
       *> where level is a level number and picture-string is a string 
       *> consisting of picture characters used to describe an item. 
       *> Four of the main picture characters are: X, 9, V, and S.
       *> level variable-name pic picture-string

       *> Count, used to store values that contain 
       *> no more than five decimal digits (+, -) values:
       77 count pic 99999.
       


