with Ada.Text_IO; use Ada.Text_IO;
with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;
with Ada.Strings.Unbounded; use Ada.Strings.Unbounded;
with Ada.Strings.Unbounded.Text_IO; use Ada.Strings.Unbounded.Text_IO;

procedure stackADT is
    -- dec vars
    type stack_list is array(1..256000) of integer;

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
        if this.head = 256000 then
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
end stackADT;