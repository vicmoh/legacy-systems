with Ada.Text_IO; use Ada.Text_IO;
procedure overview is
begin
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
    total := num1 + num2;

    put("num1 + num2 = total");
    put(total);
    
    put("overview world!");
    
end overview;