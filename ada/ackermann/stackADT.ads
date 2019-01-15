package stackADT is
    procedure stack_push(value: in integer);
    procedure stack_pop(value: out integer);
    function stack_isEmpty return boolean;
end stackADT;