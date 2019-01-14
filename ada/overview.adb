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
    numberTest : integer := 0;
    counter : integer := 0;
begin
    -- print and assign value of the vars
    put_line("Print all var");
    radius := 1.0;
    circumference := 2.0;
    x := 0;

    -- test assigment
    num1 := 1;
    num2 := 2;
    total := num1 + num2;
    put_line("num1 + num2 = total");
    put("total = "); put_line(integer' image(total));
    
    -- if statement
    put_line("using if statement");
    if (total > 1) then 
        put("total = "); put_line(integer' image(total));
    elsif (total > 2) then
    	put("total = "); put_line(integer' image(total));
    else
	put("total = "); put_line(integer' image(total));
    end if;
    
    -- looping in ada
    put("looping");
    loop
	counter := counter + 1;
	put("counter = "); put_line(integer' image(counter));
	exit when (counter = 10);
    end loop;

    -- you can print and concat
    put("overview world! " & " Concat.");
end overview;
