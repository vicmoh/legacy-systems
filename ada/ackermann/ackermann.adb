-- import library
with Ada.Text_IO; use Ada.Text_IO;
with Ada.Calendar; use Ada.Calendar;
with stack; use stack;

procedure ackermann is
    -- dec vars for the main
    num1, num2 : string(1..64);
 	num1_int, num2_int : integer;
    num1_length, num2_length : integer;
    startTime, endTime : time;
    result : integer;

    -- calc ackermann function to calculate the ackermann
    function calcAckermann(firstValue, secondValue : integer) return integer is
        first, second : integer;
    begin
        first := firstValue;
        second := secondValue;
        stack_push(first);
        loop
            -- exit when is empty
            if stack_isEmpty then
                exit;
            end if;
            -- pop firs
            stack_pop(first);
            -- first case
            if first = 0 then
                second := second + 1;
            elsif second = 0 then
                second := 1;
                stack_push(first - 1);
            else
                second := second - 1;
                stack_push(first - 1);
                stack_push(first);
            end if;
        end loop;
        -- return
        return second;
    end calcAckermann;

-- main begins
begin
    -- ask for the first number
    put("Enter the first number: ");
    get_line(num1, num1_length);
    put("Enter the second number: ");
    get_line(num2, num2_length);
 	-- assign the string
 	num1_int := integer'value(num1(1..num1_length));
	num2_int := integer'value(num2(1..num1_length));
    -- calc and check for the time
    put_line("Loading...");
	startTime := clock;
    result := calcAckermann(num1_int, num2_int);
    endTime := clock;
    -- print the output
    put_line("-----<<<( OUTPUT )>>-----");
    put_line("The result is " & integer'image(result) & ".");
    put_line("It takes " & duration'image(endTime - startTime) & " seconds.");
    put_line("-------------------------");
end ackermann;
