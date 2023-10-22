
#buttons input data
set_property -dict { PACKAGE_PIN D9    IOSTANDARD LVCMOS33 } [get_ports { D[0] }]; #IO_L6N_T0_VREF_16 Sch=btn[0]
set_property -dict { PACKAGE_PIN C9    IOSTANDARD LVCMOS33 } [get_ports { D[1] }]; #IO_L11P_T1_SRCC_16 Sch=btn[1]
set_property -dict { PACKAGE_PIN B9    IOSTANDARD LVCMOS33 } [get_ports { D[2] }]; #IO_L11N_T1_SRCC_16 Sch=btn[2]


#switches selectors
set_property -dict { PACKAGE_PIN A8    IOSTANDARD LVCMOS33 } [get_ports { S[0] }]; #IO_L12N_T1_MRCC_16 Sch=sw[0]
set_property -dict { PACKAGE_PIN C11   IOSTANDARD LVCMOS33 } [get_ports { S[1] }]; #IO_L13P_T2_MRCC_16 Sch=sw[1]

## RGB LEDs
set_property -dict { PACKAGE_PIN E1    IOSTANDARD LVCMOS33 } [get_ports { Y0[0] }]; #IO_L18N_T2_35 Sch=led0_b
set_property -dict { PACKAGE_PIN F6    IOSTANDARD LVCMOS33 } [get_ports { Y0[1] }]; #IO_L19N_T3_VREF_35 Sch=led0_g
set_property -dict { PACKAGE_PIN G6    IOSTANDARD LVCMOS33 } [get_ports { Y0[2] }]; #IO_L19P_T3_35 Sch=led0_r

set_property -dict { PACKAGE_PIN G4    IOSTANDARD LVCMOS33 } [get_ports { Y1[0] }]; #IO_L20P_T3_35 Sch=led1_b
set_property -dict { PACKAGE_PIN J4    IOSTANDARD LVCMOS33 } [get_ports { Y1[1] }]; #IO_L21P_T3_DQS_35 Sch=led1_g
set_property -dict { PACKAGE_PIN G3    IOSTANDARD LVCMOS33 } [get_ports { Y1[2] }]; #IO_L20N_T3_35 Sch=led1_r

set_property -dict { PACKAGE_PIN H4    IOSTANDARD LVCMOS33 } [get_ports { Y2[0] }]; #IO_L21N_T3_DQS_35 Sch=led2_b
set_property -dict { PACKAGE_PIN J2    IOSTANDARD LVCMOS33 } [get_ports { Y2[1] }]; #IO_L22N_T3_35 Sch=led2_g
set_property -dict { PACKAGE_PIN J3    IOSTANDARD LVCMOS33 } [get_ports { Y2[2] }]; #IO_L22P_T3_35 Sch=led2_r

set_property -dict { PACKAGE_PIN K2    IOSTANDARD LVCMOS33 } [get_ports { Y3[0] }]; #IO_L23P_T3_35 Sch=led3_b
set_property -dict { PACKAGE_PIN H6    IOSTANDARD LVCMOS33 } [get_ports { Y3[1] }]; #IO_L24P_T3_35 Sch=led3_g
set_property -dict { PACKAGE_PIN K1    IOSTANDARD LVCMOS33 } [get_ports { Y3[2] }]; #IO_L23N_T3_35 Sch=led3_r
