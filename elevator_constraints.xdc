#LED0 State[0]
set_property PACKAGE_PIN T22 [get_ports state[0]]
set_property IOSTANDARD LVCMOS25 [get_ports state[0] ]
set_property SLEW SLOW [get_ports state[0]]
set_property DRIVE 8 [get_ports state[0]]

#LED1 State[1]
set_property PACKAGE_PIN T21 [get_ports state[1]]
set_property IOSTANDARD LVCMOS25 [get_ports state[1]]
set_property SLEW SLOW [get_ports state[1]]
set_property DRIVE 8 [get_ports state[1]]

#LED2 State[2]
set_property PACKAGE_PIN U22 [get_ports state[2]]
set_property IOSTANDARD LVCMOS25 [get_ports state[2]]
set_property SLEW SLOW [get_ports state[2]]
set_property DRIVE 8 [get_ports state[2]]

#LED3 door
set_property PACKAGE_PIN U21 [get_ports door]
set_property IOSTANDARD LVCMOS25 [get_ports door]
set_property SLEW SLOW [get_ports door]
set_property DRIVE 8 [get_ports door]

#LED4 dir
set_property PACKAGE_PIN V22 [get_ports dir]
set_property IOSTANDARD LVCMOS25 [get_ports dir]
set_property SLEW SLOW [get_ports dir]
set_property DRIVE 8 [get_ports dir]

#clock
set_property PACKAGE_PIN Y9 [get_ports clk]
set_property IOSTANDARD LVCMOS25 [get_ports clk]
set_property SLEW SLOW [get_ports clk]
set_property DRIVE 8 [get_ports clk]

#SW0 B1U
set_property PACKAGE_PIN F22 [get_ports B1U]
set_property IOSTANDARD LVCMOS25 [get_ports B1U]
set_property SLEW SLOW [get_ports B1U]
set_property DRIVE 8 [get_ports B1U]

#SW1 B2D
set_property PACKAGE_PIN G22 [get_ports B2D]
set_property IOSTANDARD LVCMOS25 [get_ports B2D]
set_property SLEW SLOW [get_ports B2D]
set_property DRIVE 8 [get_ports B2D]

#SW2 B2U
set_property PACKAGE_PIN H22 [get_ports B2U]
set_property IOSTANDARD LVCMOS25 [get_ports B2U]
set_property SLEW SLOW [get_ports B2U]
set_property DRIVE 8 [get_ports B2U]

#SW3 B3D
set_property PACKAGE_PIN F21 [get_ports B3D]
set_property IOSTANDARD LVCMOS25 [get_ports B3D]
set_property SLEW SLOW [get_ports B3D]
set_property DRIVE 8 [get_ports B3D]

#SW4 B3U
set_property PACKAGE_PIN H19 [get_ports B3U]
set_property IOSTANDARD LVCMOS25 [get_ports B3U]
set_property SLEW SLOW [get_ports B3U]
set_property DRIVE 8 [get_ports B3U]

#SW5 reset 
set_property PACKAGE_PIN H18 [get_ports reset]
set_property IOSTANDARD LVCMOS25 [get_ports reset]
set_property SLEW SLOW [get_ports reset]
set_property DRIVE 8 [get_ports reset]

#SW6 Close door
set_property PACKAGE_PIN H17 [get_ports close_btn]
set_property IOSTANDARD LVCMOS25 [get_ports close_btn]
set_property SLEW SLOW [get_ports close_btn]
set_property DRIVE 8 [get_ports close_btn]

#SW7 Open door 
set_property PACKAGE_PIN M15 [get_ports open_btn]
set_property IOSTANDARD LVCMOS25 [get_ports open_btn]
set_property SLEW SLOW [get_ports open_btn]
set_property DRIVE 8 [get_ports open_btn]

#BTNC B4D
set_property PACKAGE_PIN P16 [get_ports B4D]
set_property IOSTANDARD LVCMOS25 [get_ports B4D]
set_property SLEW SLOW [get_ports B4D]
set_property DRIVE 8 [get_ports B4D]

#BTNU BF1
set_property PACKAGE_PIN T18 [get_ports BF1]
set_property IOSTANDARD LVCMOS25 [get_ports BF1]
set_property SLEW SLOW [get_ports BF1]
set_property DRIVE 8 [get_ports BF1]

#BTND BF2
set_property PACKAGE_PIN R16 [get_ports BF2]
set_property IOSTANDARD LVCMOS25 [get_ports BF2]
set_property SLEW SLOW [get_ports BF2]
set_property DRIVE 8 [get_ports BF2]

#BTNL BF3
set_property PACKAGE_PIN N15 [get_ports BF3]
set_property IOSTANDARD LVCMOS25 [get_ports BF3]
set_property SLEW SLOW [get_ports BF3]
set_property DRIVE 8 [get_ports BF3]

#BTNR BF4
set_property PACKAGE_PIN R18 [get_ports BF4]
set_property IOSTANDARD LVCMOS25 [get_ports BF4]
set_property SLEW SLOW [get_ports BF4]
set_property DRIVE 8 [get_ports BF4]

set_property CLOCK_DEDICATED_ROUTE FALSE [get_nets B1U_IBUF]
set_property CLOCK_DEDICATED_ROUTE FALSE [get_nets B2U_IBUF]
set_property CLOCK_DEDICATED_ROUTE FALSE [get_nets B2D_IBUF]
set_property CLOCK_DEDICATED_ROUTE FALSE [get_nets B3U_IBUF]
set_property CLOCK_DEDICATED_ROUTE FALSE [get_nets B3D_IBUF]
set_property CLOCK_DEDICATED_ROUTE FALSE [get_nets B4D_IBUF]
set_property CLOCK_DEDICATED_ROUTE FALSE [get_nets BF1_IBUF]
set_property CLOCK_DEDICATED_ROUTE FALSE [get_nets BF2_IBUF]
set_property CLOCK_DEDICATED_ROUTE FALSE [get_nets BF3_IBUF]
set_property CLOCK_DEDICATED_ROUTE FALSE [get_nets BF4_IBUF]