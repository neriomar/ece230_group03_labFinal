module dff(
    input Default,
    input reset,
    input clock,
    input D,
    output reg Q,
    output NotQ
);

    initial begin
        Q <= Default;
    end

    assign NotQ = ~Q;

    always @(posedge reset, posedge clock) begin
        if (reset) begin
            Q <= 0;
        end else if (clock) begin
            Q <= D;
        end
    end
endmodule