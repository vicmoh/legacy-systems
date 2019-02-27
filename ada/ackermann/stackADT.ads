package stackADT is
    procedure push(value: in integer);
    procedure pop(value: out integer);
    procedure clear;
    function isEmpty return boolean;
    function top return integer;
end stackADT;