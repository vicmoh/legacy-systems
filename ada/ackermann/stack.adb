with Ada.Text_IO; use Ada.Text_IO;

package body stack is
    -- dec vars
    maxSize : constant integer := 9999999;
	type stack_list is array(1..maxSize) of integer;

    -- the constructor
    type class_stack is
        record
        head : integer := 0;
        list : stack_list;
        end record;
    this : class_stack;

    -- push to stack
    procedure stack_push(value : in integer) is
    begin
        if this.head = maxSize then
            put_line("The stack is full.");
		else
            this.head := this.head + 1;
            this.list(this.head) := value;
        end if;
    end stack_push;

    -- pop from stack
    procedure stack_pop(value : out integer) is
    begin
        if this.head = 0 then
            put_line("The stack is empty.");
        else
            value := this.list(this.head);
            this.head := this.head - 1;
        end if;
    end stack_pop;

    -- predicate function to see if empty
    function stack_isEmpty return boolean is
    begin
        if this.head = 0 then
            return true;
        else
            return false;
        end if;
    end stack_isEmpty;
end stack;