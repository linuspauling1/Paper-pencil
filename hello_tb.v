`timescale 1ns/1ns
`include "hello.v"

module test;

reg a;
wire b;

circuit cut(.a(a),.b(b));

initial begin
    $dumpfile("test.vcd");
    $dumpvars(0,test);
    a = 1'b0;
    repeat (4)
    #5 a = ~a;
end

endmodule
