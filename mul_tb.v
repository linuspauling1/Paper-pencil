`timescale 1ps/1ps
`include "mul.v"

module mul_tb;

reg clk, rst_n;
reg [7:0] eX, Y;
wire [7:0] A, Q;

mul cut(
    .clk(clk), .rst_n(rst_n),
    .eX(eX), .Y(Y),
    .A(A), .Q(Q)
);

initial begin
    clk = 1'b0;
    repeat (100)
    #5 clk = ~clk;
end

initial begin
    rst_n = 1'b0;
    #6 rst_n = 1'b1;
end

initial begin
    eX = 8'b00000011;
    Y  = 8'b00000010;
end

initial begin
    $dumpfile("test.vcd");
    $dumpvars(0,mul_tb);
end

endmodule