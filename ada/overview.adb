with Ada.Text_IO; use Ada.Text_IO;
procedure overview is

-- dec var
radius, circumference : float;
percentage : float := 0.0;
pi : constant float := 3.1415927;
a, b, c : character := '.';
h : constant string := "jedi";
falg : boolean := false;
success, failure : boolean;
-- constraints var
x : integer range 1..10;

-- dec numbers
num1, num2, total : integer;

begin
    total := num1 + num2;

    Put("num1 + num2 = total");
    Put(total);
    
    Put("overview world!");
    
end overview;