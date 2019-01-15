-- import library
with Ada.Text_IO; use Ada.Text_IO;
with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;
with Ada.Strings.Unbounded; use Ada.Strings.Unbounded;
with Ada.Strings.Unbounded.Text_IO; use Ada.Strings.Unbounded.Text_IO;
with Ada.Calendar; use Ada.Calendar;
with stack; use stack;

procedure ackermann is
    -- dec vars for the main
    num1, num2 : integer;
    num1_length, num2_length : integer;
    startTime, endTime : time;
    result : integer;

    -- calc ackermann to calculate the ackermann
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
            end if;
            --  second case
            if second = 0 then
                second := 1;
                stack_push(first - 1);
            end if;
            -- last case
            if first /= 0 and second /= 0 then
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
    get(num1, num1_length);
    put("Enter the second number: ");
    get(num2, num2_length);
    -- calc and check for the time
    startTime := clock;
    result := calcAckermann(num1, num2);
    endTime := clock;
    -- print the output
    put_line("-----<<<( OUTPUT )>>-----");
    put_line("The result is " & integer' image(result));
    put_line("It takes " & duration' image(startTime - endTime) & " seconds.");
    put_line("-------------------------");
end ackermann;