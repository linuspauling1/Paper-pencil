`include "fsm.v"
`include "registers.v"
`include "sum.v"

module mul(
    input clk, rst_n,
    input [7:0] eX, Y,
    output [7:0] A, Q
);

wire add, load_registers, shift;
wire [7:0] B;

sum i0(
    .add(add),
    .B(B),
    .A(A));

registers i1(
    .clk(clk),
    .rst_n(rst_n),
    .load_registers(load_registers),
    .shift(shift),
    .eX(eX),
    .Y(Y),
    .A(A),
    .B(B),
    .Q(Q)
);

fsm i2(
    .clk(clk),
    .rst_n(rst_n),
    .q0(Q[0]),
    .load_registers(load_registers),
    .add(add),
    .shift(shift)
);

endmodule