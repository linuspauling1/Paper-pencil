module sum(
    input add,
    input [7:0] B,
    output reg [7:0] A
);

always @(add)
begin
    if(add)
        A = A + B;
end

endmodule