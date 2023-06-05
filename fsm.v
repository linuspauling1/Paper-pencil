module fsm(
    input clk,
    input rst_n,
    input q0,
    output reg load_registers,
    output reg add,
    output reg shift
);

localparam [3:0]
    initialize_registers = 3'b000,
    check_q0 = 3'b001,
    addition = 3'b010,
    shift_right = 3'b011,
    down_count = 3'b100,
    check_n = 3'b101,
    final = 3'b110;

reg [7:0] N;
reg [3:0] st, st_nxt;

always @(posedge clk, negedge rst_n) begin
    if(rst_n == 1'b0)
        st <= initialize_registers;
    else
        st <= st_nxt;
end

always @(*) begin
    case(st)
        initialize_registers:
            begin
                $display("initializez, %d",N);
                add = 1'b0;
                load_registers = 1'b1;
                shift = 1'b0;
                N = 8;
                st_nxt = check_q0;
            end
        check_q0:
            begin
                $display("verific q0, %d",N);
                add = 1'b0;
                load_registers = 1'b0;
                shift = 1'b0;
                if(q0 == 1'b1)
                    st_nxt = addition;
                else
                    st_nxt = shift_right;
            end
        addition:
            begin
                $display("adun, %d",N);
                add = 1'b1;
                load_registers = 1'b0;
                shift = 1'b0;
                st_nxt = shift_right;
            end
        shift_right:
            begin
                $display("shiftez, %d",N);
                add = 1'b0;
                load_registers = 1'b0;
                shift = 1'b1;
                st_nxt = down_count;
            end
        down_count:
            begin
                $display("decrementez, %d",N);
                add = 1'b0;
                load_registers = 1'b0;
                shift = 1'b0;
                N = N - 1;
                st_nxt = check_n;
            end
        check_n:
            begin
                $display("verfic N, %d",N);
                add = 1'b0;
                load_registers = 1'b0;
                shift = 1'b0;
                if(N == 0)
                    st_nxt = final;
                else
                    st_nxt = check_q0;
            end
        final:
            begin
                $display("final, %d",N);
                add = 1'b0;
                load_registers = 1'b0;
                shift = 1'b0;
                st_nxt = final;
            end
    endcase
end

endmodule