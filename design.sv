// Code your design here
module lfsr_4bit (
    input clk,
    input reset,
    output reg [3:0] q
);
    wire feedback;

    assign feedback = q[3] ^ q[2];  // x^4 + x^3 + 1

    always @(posedge clk or posedge reset) begin
        if (reset)
            q <= 4'b0001;  // Avoid all-zero state
        else
            q <= {q[2:0], feedback};  // Shift left with feedback
    end
endmodule
