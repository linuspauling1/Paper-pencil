module fac(
    input x, y, c_in,
    output z, c_out
);

assign z = x^y^c_in;
assign c_out = (x&y) | (y&z) | (z&x);

endmodule

module rca(
    input [63:0]x,
    input [63:0]y,
    input c_in,
    output [63:0]z,
    output c_out
);

fac i0(
    .x(x[0]),
    .y(y[0]),
    .c_in(c_in),
    .z(z),
    .c_out(c_out)
);

genvar iter;

generate
for(iter = 1; iter < 64; iter++) begin
    fac i(x[iter], y[iter], c_out[iter-1], z[iter], c_out[iter]);
end
endgenerate

endmodule