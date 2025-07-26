This project presents the complete digital design flow of a low-power System-on-Chip (SoC) that features multiple power and clock domains with advanced power gating and state retention. The design is taken from RTL through full backend physical design, including signoff and GDSII generation, using the Cadence tool suite. The work demonstrates practical low-power SoC design and successful completion of a full digital implementation, with multiple technology and EDA stages addressed.



Features:

1.Multiple Power & Clock Domains: Two domains (fast and slow clocks) with independent power gating.Advanced Power Gating: Explicit RTL-based design for domain control and retention.

2.State Retention: State-holding implemented in Domain 1 during power-off periods.

3.Full Backend Flow: RTL to synthesis, place & route, STA, DRC/LVS signoff, and GDSII export using Cadence tools.

4.Testbench Driven: Complete verification environment showcasing dynamic domain enable/disable and retention.





Technologies & Tools:

HDL: Verilog

Testbench: Verilog

Simulation: Cadence Xcelium

Synthesis: Cadence Genus

Physical Design: Cadence Innovus

Timing Constraints: SDC

GDSII Export & Verification: Innovus with sign-off flows
