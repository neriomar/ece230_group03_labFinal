module one_hot(
    input w,
    input clk,
    input reset,
    output z,
    output [4:0] State
);
    wire Anext, Bnext, Cnext, Dnext, Enext;

    dff Adff(
        .Default(1'b1),
        .D(Anext),
        .clk(clk),
        .Q(State[0]),
        .reset(reset)
    );

    dff Bdff(
        .Default(1'b0),
        .D(Bnext),
        .clk(clk),
        .Q(State[1]),
        .reset(reset)
    );

    dff Cdff(
        .Default(1'b0),
        .D(Cnext),
        .clk(clk),
        .Q(State[2]),
        .reset(reset)
    );

    dff Ddff(
        .Default(1'b0),
        .D(Dnext),
        .clk(clk),
        .Q(State[3]),
        .reset(reset)
    );

    dff Edff(
        .Default(1'b0),
        .D(Enext),
        .clk(clk),
        .Q(State[4]),
        .reset(reset)
    );


    assign z = State[2] | State[4];

    assign Anext = 0;
    assign Bnext = ~w & (State[0] | State[3] | State[4]);
    assign Cnext = ~w & (State[1] | State[2]);
    assign Dnext =  w & (State[0] | State[1] | State[2]);
    assign Enext =  w & (State[3] | State[4]);
endmodule