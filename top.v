module top
#(
    parameter DIVIDE_BY = 17 // Use this when passing in to your clock div!
    // The test bench will set it appropriately for testing
)
(
    input [7:0] sw, // A and B
    input clk, // 100 MHz board clock
    input btnC, // Reset
    output [3:0] an, // 7seg anodes
    output [6:0] seg // 7seg segments
);

    wire divClock;

    // Instantiate the clock divider...
    // ... wire it up to the scanner
    // ... wire the scanner to the decoder
    
    clock_div #(.DIVIDE_BY(DIVIDE_BY))clock (
      .clock(clk),
      .reset(btnC),
      .div_clock(divClock)
    );

    // Wire up the math block into the decoder

    // Do not forget to wire up resets!!

endmodule