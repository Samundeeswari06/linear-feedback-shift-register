// Code your testbench here
// or browse Examples
module tb_lfsr_4bit;
    reg clk, reset;
    wire [3:0] q;

    lfsr_4bit uut (
        .clk(clk),
        .reset(reset),
        .q(q)
    );

    // Clock generation
    initial begin
        clk = 0;
        forever #5 clk = ~clk;  // 10 time units period
    end

    // Stimulus
    initial begin
        $display("Time\tQ");
        $monitor("%0t\t%b", $time, q);

        reset = 1; #10;
        reset = 0;

        #100;  // Let it run for some cycles

        $finish;
    end
endmodule
