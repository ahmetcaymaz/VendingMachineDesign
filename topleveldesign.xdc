## Clock signal
set_property PACKAGE_PIN W5 [get_ports clk]
	set_property IOSTANDARD LVCMOS33 [get_ports clk]
	create_clock -add -name sys_clk_pin -period 10.00 -waveform {0 5} [get_ports clk]

## Push buttonU for Reset
set_property PACKAGE_PIN T18 [get_ports reset]
	set_property IOSTANDARD LVCMOS33 [get_ports reset]
##Push buttonL for Nickle
set_property PACKAGE_PIN W19 [get_ports nickle]
	set_property IOSTANDARD LVCMOS33 [get_ports nickle]
## Push ButtonR for Dime	
set_property PACKAGE_PIN T17 [get_ports dime]
	set_property IOSTANDARD LVCMOS33 [get_ports dime]

#Led 14 for Candy output	
set_property PACKAGE_PIN P1 [get_ports {candy}]
	set_property IOSTANDARD LVCMOS33 [get_ports {candy}]
#Led 15 for Coin Return Output
set_property PACKAGE_PIN L1 [get_ports {coinreturn}]
	set_property IOSTANDARD LVCMOS33 [get_ports {coinreturn}]


#### 7 Segment Display
set_property PACKAGE_PIN W7 [get_ports {out7[6]}]
	set_property IOSTANDARD LVCMOS33 [get_ports {out7[6]}]
set_property PACKAGE_PIN W6 [get_ports {out7[5]}]
	set_property IOSTANDARD LVCMOS33 [get_ports {out7[5]}]
set_property PACKAGE_PIN U8 [get_ports {out7[4]}]
	set_property IOSTANDARD LVCMOS33 [get_ports {out7[4]}]
set_property PACKAGE_PIN V8 [get_ports {out7[3]}]
	set_property IOSTANDARD LVCMOS33 [get_ports {out7[3]}]
set_property PACKAGE_PIN U5 [get_ports {out7[2]}]
	set_property IOSTANDARD LVCMOS33 [get_ports {out7[2]}]
set_property PACKAGE_PIN V5 [get_ports {out7[1]}]
	set_property IOSTANDARD LVCMOS33 [get_ports {out7[1]}]
set_property PACKAGE_PIN U7 [get_ports {out7[0]}]
	set_property IOSTANDARD LVCMOS33 [get_ports {out7[0]}]
	
## Anode Activating of 7 Segments
set_property PACKAGE_PIN U2 [get_ports {en_out[0]}]
	set_property IOSTANDARD LVCMOS33 [get_ports {en_out[0]}]
set_property PACKAGE_PIN U4 [get_ports {en_out[1]}]
	set_property IOSTANDARD LVCMOS33 [get_ports {en_out[1]}]
set_property PACKAGE_PIN V4 [get_ports {en_out[2]}]
	set_property IOSTANDARD LVCMOS33 [get_ports {en_out[2]}]
set_property PACKAGE_PIN W4 [get_ports {en_out[3]}]
	set_property IOSTANDARD LVCMOS33 [get_ports {en_out[3]}]
	
#set_property PACKAGE_PIN U16 [get_ports {number[0]}]
#	set_property IOSTANDARD LVCMOS33 [get_ports {number[0]}]
#set_property PACKAGE_PIN E19 [get_ports {number[1]}]
#	set_property IOSTANDARD LVCMOS33 [get_ports {number[1]}]
#set_property PACKAGE_PIN U19 [get_ports {number[2]}]
#	set_property IOSTANDARD LVCMOS33 [get_ports {number[2]}]
#set_property PACKAGE_PIN V19 [get_ports {number[3]}]
#	set_property IOSTANDARD LVCMOS33 [get_ports {number[3]}]
#set_property PACKAGE_PIN W18 [get_ports {number[4]}]
#	set_property IOSTANDARD LVCMOS33 [get_ports {number[4]}]
#set_property PACKAGE_PIN U15 [get_ports {number[5]}]
#	set_property IOSTANDARD LVCMOS33 [get_ports {number[5]}]
	
#set_property PACKAGE_PIN U14 [get_ports {clk_100hz}]
#	set_property IOSTANDARD LVCMOS33 [get_ports {clk_100hz}]

