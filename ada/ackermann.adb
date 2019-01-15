-- import library
with Ada.Text_IO; use Ada.Text_IO;
with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;
with Ada.Strings.Unbounded; use Ada.Strings.Unbounded;
with Ada.Strings.Unbounded.Text_IO; use Ada.Strings.Unbounded.Text_IO;
with stackADT; use stackADT;

procedure ackermann is
    -- calc ackermann to calculate the ackermann
    function calcAckermann(first, second : integer) return integer is
    begin
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
    end calcAckermann;

    -- dec vars for the main
    num1, num2 : integer;
    num1_length, num2_length : integer;
    startTime, endTime : time;

-- main begins
begin
    -- ask for the first number
    put("Enter the first number: ");
    get_line(num1, num1_length);
    put("Enter the second number: ");
    get_line(num2, num2_length);
    -- calc and check for the time
    startTime := clock;
    result := calcAckermann(num1, num2);
    endTime := clock;
    -- print the output
    put_line("-----<<<( OUTPUT )>>-----");
    put_line("The result is " & integer' image(result), width => 0);
    put_line("It takes " & duration' image(startTime - endTime) & " seconds.", width => 0);
    put_line("-------------------------");
end ackermann;