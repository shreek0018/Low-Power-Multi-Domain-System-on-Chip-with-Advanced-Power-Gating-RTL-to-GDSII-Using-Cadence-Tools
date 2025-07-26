module soc_top (
    input wire clk_fast,
    input wire clk_slow,
    input wire rst_n,
    input wire pwr_dom1_on,
    input wire pwr_dom2_on,
    output wire [7:0] out_dom1,
    output wire [7:0] out_dom2
);

    // Power Domain 1 with retention
    reg [7:0] reg_dom1;
    always @(posedge clk_fast or negedge rst_n) begin
        if (!rst_n)
            reg_dom1 <= 8'd0;
        else if (!pwr_dom1_on)
            reg_dom1 <= reg_dom1; // Retain state when off
        else
            reg_dom1 <= reg_dom1 + 1'b1;
    end

    // Power Domain 2 without retention
    reg [7:0] reg_dom2;
    always @(posedge clk_slow or negedge rst_n) begin
        if (!rst_n)
            reg_dom2 <= 8'd0;
        else if (pwr_dom2_on)
            reg_dom2 <= reg_dom2 + 1'b1;
        else
            reg_dom2 <= 8'hZZ; // Tri-state when power-gated
    end

    assign out_dom1 = (pwr_dom1_on) ? reg_dom1 : 8'hZZ;
    assign out_dom2 = (pwr_dom2_on) ? reg_dom2 : 8'hZZ;

endmodule
