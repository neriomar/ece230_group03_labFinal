// Implement module called full_adder
module full_adder(
    input A,
    input B,
    input Cin,

    output Y,
    output Cout
);

    assign Y = A ^ B ^ Cin;
    assign Cout = (B & Cin) + (B & A) + (A & Cin);

endmodule