-- import library
with Ada.Text_IO; use Ada.Text_IO;
with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;
with Ada.Strings.Unbounded; use Ada.Strings.Unbounded;
with Ada.Strings.Unbounded.Text_IO; use Ada.Strings.Unbounded.Text_IO;

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
	name : string(1 .. 64);
	dynamicName : unbounded_string;
	nameLength : integer;
	-- enum
	type colour is (red, yellow, blue, green);
	type status is (on, off);

	-- create function example
	function sign(x: integer) return integer is
	begin
    	if x > 0 then
        	put_line("x > 0");
        	return 1;
    	elsif x < 0 then
        	put_line("x < 0");
        	return -1; 
    	else
        	put_line("x = 0");
        	return 0;
    	end if;
	end sign;
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
    if total > 1 then 
        put("total = "); put_line(integer' image(total));
    elsif total > 2 then
    	put("total = "); put_line(integer' image(total));
    else
	put("total = "); put_line(integer' image(total));
    end if;
    
    -- looping in ada
    put_line("----- looping -----");
    loop
		counter := counter + 1;
		put("counter = "); put_line(integer' image(counter));
		exit when (counter = 10);
    end loop;
	
    -- while loop in ada
    put_line("----- while loop -----");
    counter := 0;
    while counter /= 10 loop
		counter := counter + 1;
		put("counter = "); put_line(integer' image(counter));
    	-- you can also use the if then exit
		if counter = 7 then
			exit;
		end if;
	end loop;

	-- for loop
	counter := 0;
	put_line("----- for loop -----");
	for i in 1..5 loop
		counter := counter + 1;
		put("i = "); put_line(integer' image(i));
	end loop;

	-- reverse loop
	put_line("----- reverse for loop -----");
	for i in reverse 1..5 loop
		put("i = "); put_line(integer' image(i));
	end loop;
	
	-- input from terminal
	put("enter name: ");
	get_line(name, nameLength);
	put("your name is "); put_line(name(1..nameLength));
	
	-- calling the function
	put_line("----- calling func sign() -----");
	put("result: "); put_line(integer' image(sign(counter)));	

    -- you can print and concat
    put("overview world! " & " Concat.");
end overview;

