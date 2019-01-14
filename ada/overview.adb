-- import library
with Ada.Text_IO; use Ada.Text_IO;
with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;

procedure overview is
    -- dec var
    radius, circumference : float;
    percentage : float := 0.0;
    pi : constant float := 3.1415927;
    a, b, c : character := '.';
    h : constant string := "jedi";
    flag : boolean := false;
    -- constraints var
    x : integer range 0..10;

    -- test vars
    num1, num2, total : integer;

-- main
begin
    put("Print all var");
    radius := 1.0;
    circumference := 2.0;
    x := 0;

    num1 := 1;
    num2 := 2;
    total := num1 + num2;
    put("num1 + num2 = total");
    put_line(Integer' Image(total));

    put("overview world! " & " Concat.");

end overview;