# ####################################################################

#  Created by Genus(TM) Synthesis Solution 21.14-s082_1 on Fri Jul 25 15:01:28 IST 2025

# ####################################################################

set sdc_version 2.0

set_units -capacitance 1000fF
set_units -time 1000ps

# Set the current design
current_design soc_top

create_clock -name "clk_fast" -period 10.0 -waveform {0.0 5.0} [get_ports clk_fast]
create_clock -name "clk_slow" -period 20.0 -waveform {0.0 10.0} [get_ports clk_slow]
set_clock_gating_check -setup 0.0 
set_input_delay -clock [get_clocks clk_fast] -add_delay 2.0 [get_ports rst_n]
set_input_delay -clock [get_clocks clk_fast] -add_delay 2.0 [get_ports pwr_dom1_on]
set_input_delay -clock [get_clocks clk_slow] -add_delay 2.0 [get_ports pwr_dom2_on]
set_output_delay -clock [get_clocks clk_fast] -add_delay 2.0 [get_ports {out_dom1[7]}]
set_output_delay -clock [get_clocks clk_fast] -add_delay 2.0 [get_ports {out_dom1[6]}]
set_output_delay -clock [get_clocks clk_fast] -add_delay 2.0 [get_ports {out_dom1[5]}]
set_output_delay -clock [get_clocks clk_fast] -add_delay 2.0 [get_ports {out_dom1[4]}]
set_output_delay -clock [get_clocks clk_fast] -add_delay 2.0 [get_ports {out_dom1[3]}]
set_output_delay -clock [get_clocks clk_fast] -add_delay 2.0 [get_ports {out_dom1[2]}]
set_output_delay -clock [get_clocks clk_fast] -add_delay 2.0 [get_ports {out_dom1[1]}]
set_output_delay -clock [get_clocks clk_fast] -add_delay 2.0 [get_ports {out_dom1[0]}]
set_output_delay -clock [get_clocks clk_slow] -add_delay 2.0 [get_ports {out_dom2[7]}]
set_output_delay -clock [get_clocks clk_slow] -add_delay 2.0 [get_ports {out_dom2[6]}]
set_output_delay -clock [get_clocks clk_slow] -add_delay 2.0 [get_ports {out_dom2[5]}]
set_output_delay -clock [get_clocks clk_slow] -add_delay 2.0 [get_ports {out_dom2[4]}]
set_output_delay -clock [get_clocks clk_slow] -add_delay 2.0 [get_ports {out_dom2[3]}]
set_output_delay -clock [get_clocks clk_slow] -add_delay 2.0 [get_ports {out_dom2[2]}]
set_output_delay -clock [get_clocks clk_slow] -add_delay 2.0 [get_ports {out_dom2[1]}]
set_output_delay -clock [get_clocks clk_slow] -add_delay 2.0 [get_ports {out_dom2[0]}]
set_wire_load_mode "enclosed"
