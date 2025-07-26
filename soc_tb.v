module soc_top_tb;

    reg clk_fast = 0;
    reg clk_slow = 0;
    reg rst_n = 0;
    reg pwr_dom1_on = 1;
    reg pwr_dom2_on = 1;
    wire [7:0] out_dom1;
    wire [7:0] out_dom2;

    soc_top uut (
        .clk_fast(clk_fast),
        .clk_slow(clk_slow),
        .rst_n(rst_n),
        .pwr_dom1_on(pwr_dom1_on),
        .pwr_dom2_on(pwr_dom2_on),
        .out_dom1(out_dom1),
        .out_dom2(out_dom2)
    );

    // Generate clocks
    always #5 clk_fast = ~clk_fast;    // 100MHz
    always #10 clk_slow = ~clk_slow;   // 50MHz

    initial begin
        $dumpfile("soc_top_tb.vcd");
        $dumpvars(0, soc_top_tb);

        // Assert reset
        rst_n = 0;
        #15;
        rst_n = 1;

        #50; // Operate both domains

        pwr_dom1_on = 0; // Power gate domain 1 (retention)
        #30;
        pwr_dom1_on = 1;

        pwr_dom2_on = 0; // Power gate domain 2
        #30;
        pwr_dom2_on = 1;

        #40;
        $finish;
    end

    initial begin
        $monitor("Time=%0t Dom1=%h Dom2=%h", $time, out_dom1, out_dom2);
    end

endmodule
