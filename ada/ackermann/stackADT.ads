package stackADT is
    procedure push(value: in integer);
    procedure pop(value: out integer);
    function isEmpty return boolean;
end stackADT;