module seven_seg_scanner(
    input div_clock,
    input reset,
    output [3:0] anode
);
    wire Anext, Bnext, Cnext, Dnext, Enext;

    dff Adff(
        .Default(1'b0),
        .D(Anext),
        .clock(div_clock),
        .Q(anode[0]),
        .reset(reset)
    );

    dff Bdff(
        .Default(1'b1),
        .D(Bnext),
        .clock(div_clock),
        .Q(anode[1]),
        .reset(reset)
    );

    dff Cdff(
        .Default(1'b1),
        .D(Cnext),
        .clock(div_clock),
        .Q(anode[2]),
        .reset(reset)
    );

    dff Ddff(
        .Default(1'b1),
        .D(Dnext),
        .clock(div_clock),
        .Q(anode[3]),
        .reset(reset)
    );

    assign Anext = anode[1];
    assign Bnext = anode[2];
    assign Cnext = anode[3];
    assign Dnext = anode[0];

endmodule