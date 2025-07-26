# Clock definitions
create_clock -name clk_fast -period 10 [get_ports clk_fast]
create_clock -name clk_slow -period 20 [get_ports clk_slow]

# Input and output delays
set_input_delay 2 -clock clk_fast [get_ports rst_n]
set_input_delay 2 -clock clk_fast [get_ports pwr_dom1_on]
set_input_delay 2 -clock clk_slow [get_ports pwr_dom2_on]

set_output_delay 2 -clock clk_fast [get_ports out_dom1]
set_output_delay 2 -clock clk_slow [get_ports out_dom2]

# Note: Power domain and retention strategies should be described via UPF/CPF, not in SDC.
