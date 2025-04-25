module clock_div
#(
    parameter DIVIDE_BY = 17
)
(
    input clock,
    input reset,
    output div_clock
);

    wire [DIVIDE_BY - 1 : 0] NotQ;
    wire [DIVIDE_BY - 1 : 0] clk_in;



    dff d_ff (
        .Default(1'b0),
        .reset(reset),
        .clock(clock),
        .D(NotQ[0]),
        .Q(clk_in[0]),
        .NotQ(NotQ[0])
    );      
           
    genvar i;
    generate
        for(i = 1; i < DIVIDE_BY; i = i + 1) begin : generate_chained_dffs
            dff d_ff (
                .Default(1'b0),
                .reset(reset),
                .clock(clk_in[i-1]),
                .D(NotQ[i]),
                .Q(clk_in[i]),
                .NotQ(NotQ[i])
            );             
        end
    endgenerate
    
    assign div_clock = clk_in[DIVIDE_BY -1];

endmodule