-- @Name: Vicky Mohammad
-- @Email: mohammav
-- @Desciption: Spigot in ada

-- Import library
with Ada.Text_IO; use Ada.Text_IO;
with Ada.Strings; use Ada.Strings;
with Ada.Strings.Fixed; use Ada.Strings.Fixed;
with Ada.Strings.Unbounded; use Ada.Strings.Unbounded;
with Ada.Strings.Unbounded.Text_IO; use Ada.Strings.Unbounded.Text_IO;
-- with Ada.Characters.Handling; use Ada.Characters.Handling;
-- with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;

-- Run program
procedure spigot is
	-- Declare variables
	userInput: string(1..256);
	result: unbounded_string;
	userInputSize, length, nines, predigit, numOfDec: integer := 1;
	x, q: integer := 1;
	arrayDec: array (integer range 1..3334) of integer;
	file : File_Type;
begin
	-- Declare variable for spigot function
	put_line("Enter the filename for the output: ");
	get_line(userInput, userInputSize);
	Create(file, Out_File, userInput);
	
	-- Initialize the array for the decimals
	numOfDec := 1000;
	length := 3334;
	for i in 1..length loop
		arrayDec(i) := 2;
	end loop;

	-- Loop and each decimals to the string
	-- to be ablee to print as PI.
	for j in 1..length loop
		-- Set and initialize q as 0
		q := 0;

		-- For loop each until the i is zero
		for i in reverse 1..length loop
			x := 10 * arrayDec(i) + q*i;
			arrayDec(i) := x mod (2*i-1);
			q := x / (2*i-1);
		end loop;

		-- Find the remainder of q from mod 10
		-- then assign to the fist index.
		arrayDec(1) := q mod 10;
		q := q / 10;
		
		-- If q is nine the counter the number of nine
		-- else if it's 10 print the predigit plus 1 and so on.
		-- Basically find the next PI sequence and assign it to a string.
		if (q = 9) then
			nines := nines + 1;
		elsif (q = 10) then
			result := result & trim(integer'Image(predigit+1), both);
			for k in 0..nines-1 loop
				result := result & "0";
			end loop;
			predigit := 0;
			nines := 0;
		else
			result := result & trim(integer'Image(predigit), both);
			predigit := q;
			if (nines /= 0) then
				for k in 0..nines-1 loop
					result := result & "9";
				end loop;
				nines := 0;
			end if;
		end if;
	end loop;
	
	-- Write and print the result
	result := result & trim(integer'Image(predigit), both);
	Put_Line(file, result);
  	Close(file);
end spigot;
