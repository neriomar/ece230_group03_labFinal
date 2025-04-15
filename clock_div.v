module clock_div
#(
    parameter DIVIDE_BY = 17
)
(
    input clock,
    input reset,
    output reg div_clock
);

    wire [DIVIDE_BY - 1 : 0] NotQ;
    wire [DIVIDE_BY : 0] clk_in;
    // wire [DIVIDE_BY : 0] clk_out;

    assign clk_in[0] = clock;

    genvar i;
    generate
        for(i = 0; i < DIVIDE_BY; i = i + 1) begin : generate_chained_dffs
            dff d_ff (
                .reset(reset),
                .clock(clk_in[i]),
                .D(NotQ[i]),
                .Q(clk_in[i + 1]),
                .NotQ(NotQ[i])
            );             
        end
    endgenerate
    
    always (*) begin
        div_clock <= clk_in[DIVID_BY];
    end

endmodule