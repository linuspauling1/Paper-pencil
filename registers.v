module registers(
    input clk, rst_n,
    input load_registers, shift,
    input [7:0] eX,Y,
    output reg [7:0] A, B, Q
);

always @(posedge clk, negedge rst_n)
begin
    if(rst_n == 1'b0)
        {A,B,Q} <= 0;
    else if(load_registers == 1'b1)
        begin
            B <= eX;
            Q <= Y;
            A <= 0;
        end
    else if(shift == 1'b1)
        {A,Q} <= {1'b0,A,Q[7:1]};
end

endmodule