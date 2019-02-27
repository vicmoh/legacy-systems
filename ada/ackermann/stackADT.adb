with Ada.Text_IO; use Ada.Text_IO;

package body stackADT is
    -- declare variables
    maxSize : constant integer := 9999999;
	type stack_list is array(1..maxSize) of integer;

    -- the stack constructor
    type class_stack is
        record
        head : integer := 0;
        list : stack_list;
        end record;
    this : class_stack;

    -- procedure to push item in the stack
    procedure push(value : in integer) is
    begin
        if this.head = maxSize then
            put_line("The stack is full.");
		else
            this.head := this.head + 1;
            this.list(this.head) := value;
        end if;
    end push;

    -- proceedure for poping item from stack
    procedure pop(value : out integer) is
    begin
        if this.head = 0 then
            put_line("The stack is empty.");
        else
            value := this.list(this.head);
            this.head := this.head - 1;
        end if;
    end pop;

    -- function to set the head
    function top return integer is
    begin
        if this.head = 0 then
            -- stack is empty
            return 0;
        else
            return this.list(this.head);
        end if;
    end top;

    -- reset the stack and clear by setting the head to 0
    procedure clear is
    begin
        this.head := 0;
    end clear;

    -- predicate function to check if it is empty 
    function isEmpty return boolean is
    begin
        if this.head = 0 then
            return true;
        else
            return false;
        end if;
    end isEmpty;
end stackADT;
