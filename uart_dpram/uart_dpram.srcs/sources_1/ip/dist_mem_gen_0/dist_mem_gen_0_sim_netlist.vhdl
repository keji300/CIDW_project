-- Copyright 1986-2017 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2017.4 (win64) Build 2086221 Fri Dec 15 20:55:39 MST 2017
-- Date        : Thu Feb 14 09:46:58 2019
-- Host        : PC-20181124UOWH running 64-bit major release  (build 9200)
-- Command     : write_vhdl -force -mode funcsim
--               d:/FPGA_CIDW/dual_ram2/uart_dpram/uart_dpram.srcs/sources_1/ip/dist_mem_gen_0/dist_mem_gen_0_sim_netlist.vhdl
-- Design      : dist_mem_gen_0
-- Purpose     : This VHDL netlist is a functional simulation representation of the design and should not be modified or
--               synthesized. This netlist cannot be used for SDF annotated simulation.
-- Device      : xc7z020clg484-2
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity dist_mem_gen_0_sdpram is
  port (
    dpo : out STD_LOGIC_VECTOR ( 7 downto 0 );
    clk : in STD_LOGIC;
    d : in STD_LOGIC_VECTOR ( 7 downto 0 );
    dpra : in STD_LOGIC_VECTOR ( 9 downto 0 );
    a : in STD_LOGIC_VECTOR ( 9 downto 0 );
    we : in STD_LOGIC
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of dist_mem_gen_0_sdpram : entity is "sdpram";
end dist_mem_gen_0_sdpram;

architecture STRUCTURE of dist_mem_gen_0_sdpram is
  signal \^dpo\ : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal \dpo[0]_INST_0_i_1_n_0\ : STD_LOGIC;
  signal \dpo[0]_INST_0_i_2_n_0\ : STD_LOGIC;
  signal \dpo[0]_INST_0_i_3_n_0\ : STD_LOGIC;
  signal \dpo[0]_INST_0_i_4_n_0\ : STD_LOGIC;
  signal \dpo[0]_INST_0_i_5_n_0\ : STD_LOGIC;
  signal \dpo[0]_INST_0_i_6_n_0\ : STD_LOGIC;
  signal \dpo[1]_INST_0_i_1_n_0\ : STD_LOGIC;
  signal \dpo[1]_INST_0_i_2_n_0\ : STD_LOGIC;
  signal \dpo[1]_INST_0_i_3_n_0\ : STD_LOGIC;
  signal \dpo[1]_INST_0_i_4_n_0\ : STD_LOGIC;
  signal \dpo[1]_INST_0_i_5_n_0\ : STD_LOGIC;
  signal \dpo[1]_INST_0_i_6_n_0\ : STD_LOGIC;
  signal \dpo[2]_INST_0_i_1_n_0\ : STD_LOGIC;
  signal \dpo[2]_INST_0_i_2_n_0\ : STD_LOGIC;
  signal \dpo[2]_INST_0_i_3_n_0\ : STD_LOGIC;
  signal \dpo[2]_INST_0_i_4_n_0\ : STD_LOGIC;
  signal \dpo[2]_INST_0_i_5_n_0\ : STD_LOGIC;
  signal \dpo[2]_INST_0_i_6_n_0\ : STD_LOGIC;
  signal \dpo[3]_INST_0_i_1_n_0\ : STD_LOGIC;
  signal \dpo[3]_INST_0_i_2_n_0\ : STD_LOGIC;
  signal \dpo[3]_INST_0_i_3_n_0\ : STD_LOGIC;
  signal \dpo[3]_INST_0_i_4_n_0\ : STD_LOGIC;
  signal \dpo[3]_INST_0_i_5_n_0\ : STD_LOGIC;
  signal \dpo[3]_INST_0_i_6_n_0\ : STD_LOGIC;
  signal \dpo[4]_INST_0_i_1_n_0\ : STD_LOGIC;
  signal \dpo[4]_INST_0_i_2_n_0\ : STD_LOGIC;
  signal \dpo[4]_INST_0_i_3_n_0\ : STD_LOGIC;
  signal \dpo[4]_INST_0_i_4_n_0\ : STD_LOGIC;
  signal \dpo[4]_INST_0_i_5_n_0\ : STD_LOGIC;
  signal \dpo[4]_INST_0_i_6_n_0\ : STD_LOGIC;
  signal \dpo[5]_INST_0_i_1_n_0\ : STD_LOGIC;
  signal \dpo[5]_INST_0_i_2_n_0\ : STD_LOGIC;
  signal \dpo[5]_INST_0_i_3_n_0\ : STD_LOGIC;
  signal \dpo[5]_INST_0_i_4_n_0\ : STD_LOGIC;
  signal \dpo[5]_INST_0_i_5_n_0\ : STD_LOGIC;
  signal \dpo[5]_INST_0_i_6_n_0\ : STD_LOGIC;
  signal \dpo[6]_INST_0_i_1_n_0\ : STD_LOGIC;
  signal \dpo[6]_INST_0_i_2_n_0\ : STD_LOGIC;
  signal \dpo[6]_INST_0_i_3_n_0\ : STD_LOGIC;
  signal \dpo[6]_INST_0_i_4_n_0\ : STD_LOGIC;
  signal \dpo[6]_INST_0_i_5_n_0\ : STD_LOGIC;
  signal \dpo[6]_INST_0_i_6_n_0\ : STD_LOGIC;
  signal \dpo[7]_INST_0_i_1_n_0\ : STD_LOGIC;
  signal \dpo[7]_INST_0_i_2_n_0\ : STD_LOGIC;
  signal \dpo[7]_INST_0_i_3_n_0\ : STD_LOGIC;
  signal \dpo[7]_INST_0_i_4_n_0\ : STD_LOGIC;
  signal \dpo[7]_INST_0_i_5_n_0\ : STD_LOGIC;
  signal \dpo[7]_INST_0_i_6_n_0\ : STD_LOGIC;
  signal qsdpo_int : STD_LOGIC_VECTOR ( 7 downto 0 );
  attribute RTL_KEEP : string;
  attribute RTL_KEEP of qsdpo_int : signal is "true";
  signal ram_reg_0_63_0_2_i_1_n_0 : STD_LOGIC;
  signal ram_reg_0_63_0_2_n_0 : STD_LOGIC;
  signal ram_reg_0_63_0_2_n_1 : STD_LOGIC;
  signal ram_reg_0_63_0_2_n_2 : STD_LOGIC;
  signal ram_reg_0_63_3_5_n_0 : STD_LOGIC;
  signal ram_reg_0_63_3_5_n_1 : STD_LOGIC;
  signal ram_reg_0_63_3_5_n_2 : STD_LOGIC;
  signal ram_reg_0_63_6_6_n_0 : STD_LOGIC;
  signal ram_reg_0_63_7_7_n_0 : STD_LOGIC;
  signal ram_reg_128_191_0_2_i_1_n_0 : STD_LOGIC;
  signal ram_reg_128_191_0_2_n_0 : STD_LOGIC;
  signal ram_reg_128_191_0_2_n_1 : STD_LOGIC;
  signal ram_reg_128_191_0_2_n_2 : STD_LOGIC;
  signal ram_reg_128_191_3_5_n_0 : STD_LOGIC;
  signal ram_reg_128_191_3_5_n_1 : STD_LOGIC;
  signal ram_reg_128_191_3_5_n_2 : STD_LOGIC;
  signal ram_reg_128_191_6_6_n_0 : STD_LOGIC;
  signal ram_reg_128_191_7_7_n_0 : STD_LOGIC;
  signal ram_reg_192_255_0_2_i_1_n_0 : STD_LOGIC;
  signal ram_reg_192_255_0_2_n_0 : STD_LOGIC;
  signal ram_reg_192_255_0_2_n_1 : STD_LOGIC;
  signal ram_reg_192_255_0_2_n_2 : STD_LOGIC;
  signal ram_reg_192_255_3_5_n_0 : STD_LOGIC;
  signal ram_reg_192_255_3_5_n_1 : STD_LOGIC;
  signal ram_reg_192_255_3_5_n_2 : STD_LOGIC;
  signal ram_reg_192_255_6_6_n_0 : STD_LOGIC;
  signal ram_reg_192_255_7_7_n_0 : STD_LOGIC;
  signal ram_reg_256_319_0_2_i_1_n_0 : STD_LOGIC;
  signal ram_reg_256_319_0_2_n_0 : STD_LOGIC;
  signal ram_reg_256_319_0_2_n_1 : STD_LOGIC;
  signal ram_reg_256_319_0_2_n_2 : STD_LOGIC;
  signal ram_reg_256_319_3_5_n_0 : STD_LOGIC;
  signal ram_reg_256_319_3_5_n_1 : STD_LOGIC;
  signal ram_reg_256_319_3_5_n_2 : STD_LOGIC;
  signal ram_reg_256_319_6_6_n_0 : STD_LOGIC;
  signal ram_reg_256_319_7_7_n_0 : STD_LOGIC;
  signal ram_reg_320_383_0_2_i_1_n_0 : STD_LOGIC;
  signal ram_reg_320_383_0_2_n_0 : STD_LOGIC;
  signal ram_reg_320_383_0_2_n_1 : STD_LOGIC;
  signal ram_reg_320_383_0_2_n_2 : STD_LOGIC;
  signal ram_reg_320_383_3_5_n_0 : STD_LOGIC;
  signal ram_reg_320_383_3_5_n_1 : STD_LOGIC;
  signal ram_reg_320_383_3_5_n_2 : STD_LOGIC;
  signal ram_reg_320_383_6_6_n_0 : STD_LOGIC;
  signal ram_reg_320_383_7_7_n_0 : STD_LOGIC;
  signal ram_reg_384_447_0_2_i_1_n_0 : STD_LOGIC;
  signal ram_reg_384_447_0_2_n_0 : STD_LOGIC;
  signal ram_reg_384_447_0_2_n_1 : STD_LOGIC;
  signal ram_reg_384_447_0_2_n_2 : STD_LOGIC;
  signal ram_reg_384_447_3_5_n_0 : STD_LOGIC;
  signal ram_reg_384_447_3_5_n_1 : STD_LOGIC;
  signal ram_reg_384_447_3_5_n_2 : STD_LOGIC;
  signal ram_reg_384_447_6_6_n_0 : STD_LOGIC;
  signal ram_reg_384_447_7_7_n_0 : STD_LOGIC;
  signal ram_reg_448_511_0_2_i_1_n_0 : STD_LOGIC;
  signal ram_reg_448_511_0_2_n_0 : STD_LOGIC;
  signal ram_reg_448_511_0_2_n_1 : STD_LOGIC;
  signal ram_reg_448_511_0_2_n_2 : STD_LOGIC;
  signal ram_reg_448_511_3_5_n_0 : STD_LOGIC;
  signal ram_reg_448_511_3_5_n_1 : STD_LOGIC;
  signal ram_reg_448_511_3_5_n_2 : STD_LOGIC;
  signal ram_reg_448_511_6_6_n_0 : STD_LOGIC;
  signal ram_reg_448_511_7_7_n_0 : STD_LOGIC;
  signal ram_reg_512_575_0_2_i_1_n_0 : STD_LOGIC;
  signal ram_reg_512_575_0_2_n_0 : STD_LOGIC;
  signal ram_reg_512_575_0_2_n_1 : STD_LOGIC;
  signal ram_reg_512_575_0_2_n_2 : STD_LOGIC;
  signal ram_reg_512_575_3_5_n_0 : STD_LOGIC;
  signal ram_reg_512_575_3_5_n_1 : STD_LOGIC;
  signal ram_reg_512_575_3_5_n_2 : STD_LOGIC;
  signal ram_reg_512_575_6_6_n_0 : STD_LOGIC;
  signal ram_reg_512_575_7_7_n_0 : STD_LOGIC;
  signal ram_reg_576_639_0_2_i_1_n_0 : STD_LOGIC;
  signal ram_reg_576_639_0_2_n_0 : STD_LOGIC;
  signal ram_reg_576_639_0_2_n_1 : STD_LOGIC;
  signal ram_reg_576_639_0_2_n_2 : STD_LOGIC;
  signal ram_reg_576_639_3_5_n_0 : STD_LOGIC;
  signal ram_reg_576_639_3_5_n_1 : STD_LOGIC;
  signal ram_reg_576_639_3_5_n_2 : STD_LOGIC;
  signal ram_reg_576_639_6_6_n_0 : STD_LOGIC;
  signal ram_reg_576_639_7_7_n_0 : STD_LOGIC;
  signal ram_reg_640_703_0_2_i_1_n_0 : STD_LOGIC;
  signal ram_reg_640_703_0_2_n_0 : STD_LOGIC;
  signal ram_reg_640_703_0_2_n_1 : STD_LOGIC;
  signal ram_reg_640_703_0_2_n_2 : STD_LOGIC;
  signal ram_reg_640_703_3_5_n_0 : STD_LOGIC;
  signal ram_reg_640_703_3_5_n_1 : STD_LOGIC;
  signal ram_reg_640_703_3_5_n_2 : STD_LOGIC;
  signal ram_reg_640_703_6_6_n_0 : STD_LOGIC;
  signal ram_reg_640_703_7_7_n_0 : STD_LOGIC;
  signal ram_reg_64_127_0_2_i_1_n_0 : STD_LOGIC;
  signal ram_reg_64_127_0_2_n_0 : STD_LOGIC;
  signal ram_reg_64_127_0_2_n_1 : STD_LOGIC;
  signal ram_reg_64_127_0_2_n_2 : STD_LOGIC;
  signal ram_reg_64_127_3_5_n_0 : STD_LOGIC;
  signal ram_reg_64_127_3_5_n_1 : STD_LOGIC;
  signal ram_reg_64_127_3_5_n_2 : STD_LOGIC;
  signal ram_reg_64_127_6_6_n_0 : STD_LOGIC;
  signal ram_reg_64_127_7_7_n_0 : STD_LOGIC;
  signal ram_reg_704_767_0_2_i_1_n_0 : STD_LOGIC;
  signal ram_reg_704_767_0_2_n_0 : STD_LOGIC;
  signal ram_reg_704_767_0_2_n_1 : STD_LOGIC;
  signal ram_reg_704_767_0_2_n_2 : STD_LOGIC;
  signal ram_reg_704_767_3_5_n_0 : STD_LOGIC;
  signal ram_reg_704_767_3_5_n_1 : STD_LOGIC;
  signal ram_reg_704_767_3_5_n_2 : STD_LOGIC;
  signal ram_reg_704_767_6_6_n_0 : STD_LOGIC;
  signal ram_reg_704_767_7_7_n_0 : STD_LOGIC;
  signal ram_reg_768_831_0_2_i_1_n_0 : STD_LOGIC;
  signal ram_reg_768_831_0_2_n_0 : STD_LOGIC;
  signal ram_reg_768_831_0_2_n_1 : STD_LOGIC;
  signal ram_reg_768_831_0_2_n_2 : STD_LOGIC;
  signal ram_reg_768_831_3_5_n_0 : STD_LOGIC;
  signal ram_reg_768_831_3_5_n_1 : STD_LOGIC;
  signal ram_reg_768_831_3_5_n_2 : STD_LOGIC;
  signal ram_reg_768_831_6_6_n_0 : STD_LOGIC;
  signal ram_reg_768_831_7_7_n_0 : STD_LOGIC;
  signal ram_reg_832_895_0_2_i_1_n_0 : STD_LOGIC;
  signal ram_reg_832_895_0_2_n_0 : STD_LOGIC;
  signal ram_reg_832_895_0_2_n_1 : STD_LOGIC;
  signal ram_reg_832_895_0_2_n_2 : STD_LOGIC;
  signal ram_reg_832_895_3_5_n_0 : STD_LOGIC;
  signal ram_reg_832_895_3_5_n_1 : STD_LOGIC;
  signal ram_reg_832_895_3_5_n_2 : STD_LOGIC;
  signal ram_reg_832_895_6_6_n_0 : STD_LOGIC;
  signal ram_reg_832_895_7_7_n_0 : STD_LOGIC;
  signal ram_reg_896_959_0_2_i_1_n_0 : STD_LOGIC;
  signal ram_reg_896_959_0_2_n_0 : STD_LOGIC;
  signal ram_reg_896_959_0_2_n_1 : STD_LOGIC;
  signal ram_reg_896_959_0_2_n_2 : STD_LOGIC;
  signal ram_reg_896_959_3_5_n_0 : STD_LOGIC;
  signal ram_reg_896_959_3_5_n_1 : STD_LOGIC;
  signal ram_reg_896_959_3_5_n_2 : STD_LOGIC;
  signal ram_reg_896_959_6_6_n_0 : STD_LOGIC;
  signal ram_reg_896_959_7_7_n_0 : STD_LOGIC;
  signal ram_reg_960_1023_0_2_i_1_n_0 : STD_LOGIC;
  signal ram_reg_960_1023_0_2_n_0 : STD_LOGIC;
  signal ram_reg_960_1023_0_2_n_1 : STD_LOGIC;
  signal ram_reg_960_1023_0_2_n_2 : STD_LOGIC;
  signal ram_reg_960_1023_3_5_n_0 : STD_LOGIC;
  signal ram_reg_960_1023_3_5_n_1 : STD_LOGIC;
  signal ram_reg_960_1023_3_5_n_2 : STD_LOGIC;
  signal ram_reg_960_1023_6_6_n_0 : STD_LOGIC;
  signal ram_reg_960_1023_7_7_n_0 : STD_LOGIC;
  signal NLW_ram_reg_0_63_0_2_DOD_UNCONNECTED : STD_LOGIC;
  signal NLW_ram_reg_0_63_3_5_DOD_UNCONNECTED : STD_LOGIC;
  signal NLW_ram_reg_0_63_6_6_SPO_UNCONNECTED : STD_LOGIC;
  signal NLW_ram_reg_0_63_7_7_SPO_UNCONNECTED : STD_LOGIC;
  signal NLW_ram_reg_128_191_0_2_DOD_UNCONNECTED : STD_LOGIC;
  signal NLW_ram_reg_128_191_3_5_DOD_UNCONNECTED : STD_LOGIC;
  signal NLW_ram_reg_128_191_6_6_SPO_UNCONNECTED : STD_LOGIC;
  signal NLW_ram_reg_128_191_7_7_SPO_UNCONNECTED : STD_LOGIC;
  signal NLW_ram_reg_192_255_0_2_DOD_UNCONNECTED : STD_LOGIC;
  signal NLW_ram_reg_192_255_3_5_DOD_UNCONNECTED : STD_LOGIC;
  signal NLW_ram_reg_192_255_6_6_SPO_UNCONNECTED : STD_LOGIC;
  signal NLW_ram_reg_192_255_7_7_SPO_UNCONNECTED : STD_LOGIC;
  signal NLW_ram_reg_256_319_0_2_DOD_UNCONNECTED : STD_LOGIC;
  signal NLW_ram_reg_256_319_3_5_DOD_UNCONNECTED : STD_LOGIC;
  signal NLW_ram_reg_256_319_6_6_SPO_UNCONNECTED : STD_LOGIC;
  signal NLW_ram_reg_256_319_7_7_SPO_UNCONNECTED : STD_LOGIC;
  signal NLW_ram_reg_320_383_0_2_DOD_UNCONNECTED : STD_LOGIC;
  signal NLW_ram_reg_320_383_3_5_DOD_UNCONNECTED : STD_LOGIC;
  signal NLW_ram_reg_320_383_6_6_SPO_UNCONNECTED : STD_LOGIC;
  signal NLW_ram_reg_320_383_7_7_SPO_UNCONNECTED : STD_LOGIC;
  signal NLW_ram_reg_384_447_0_2_DOD_UNCONNECTED : STD_LOGIC;
  signal NLW_ram_reg_384_447_3_5_DOD_UNCONNECTED : STD_LOGIC;
  signal NLW_ram_reg_384_447_6_6_SPO_UNCONNECTED : STD_LOGIC;
  signal NLW_ram_reg_384_447_7_7_SPO_UNCONNECTED : STD_LOGIC;
  signal NLW_ram_reg_448_511_0_2_DOD_UNCONNECTED : STD_LOGIC;
  signal NLW_ram_reg_448_511_3_5_DOD_UNCONNECTED : STD_LOGIC;
  signal NLW_ram_reg_448_511_6_6_SPO_UNCONNECTED : STD_LOGIC;
  signal NLW_ram_reg_448_511_7_7_SPO_UNCONNECTED : STD_LOGIC;
  signal NLW_ram_reg_512_575_0_2_DOD_UNCONNECTED : STD_LOGIC;
  signal NLW_ram_reg_512_575_3_5_DOD_UNCONNECTED : STD_LOGIC;
  signal NLW_ram_reg_512_575_6_6_SPO_UNCONNECTED : STD_LOGIC;
  signal NLW_ram_reg_512_575_7_7_SPO_UNCONNECTED : STD_LOGIC;
  signal NLW_ram_reg_576_639_0_2_DOD_UNCONNECTED : STD_LOGIC;
  signal NLW_ram_reg_576_639_3_5_DOD_UNCONNECTED : STD_LOGIC;
  signal NLW_ram_reg_576_639_6_6_SPO_UNCONNECTED : STD_LOGIC;
  signal NLW_ram_reg_576_639_7_7_SPO_UNCONNECTED : STD_LOGIC;
  signal NLW_ram_reg_640_703_0_2_DOD_UNCONNECTED : STD_LOGIC;
  signal NLW_ram_reg_640_703_3_5_DOD_UNCONNECTED : STD_LOGIC;
  signal NLW_ram_reg_640_703_6_6_SPO_UNCONNECTED : STD_LOGIC;
  signal NLW_ram_reg_640_703_7_7_SPO_UNCONNECTED : STD_LOGIC;
  signal NLW_ram_reg_64_127_0_2_DOD_UNCONNECTED : STD_LOGIC;
  signal NLW_ram_reg_64_127_3_5_DOD_UNCONNECTED : STD_LOGIC;
  signal NLW_ram_reg_64_127_6_6_SPO_UNCONNECTED : STD_LOGIC;
  signal NLW_ram_reg_64_127_7_7_SPO_UNCONNECTED : STD_LOGIC;
  signal NLW_ram_reg_704_767_0_2_DOD_UNCONNECTED : STD_LOGIC;
  signal NLW_ram_reg_704_767_3_5_DOD_UNCONNECTED : STD_LOGIC;
  signal NLW_ram_reg_704_767_6_6_SPO_UNCONNECTED : STD_LOGIC;
  signal NLW_ram_reg_704_767_7_7_SPO_UNCONNECTED : STD_LOGIC;
  signal NLW_ram_reg_768_831_0_2_DOD_UNCONNECTED : STD_LOGIC;
  signal NLW_ram_reg_768_831_3_5_DOD_UNCONNECTED : STD_LOGIC;
  signal NLW_ram_reg_768_831_6_6_SPO_UNCONNECTED : STD_LOGIC;
  signal NLW_ram_reg_768_831_7_7_SPO_UNCONNECTED : STD_LOGIC;
  signal NLW_ram_reg_832_895_0_2_DOD_UNCONNECTED : STD_LOGIC;
  signal NLW_ram_reg_832_895_3_5_DOD_UNCONNECTED : STD_LOGIC;
  signal NLW_ram_reg_832_895_6_6_SPO_UNCONNECTED : STD_LOGIC;
  signal NLW_ram_reg_832_895_7_7_SPO_UNCONNECTED : STD_LOGIC;
  signal NLW_ram_reg_896_959_0_2_DOD_UNCONNECTED : STD_LOGIC;
  signal NLW_ram_reg_896_959_3_5_DOD_UNCONNECTED : STD_LOGIC;
  signal NLW_ram_reg_896_959_6_6_SPO_UNCONNECTED : STD_LOGIC;
  signal NLW_ram_reg_896_959_7_7_SPO_UNCONNECTED : STD_LOGIC;
  signal NLW_ram_reg_960_1023_0_2_DOD_UNCONNECTED : STD_LOGIC;
  signal NLW_ram_reg_960_1023_3_5_DOD_UNCONNECTED : STD_LOGIC;
  signal NLW_ram_reg_960_1023_6_6_SPO_UNCONNECTED : STD_LOGIC;
  signal NLW_ram_reg_960_1023_7_7_SPO_UNCONNECTED : STD_LOGIC;
  attribute KEEP : string;
  attribute KEEP of \qsdpo_int_reg[0]\ : label is "yes";
  attribute equivalent_register_removal : string;
  attribute equivalent_register_removal of \qsdpo_int_reg[0]\ : label is "no";
  attribute KEEP of \qsdpo_int_reg[1]\ : label is "yes";
  attribute equivalent_register_removal of \qsdpo_int_reg[1]\ : label is "no";
  attribute KEEP of \qsdpo_int_reg[2]\ : label is "yes";
  attribute equivalent_register_removal of \qsdpo_int_reg[2]\ : label is "no";
  attribute KEEP of \qsdpo_int_reg[3]\ : label is "yes";
  attribute equivalent_register_removal of \qsdpo_int_reg[3]\ : label is "no";
  attribute KEEP of \qsdpo_int_reg[4]\ : label is "yes";
  attribute equivalent_register_removal of \qsdpo_int_reg[4]\ : label is "no";
  attribute KEEP of \qsdpo_int_reg[5]\ : label is "yes";
  attribute equivalent_register_removal of \qsdpo_int_reg[5]\ : label is "no";
  attribute KEEP of \qsdpo_int_reg[6]\ : label is "yes";
  attribute equivalent_register_removal of \qsdpo_int_reg[6]\ : label is "no";
  attribute KEEP of \qsdpo_int_reg[7]\ : label is "yes";
  attribute equivalent_register_removal of \qsdpo_int_reg[7]\ : label is "no";
  attribute METHODOLOGY_DRC_VIOS : string;
  attribute METHODOLOGY_DRC_VIOS of ram_reg_0_63_0_2 : label is "";
  attribute METHODOLOGY_DRC_VIOS of ram_reg_0_63_3_5 : label is "";
  attribute METHODOLOGY_DRC_VIOS of ram_reg_128_191_0_2 : label is "";
  attribute METHODOLOGY_DRC_VIOS of ram_reg_128_191_3_5 : label is "";
  attribute METHODOLOGY_DRC_VIOS of ram_reg_192_255_0_2 : label is "";
  attribute METHODOLOGY_DRC_VIOS of ram_reg_192_255_3_5 : label is "";
  attribute METHODOLOGY_DRC_VIOS of ram_reg_256_319_0_2 : label is "";
  attribute METHODOLOGY_DRC_VIOS of ram_reg_256_319_3_5 : label is "";
  attribute METHODOLOGY_DRC_VIOS of ram_reg_320_383_0_2 : label is "";
  attribute METHODOLOGY_DRC_VIOS of ram_reg_320_383_3_5 : label is "";
  attribute METHODOLOGY_DRC_VIOS of ram_reg_384_447_0_2 : label is "";
  attribute METHODOLOGY_DRC_VIOS of ram_reg_384_447_3_5 : label is "";
  attribute METHODOLOGY_DRC_VIOS of ram_reg_448_511_0_2 : label is "";
  attribute METHODOLOGY_DRC_VIOS of ram_reg_448_511_3_5 : label is "";
  attribute METHODOLOGY_DRC_VIOS of ram_reg_512_575_0_2 : label is "";
  attribute METHODOLOGY_DRC_VIOS of ram_reg_512_575_3_5 : label is "";
  attribute METHODOLOGY_DRC_VIOS of ram_reg_576_639_0_2 : label is "";
  attribute METHODOLOGY_DRC_VIOS of ram_reg_576_639_3_5 : label is "";
  attribute METHODOLOGY_DRC_VIOS of ram_reg_640_703_0_2 : label is "";
  attribute METHODOLOGY_DRC_VIOS of ram_reg_640_703_3_5 : label is "";
  attribute METHODOLOGY_DRC_VIOS of ram_reg_64_127_0_2 : label is "";
  attribute METHODOLOGY_DRC_VIOS of ram_reg_64_127_3_5 : label is "";
  attribute METHODOLOGY_DRC_VIOS of ram_reg_704_767_0_2 : label is "";
  attribute METHODOLOGY_DRC_VIOS of ram_reg_704_767_3_5 : label is "";
  attribute METHODOLOGY_DRC_VIOS of ram_reg_768_831_0_2 : label is "";
  attribute METHODOLOGY_DRC_VIOS of ram_reg_768_831_3_5 : label is "";
  attribute METHODOLOGY_DRC_VIOS of ram_reg_832_895_0_2 : label is "";
  attribute METHODOLOGY_DRC_VIOS of ram_reg_832_895_3_5 : label is "";
  attribute METHODOLOGY_DRC_VIOS of ram_reg_896_959_0_2 : label is "";
  attribute METHODOLOGY_DRC_VIOS of ram_reg_896_959_3_5 : label is "";
  attribute METHODOLOGY_DRC_VIOS of ram_reg_960_1023_0_2 : label is "";
  attribute METHODOLOGY_DRC_VIOS of ram_reg_960_1023_3_5 : label is "";
begin
  dpo(7 downto 0) <= \^dpo\(7 downto 0);
\dpo[0]_INST_0\: unisim.vcomponents.MUXF8
     port map (
      I0 => \dpo[0]_INST_0_i_1_n_0\,
      I1 => \dpo[0]_INST_0_i_2_n_0\,
      O => \^dpo\(0),
      S => dpra(9)
    );
\dpo[0]_INST_0_i_1\: unisim.vcomponents.MUXF7
     port map (
      I0 => \dpo[0]_INST_0_i_3_n_0\,
      I1 => \dpo[0]_INST_0_i_4_n_0\,
      O => \dpo[0]_INST_0_i_1_n_0\,
      S => dpra(8)
    );
\dpo[0]_INST_0_i_2\: unisim.vcomponents.MUXF7
     port map (
      I0 => \dpo[0]_INST_0_i_5_n_0\,
      I1 => \dpo[0]_INST_0_i_6_n_0\,
      O => \dpo[0]_INST_0_i_2_n_0\,
      S => dpra(8)
    );
\dpo[0]_INST_0_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => ram_reg_192_255_0_2_n_0,
      I1 => ram_reg_128_191_0_2_n_0,
      I2 => dpra(7),
      I3 => ram_reg_64_127_0_2_n_0,
      I4 => dpra(6),
      I5 => ram_reg_0_63_0_2_n_0,
      O => \dpo[0]_INST_0_i_3_n_0\
    );
\dpo[0]_INST_0_i_4\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => ram_reg_448_511_0_2_n_0,
      I1 => ram_reg_384_447_0_2_n_0,
      I2 => dpra(7),
      I3 => ram_reg_320_383_0_2_n_0,
      I4 => dpra(6),
      I5 => ram_reg_256_319_0_2_n_0,
      O => \dpo[0]_INST_0_i_4_n_0\
    );
\dpo[0]_INST_0_i_5\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => ram_reg_704_767_0_2_n_0,
      I1 => ram_reg_640_703_0_2_n_0,
      I2 => dpra(7),
      I3 => ram_reg_576_639_0_2_n_0,
      I4 => dpra(6),
      I5 => ram_reg_512_575_0_2_n_0,
      O => \dpo[0]_INST_0_i_5_n_0\
    );
\dpo[0]_INST_0_i_6\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => ram_reg_960_1023_0_2_n_0,
      I1 => ram_reg_896_959_0_2_n_0,
      I2 => dpra(7),
      I3 => ram_reg_832_895_0_2_n_0,
      I4 => dpra(6),
      I5 => ram_reg_768_831_0_2_n_0,
      O => \dpo[0]_INST_0_i_6_n_0\
    );
\dpo[1]_INST_0\: unisim.vcomponents.MUXF8
     port map (
      I0 => \dpo[1]_INST_0_i_1_n_0\,
      I1 => \dpo[1]_INST_0_i_2_n_0\,
      O => \^dpo\(1),
      S => dpra(9)
    );
\dpo[1]_INST_0_i_1\: unisim.vcomponents.MUXF7
     port map (
      I0 => \dpo[1]_INST_0_i_3_n_0\,
      I1 => \dpo[1]_INST_0_i_4_n_0\,
      O => \dpo[1]_INST_0_i_1_n_0\,
      S => dpra(8)
    );
\dpo[1]_INST_0_i_2\: unisim.vcomponents.MUXF7
     port map (
      I0 => \dpo[1]_INST_0_i_5_n_0\,
      I1 => \dpo[1]_INST_0_i_6_n_0\,
      O => \dpo[1]_INST_0_i_2_n_0\,
      S => dpra(8)
    );
\dpo[1]_INST_0_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => ram_reg_192_255_0_2_n_1,
      I1 => ram_reg_128_191_0_2_n_1,
      I2 => dpra(7),
      I3 => ram_reg_64_127_0_2_n_1,
      I4 => dpra(6),
      I5 => ram_reg_0_63_0_2_n_1,
      O => \dpo[1]_INST_0_i_3_n_0\
    );
\dpo[1]_INST_0_i_4\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => ram_reg_448_511_0_2_n_1,
      I1 => ram_reg_384_447_0_2_n_1,
      I2 => dpra(7),
      I3 => ram_reg_320_383_0_2_n_1,
      I4 => dpra(6),
      I5 => ram_reg_256_319_0_2_n_1,
      O => \dpo[1]_INST_0_i_4_n_0\
    );
\dpo[1]_INST_0_i_5\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => ram_reg_704_767_0_2_n_1,
      I1 => ram_reg_640_703_0_2_n_1,
      I2 => dpra(7),
      I3 => ram_reg_576_639_0_2_n_1,
      I4 => dpra(6),
      I5 => ram_reg_512_575_0_2_n_1,
      O => \dpo[1]_INST_0_i_5_n_0\
    );
\dpo[1]_INST_0_i_6\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => ram_reg_960_1023_0_2_n_1,
      I1 => ram_reg_896_959_0_2_n_1,
      I2 => dpra(7),
      I3 => ram_reg_832_895_0_2_n_1,
      I4 => dpra(6),
      I5 => ram_reg_768_831_0_2_n_1,
      O => \dpo[1]_INST_0_i_6_n_0\
    );
\dpo[2]_INST_0\: unisim.vcomponents.MUXF8
     port map (
      I0 => \dpo[2]_INST_0_i_1_n_0\,
      I1 => \dpo[2]_INST_0_i_2_n_0\,
      O => \^dpo\(2),
      S => dpra(9)
    );
\dpo[2]_INST_0_i_1\: unisim.vcomponents.MUXF7
     port map (
      I0 => \dpo[2]_INST_0_i_3_n_0\,
      I1 => \dpo[2]_INST_0_i_4_n_0\,
      O => \dpo[2]_INST_0_i_1_n_0\,
      S => dpra(8)
    );
\dpo[2]_INST_0_i_2\: unisim.vcomponents.MUXF7
     port map (
      I0 => \dpo[2]_INST_0_i_5_n_0\,
      I1 => \dpo[2]_INST_0_i_6_n_0\,
      O => \dpo[2]_INST_0_i_2_n_0\,
      S => dpra(8)
    );
\dpo[2]_INST_0_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => ram_reg_192_255_0_2_n_2,
      I1 => ram_reg_128_191_0_2_n_2,
      I2 => dpra(7),
      I3 => ram_reg_64_127_0_2_n_2,
      I4 => dpra(6),
      I5 => ram_reg_0_63_0_2_n_2,
      O => \dpo[2]_INST_0_i_3_n_0\
    );
\dpo[2]_INST_0_i_4\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => ram_reg_448_511_0_2_n_2,
      I1 => ram_reg_384_447_0_2_n_2,
      I2 => dpra(7),
      I3 => ram_reg_320_383_0_2_n_2,
      I4 => dpra(6),
      I5 => ram_reg_256_319_0_2_n_2,
      O => \dpo[2]_INST_0_i_4_n_0\
    );
\dpo[2]_INST_0_i_5\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => ram_reg_704_767_0_2_n_2,
      I1 => ram_reg_640_703_0_2_n_2,
      I2 => dpra(7),
      I3 => ram_reg_576_639_0_2_n_2,
      I4 => dpra(6),
      I5 => ram_reg_512_575_0_2_n_2,
      O => \dpo[2]_INST_0_i_5_n_0\
    );
\dpo[2]_INST_0_i_6\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => ram_reg_960_1023_0_2_n_2,
      I1 => ram_reg_896_959_0_2_n_2,
      I2 => dpra(7),
      I3 => ram_reg_832_895_0_2_n_2,
      I4 => dpra(6),
      I5 => ram_reg_768_831_0_2_n_2,
      O => \dpo[2]_INST_0_i_6_n_0\
    );
\dpo[3]_INST_0\: unisim.vcomponents.MUXF8
     port map (
      I0 => \dpo[3]_INST_0_i_1_n_0\,
      I1 => \dpo[3]_INST_0_i_2_n_0\,
      O => \^dpo\(3),
      S => dpra(9)
    );
\dpo[3]_INST_0_i_1\: unisim.vcomponents.MUXF7
     port map (
      I0 => \dpo[3]_INST_0_i_3_n_0\,
      I1 => \dpo[3]_INST_0_i_4_n_0\,
      O => \dpo[3]_INST_0_i_1_n_0\,
      S => dpra(8)
    );
\dpo[3]_INST_0_i_2\: unisim.vcomponents.MUXF7
     port map (
      I0 => \dpo[3]_INST_0_i_5_n_0\,
      I1 => \dpo[3]_INST_0_i_6_n_0\,
      O => \dpo[3]_INST_0_i_2_n_0\,
      S => dpra(8)
    );
\dpo[3]_INST_0_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => ram_reg_192_255_3_5_n_0,
      I1 => ram_reg_128_191_3_5_n_0,
      I2 => dpra(7),
      I3 => ram_reg_64_127_3_5_n_0,
      I4 => dpra(6),
      I5 => ram_reg_0_63_3_5_n_0,
      O => \dpo[3]_INST_0_i_3_n_0\
    );
\dpo[3]_INST_0_i_4\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => ram_reg_448_511_3_5_n_0,
      I1 => ram_reg_384_447_3_5_n_0,
      I2 => dpra(7),
      I3 => ram_reg_320_383_3_5_n_0,
      I4 => dpra(6),
      I5 => ram_reg_256_319_3_5_n_0,
      O => \dpo[3]_INST_0_i_4_n_0\
    );
\dpo[3]_INST_0_i_5\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => ram_reg_704_767_3_5_n_0,
      I1 => ram_reg_640_703_3_5_n_0,
      I2 => dpra(7),
      I3 => ram_reg_576_639_3_5_n_0,
      I4 => dpra(6),
      I5 => ram_reg_512_575_3_5_n_0,
      O => \dpo[3]_INST_0_i_5_n_0\
    );
\dpo[3]_INST_0_i_6\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => ram_reg_960_1023_3_5_n_0,
      I1 => ram_reg_896_959_3_5_n_0,
      I2 => dpra(7),
      I3 => ram_reg_832_895_3_5_n_0,
      I4 => dpra(6),
      I5 => ram_reg_768_831_3_5_n_0,
      O => \dpo[3]_INST_0_i_6_n_0\
    );
\dpo[4]_INST_0\: unisim.vcomponents.MUXF8
     port map (
      I0 => \dpo[4]_INST_0_i_1_n_0\,
      I1 => \dpo[4]_INST_0_i_2_n_0\,
      O => \^dpo\(4),
      S => dpra(9)
    );
\dpo[4]_INST_0_i_1\: unisim.vcomponents.MUXF7
     port map (
      I0 => \dpo[4]_INST_0_i_3_n_0\,
      I1 => \dpo[4]_INST_0_i_4_n_0\,
      O => \dpo[4]_INST_0_i_1_n_0\,
      S => dpra(8)
    );
\dpo[4]_INST_0_i_2\: unisim.vcomponents.MUXF7
     port map (
      I0 => \dpo[4]_INST_0_i_5_n_0\,
      I1 => \dpo[4]_INST_0_i_6_n_0\,
      O => \dpo[4]_INST_0_i_2_n_0\,
      S => dpra(8)
    );
\dpo[4]_INST_0_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => ram_reg_192_255_3_5_n_1,
      I1 => ram_reg_128_191_3_5_n_1,
      I2 => dpra(7),
      I3 => ram_reg_64_127_3_5_n_1,
      I4 => dpra(6),
      I5 => ram_reg_0_63_3_5_n_1,
      O => \dpo[4]_INST_0_i_3_n_0\
    );
\dpo[4]_INST_0_i_4\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => ram_reg_448_511_3_5_n_1,
      I1 => ram_reg_384_447_3_5_n_1,
      I2 => dpra(7),
      I3 => ram_reg_320_383_3_5_n_1,
      I4 => dpra(6),
      I5 => ram_reg_256_319_3_5_n_1,
      O => \dpo[4]_INST_0_i_4_n_0\
    );
\dpo[4]_INST_0_i_5\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => ram_reg_704_767_3_5_n_1,
      I1 => ram_reg_640_703_3_5_n_1,
      I2 => dpra(7),
      I3 => ram_reg_576_639_3_5_n_1,
      I4 => dpra(6),
      I5 => ram_reg_512_575_3_5_n_1,
      O => \dpo[4]_INST_0_i_5_n_0\
    );
\dpo[4]_INST_0_i_6\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => ram_reg_960_1023_3_5_n_1,
      I1 => ram_reg_896_959_3_5_n_1,
      I2 => dpra(7),
      I3 => ram_reg_832_895_3_5_n_1,
      I4 => dpra(6),
      I5 => ram_reg_768_831_3_5_n_1,
      O => \dpo[4]_INST_0_i_6_n_0\
    );
\dpo[5]_INST_0\: unisim.vcomponents.MUXF8
     port map (
      I0 => \dpo[5]_INST_0_i_1_n_0\,
      I1 => \dpo[5]_INST_0_i_2_n_0\,
      O => \^dpo\(5),
      S => dpra(9)
    );
\dpo[5]_INST_0_i_1\: unisim.vcomponents.MUXF7
     port map (
      I0 => \dpo[5]_INST_0_i_3_n_0\,
      I1 => \dpo[5]_INST_0_i_4_n_0\,
      O => \dpo[5]_INST_0_i_1_n_0\,
      S => dpra(8)
    );
\dpo[5]_INST_0_i_2\: unisim.vcomponents.MUXF7
     port map (
      I0 => \dpo[5]_INST_0_i_5_n_0\,
      I1 => \dpo[5]_INST_0_i_6_n_0\,
      O => \dpo[5]_INST_0_i_2_n_0\,
      S => dpra(8)
    );
\dpo[5]_INST_0_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => ram_reg_192_255_3_5_n_2,
      I1 => ram_reg_128_191_3_5_n_2,
      I2 => dpra(7),
      I3 => ram_reg_64_127_3_5_n_2,
      I4 => dpra(6),
      I5 => ram_reg_0_63_3_5_n_2,
      O => \dpo[5]_INST_0_i_3_n_0\
    );
\dpo[5]_INST_0_i_4\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => ram_reg_448_511_3_5_n_2,
      I1 => ram_reg_384_447_3_5_n_2,
      I2 => dpra(7),
      I3 => ram_reg_320_383_3_5_n_2,
      I4 => dpra(6),
      I5 => ram_reg_256_319_3_5_n_2,
      O => \dpo[5]_INST_0_i_4_n_0\
    );
\dpo[5]_INST_0_i_5\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => ram_reg_704_767_3_5_n_2,
      I1 => ram_reg_640_703_3_5_n_2,
      I2 => dpra(7),
      I3 => ram_reg_576_639_3_5_n_2,
      I4 => dpra(6),
      I5 => ram_reg_512_575_3_5_n_2,
      O => \dpo[5]_INST_0_i_5_n_0\
    );
\dpo[5]_INST_0_i_6\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => ram_reg_960_1023_3_5_n_2,
      I1 => ram_reg_896_959_3_5_n_2,
      I2 => dpra(7),
      I3 => ram_reg_832_895_3_5_n_2,
      I4 => dpra(6),
      I5 => ram_reg_768_831_3_5_n_2,
      O => \dpo[5]_INST_0_i_6_n_0\
    );
\dpo[6]_INST_0\: unisim.vcomponents.MUXF8
     port map (
      I0 => \dpo[6]_INST_0_i_1_n_0\,
      I1 => \dpo[6]_INST_0_i_2_n_0\,
      O => \^dpo\(6),
      S => dpra(9)
    );
\dpo[6]_INST_0_i_1\: unisim.vcomponents.MUXF7
     port map (
      I0 => \dpo[6]_INST_0_i_3_n_0\,
      I1 => \dpo[6]_INST_0_i_4_n_0\,
      O => \dpo[6]_INST_0_i_1_n_0\,
      S => dpra(8)
    );
\dpo[6]_INST_0_i_2\: unisim.vcomponents.MUXF7
     port map (
      I0 => \dpo[6]_INST_0_i_5_n_0\,
      I1 => \dpo[6]_INST_0_i_6_n_0\,
      O => \dpo[6]_INST_0_i_2_n_0\,
      S => dpra(8)
    );
\dpo[6]_INST_0_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => ram_reg_192_255_6_6_n_0,
      I1 => ram_reg_128_191_6_6_n_0,
      I2 => dpra(7),
      I3 => ram_reg_64_127_6_6_n_0,
      I4 => dpra(6),
      I5 => ram_reg_0_63_6_6_n_0,
      O => \dpo[6]_INST_0_i_3_n_0\
    );
\dpo[6]_INST_0_i_4\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => ram_reg_448_511_6_6_n_0,
      I1 => ram_reg_384_447_6_6_n_0,
      I2 => dpra(7),
      I3 => ram_reg_320_383_6_6_n_0,
      I4 => dpra(6),
      I5 => ram_reg_256_319_6_6_n_0,
      O => \dpo[6]_INST_0_i_4_n_0\
    );
\dpo[6]_INST_0_i_5\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => ram_reg_704_767_6_6_n_0,
      I1 => ram_reg_640_703_6_6_n_0,
      I2 => dpra(7),
      I3 => ram_reg_576_639_6_6_n_0,
      I4 => dpra(6),
      I5 => ram_reg_512_575_6_6_n_0,
      O => \dpo[6]_INST_0_i_5_n_0\
    );
\dpo[6]_INST_0_i_6\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => ram_reg_960_1023_6_6_n_0,
      I1 => ram_reg_896_959_6_6_n_0,
      I2 => dpra(7),
      I3 => ram_reg_832_895_6_6_n_0,
      I4 => dpra(6),
      I5 => ram_reg_768_831_6_6_n_0,
      O => \dpo[6]_INST_0_i_6_n_0\
    );
\dpo[7]_INST_0\: unisim.vcomponents.MUXF8
     port map (
      I0 => \dpo[7]_INST_0_i_1_n_0\,
      I1 => \dpo[7]_INST_0_i_2_n_0\,
      O => \^dpo\(7),
      S => dpra(9)
    );
\dpo[7]_INST_0_i_1\: unisim.vcomponents.MUXF7
     port map (
      I0 => \dpo[7]_INST_0_i_3_n_0\,
      I1 => \dpo[7]_INST_0_i_4_n_0\,
      O => \dpo[7]_INST_0_i_1_n_0\,
      S => dpra(8)
    );
\dpo[7]_INST_0_i_2\: unisim.vcomponents.MUXF7
     port map (
      I0 => \dpo[7]_INST_0_i_5_n_0\,
      I1 => \dpo[7]_INST_0_i_6_n_0\,
      O => \dpo[7]_INST_0_i_2_n_0\,
      S => dpra(8)
    );
\dpo[7]_INST_0_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => ram_reg_192_255_7_7_n_0,
      I1 => ram_reg_128_191_7_7_n_0,
      I2 => dpra(7),
      I3 => ram_reg_64_127_7_7_n_0,
      I4 => dpra(6),
      I5 => ram_reg_0_63_7_7_n_0,
      O => \dpo[7]_INST_0_i_3_n_0\
    );
\dpo[7]_INST_0_i_4\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => ram_reg_448_511_7_7_n_0,
      I1 => ram_reg_384_447_7_7_n_0,
      I2 => dpra(7),
      I3 => ram_reg_320_383_7_7_n_0,
      I4 => dpra(6),
      I5 => ram_reg_256_319_7_7_n_0,
      O => \dpo[7]_INST_0_i_4_n_0\
    );
\dpo[7]_INST_0_i_5\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => ram_reg_704_767_7_7_n_0,
      I1 => ram_reg_640_703_7_7_n_0,
      I2 => dpra(7),
      I3 => ram_reg_576_639_7_7_n_0,
      I4 => dpra(6),
      I5 => ram_reg_512_575_7_7_n_0,
      O => \dpo[7]_INST_0_i_5_n_0\
    );
\dpo[7]_INST_0_i_6\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => ram_reg_960_1023_7_7_n_0,
      I1 => ram_reg_896_959_7_7_n_0,
      I2 => dpra(7),
      I3 => ram_reg_832_895_7_7_n_0,
      I4 => dpra(6),
      I5 => ram_reg_768_831_7_7_n_0,
      O => \dpo[7]_INST_0_i_6_n_0\
    );
\qsdpo_int_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => '1',
      D => \^dpo\(0),
      Q => qsdpo_int(0),
      R => '0'
    );
\qsdpo_int_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => '1',
      D => \^dpo\(1),
      Q => qsdpo_int(1),
      R => '0'
    );
\qsdpo_int_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => '1',
      D => \^dpo\(2),
      Q => qsdpo_int(2),
      R => '0'
    );
\qsdpo_int_reg[3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => '1',
      D => \^dpo\(3),
      Q => qsdpo_int(3),
      R => '0'
    );
\qsdpo_int_reg[4]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => '1',
      D => \^dpo\(4),
      Q => qsdpo_int(4),
      R => '0'
    );
\qsdpo_int_reg[5]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => '1',
      D => \^dpo\(5),
      Q => qsdpo_int(5),
      R => '0'
    );
\qsdpo_int_reg[6]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => '1',
      D => \^dpo\(6),
      Q => qsdpo_int(6),
      R => '0'
    );
\qsdpo_int_reg[7]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => '1',
      D => \^dpo\(7),
      Q => qsdpo_int(7),
      R => '0'
    );
ram_reg_0_63_0_2: unisim.vcomponents.RAM64M
    generic map(
      INIT_A => X"0000000000000000",
      INIT_B => X"0000000000000000",
      INIT_C => X"0000000000000000",
      INIT_D => X"0000000000000000"
    )
        port map (
      ADDRA(5 downto 0) => dpra(5 downto 0),
      ADDRB(5 downto 0) => dpra(5 downto 0),
      ADDRC(5 downto 0) => dpra(5 downto 0),
      ADDRD(5 downto 0) => a(5 downto 0),
      DIA => d(0),
      DIB => d(1),
      DIC => d(2),
      DID => '0',
      DOA => ram_reg_0_63_0_2_n_0,
      DOB => ram_reg_0_63_0_2_n_1,
      DOC => ram_reg_0_63_0_2_n_2,
      DOD => NLW_ram_reg_0_63_0_2_DOD_UNCONNECTED,
      WCLK => clk,
      WE => ram_reg_0_63_0_2_i_1_n_0
    );
ram_reg_0_63_0_2_i_1: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00000002"
    )
        port map (
      I0 => we,
      I1 => a(7),
      I2 => a(6),
      I3 => a(9),
      I4 => a(8),
      O => ram_reg_0_63_0_2_i_1_n_0
    );
ram_reg_0_63_3_5: unisim.vcomponents.RAM64M
    generic map(
      INIT_A => X"0000000000000000",
      INIT_B => X"0000000000000000",
      INIT_C => X"0000000000000000",
      INIT_D => X"0000000000000000"
    )
        port map (
      ADDRA(5 downto 0) => dpra(5 downto 0),
      ADDRB(5 downto 0) => dpra(5 downto 0),
      ADDRC(5 downto 0) => dpra(5 downto 0),
      ADDRD(5 downto 0) => a(5 downto 0),
      DIA => d(3),
      DIB => d(4),
      DIC => d(5),
      DID => '0',
      DOA => ram_reg_0_63_3_5_n_0,
      DOB => ram_reg_0_63_3_5_n_1,
      DOC => ram_reg_0_63_3_5_n_2,
      DOD => NLW_ram_reg_0_63_3_5_DOD_UNCONNECTED,
      WCLK => clk,
      WE => ram_reg_0_63_0_2_i_1_n_0
    );
ram_reg_0_63_6_6: unisim.vcomponents.RAM64X1D
    generic map(
      INIT => X"0000000000000000"
    )
        port map (
      A0 => a(0),
      A1 => a(1),
      A2 => a(2),
      A3 => a(3),
      A4 => a(4),
      A5 => a(5),
      D => d(6),
      DPO => ram_reg_0_63_6_6_n_0,
      DPRA0 => dpra(0),
      DPRA1 => dpra(1),
      DPRA2 => dpra(2),
      DPRA3 => dpra(3),
      DPRA4 => dpra(4),
      DPRA5 => dpra(5),
      SPO => NLW_ram_reg_0_63_6_6_SPO_UNCONNECTED,
      WCLK => clk,
      WE => ram_reg_0_63_0_2_i_1_n_0
    );
ram_reg_0_63_7_7: unisim.vcomponents.RAM64X1D
    generic map(
      INIT => X"0000000000000000"
    )
        port map (
      A0 => a(0),
      A1 => a(1),
      A2 => a(2),
      A3 => a(3),
      A4 => a(4),
      A5 => a(5),
      D => d(7),
      DPO => ram_reg_0_63_7_7_n_0,
      DPRA0 => dpra(0),
      DPRA1 => dpra(1),
      DPRA2 => dpra(2),
      DPRA3 => dpra(3),
      DPRA4 => dpra(4),
      DPRA5 => dpra(5),
      SPO => NLW_ram_reg_0_63_7_7_SPO_UNCONNECTED,
      WCLK => clk,
      WE => ram_reg_0_63_0_2_i_1_n_0
    );
ram_reg_128_191_0_2: unisim.vcomponents.RAM64M
    generic map(
      INIT_A => X"0000000000000000",
      INIT_B => X"0000000000000000",
      INIT_C => X"0000000000000000",
      INIT_D => X"0000000000000000"
    )
        port map (
      ADDRA(5 downto 0) => dpra(5 downto 0),
      ADDRB(5 downto 0) => dpra(5 downto 0),
      ADDRC(5 downto 0) => dpra(5 downto 0),
      ADDRD(5 downto 0) => a(5 downto 0),
      DIA => d(0),
      DIB => d(1),
      DIC => d(2),
      DID => '0',
      DOA => ram_reg_128_191_0_2_n_0,
      DOB => ram_reg_128_191_0_2_n_1,
      DOC => ram_reg_128_191_0_2_n_2,
      DOD => NLW_ram_reg_128_191_0_2_DOD_UNCONNECTED,
      WCLK => clk,
      WE => ram_reg_128_191_0_2_i_1_n_0
    );
ram_reg_128_191_0_2_i_1: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00020000"
    )
        port map (
      I0 => we,
      I1 => a(8),
      I2 => a(6),
      I3 => a(9),
      I4 => a(7),
      O => ram_reg_128_191_0_2_i_1_n_0
    );
ram_reg_128_191_3_5: unisim.vcomponents.RAM64M
    generic map(
      INIT_A => X"0000000000000000",
      INIT_B => X"0000000000000000",
      INIT_C => X"0000000000000000",
      INIT_D => X"0000000000000000"
    )
        port map (
      ADDRA(5 downto 0) => dpra(5 downto 0),
      ADDRB(5 downto 0) => dpra(5 downto 0),
      ADDRC(5 downto 0) => dpra(5 downto 0),
      ADDRD(5 downto 0) => a(5 downto 0),
      DIA => d(3),
      DIB => d(4),
      DIC => d(5),
      DID => '0',
      DOA => ram_reg_128_191_3_5_n_0,
      DOB => ram_reg_128_191_3_5_n_1,
      DOC => ram_reg_128_191_3_5_n_2,
      DOD => NLW_ram_reg_128_191_3_5_DOD_UNCONNECTED,
      WCLK => clk,
      WE => ram_reg_128_191_0_2_i_1_n_0
    );
ram_reg_128_191_6_6: unisim.vcomponents.RAM64X1D
    generic map(
      INIT => X"0000000000000000"
    )
        port map (
      A0 => a(0),
      A1 => a(1),
      A2 => a(2),
      A3 => a(3),
      A4 => a(4),
      A5 => a(5),
      D => d(6),
      DPO => ram_reg_128_191_6_6_n_0,
      DPRA0 => dpra(0),
      DPRA1 => dpra(1),
      DPRA2 => dpra(2),
      DPRA3 => dpra(3),
      DPRA4 => dpra(4),
      DPRA5 => dpra(5),
      SPO => NLW_ram_reg_128_191_6_6_SPO_UNCONNECTED,
      WCLK => clk,
      WE => ram_reg_128_191_0_2_i_1_n_0
    );
ram_reg_128_191_7_7: unisim.vcomponents.RAM64X1D
    generic map(
      INIT => X"0000000000000000"
    )
        port map (
      A0 => a(0),
      A1 => a(1),
      A2 => a(2),
      A3 => a(3),
      A4 => a(4),
      A5 => a(5),
      D => d(7),
      DPO => ram_reg_128_191_7_7_n_0,
      DPRA0 => dpra(0),
      DPRA1 => dpra(1),
      DPRA2 => dpra(2),
      DPRA3 => dpra(3),
      DPRA4 => dpra(4),
      DPRA5 => dpra(5),
      SPO => NLW_ram_reg_128_191_7_7_SPO_UNCONNECTED,
      WCLK => clk,
      WE => ram_reg_128_191_0_2_i_1_n_0
    );
ram_reg_192_255_0_2: unisim.vcomponents.RAM64M
    generic map(
      INIT_A => X"0000000000000000",
      INIT_B => X"0000000000000000",
      INIT_C => X"0000000000000000",
      INIT_D => X"0000000000000000"
    )
        port map (
      ADDRA(5 downto 0) => dpra(5 downto 0),
      ADDRB(5 downto 0) => dpra(5 downto 0),
      ADDRC(5 downto 0) => dpra(5 downto 0),
      ADDRD(5 downto 0) => a(5 downto 0),
      DIA => d(0),
      DIB => d(1),
      DIC => d(2),
      DID => '0',
      DOA => ram_reg_192_255_0_2_n_0,
      DOB => ram_reg_192_255_0_2_n_1,
      DOC => ram_reg_192_255_0_2_n_2,
      DOD => NLW_ram_reg_192_255_0_2_DOD_UNCONNECTED,
      WCLK => clk,
      WE => ram_reg_192_255_0_2_i_1_n_0
    );
ram_reg_192_255_0_2_i_1: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00400000"
    )
        port map (
      I0 => a(9),
      I1 => a(7),
      I2 => a(6),
      I3 => a(8),
      I4 => we,
      O => ram_reg_192_255_0_2_i_1_n_0
    );
ram_reg_192_255_3_5: unisim.vcomponents.RAM64M
    generic map(
      INIT_A => X"0000000000000000",
      INIT_B => X"0000000000000000",
      INIT_C => X"0000000000000000",
      INIT_D => X"0000000000000000"
    )
        port map (
      ADDRA(5 downto 0) => dpra(5 downto 0),
      ADDRB(5 downto 0) => dpra(5 downto 0),
      ADDRC(5 downto 0) => dpra(5 downto 0),
      ADDRD(5 downto 0) => a(5 downto 0),
      DIA => d(3),
      DIB => d(4),
      DIC => d(5),
      DID => '0',
      DOA => ram_reg_192_255_3_5_n_0,
      DOB => ram_reg_192_255_3_5_n_1,
      DOC => ram_reg_192_255_3_5_n_2,
      DOD => NLW_ram_reg_192_255_3_5_DOD_UNCONNECTED,
      WCLK => clk,
      WE => ram_reg_192_255_0_2_i_1_n_0
    );
ram_reg_192_255_6_6: unisim.vcomponents.RAM64X1D
    generic map(
      INIT => X"0000000000000000"
    )
        port map (
      A0 => a(0),
      A1 => a(1),
      A2 => a(2),
      A3 => a(3),
      A4 => a(4),
      A5 => a(5),
      D => d(6),
      DPO => ram_reg_192_255_6_6_n_0,
      DPRA0 => dpra(0),
      DPRA1 => dpra(1),
      DPRA2 => dpra(2),
      DPRA3 => dpra(3),
      DPRA4 => dpra(4),
      DPRA5 => dpra(5),
      SPO => NLW_ram_reg_192_255_6_6_SPO_UNCONNECTED,
      WCLK => clk,
      WE => ram_reg_192_255_0_2_i_1_n_0
    );
ram_reg_192_255_7_7: unisim.vcomponents.RAM64X1D
    generic map(
      INIT => X"0000000000000000"
    )
        port map (
      A0 => a(0),
      A1 => a(1),
      A2 => a(2),
      A3 => a(3),
      A4 => a(4),
      A5 => a(5),
      D => d(7),
      DPO => ram_reg_192_255_7_7_n_0,
      DPRA0 => dpra(0),
      DPRA1 => dpra(1),
      DPRA2 => dpra(2),
      DPRA3 => dpra(3),
      DPRA4 => dpra(4),
      DPRA5 => dpra(5),
      SPO => NLW_ram_reg_192_255_7_7_SPO_UNCONNECTED,
      WCLK => clk,
      WE => ram_reg_192_255_0_2_i_1_n_0
    );
ram_reg_256_319_0_2: unisim.vcomponents.RAM64M
    generic map(
      INIT_A => X"0000000000000000",
      INIT_B => X"0000000000000000",
      INIT_C => X"0000000000000000",
      INIT_D => X"0000000000000000"
    )
        port map (
      ADDRA(5 downto 0) => dpra(5 downto 0),
      ADDRB(5 downto 0) => dpra(5 downto 0),
      ADDRC(5 downto 0) => dpra(5 downto 0),
      ADDRD(5 downto 0) => a(5 downto 0),
      DIA => d(0),
      DIB => d(1),
      DIC => d(2),
      DID => '0',
      DOA => ram_reg_256_319_0_2_n_0,
      DOB => ram_reg_256_319_0_2_n_1,
      DOC => ram_reg_256_319_0_2_n_2,
      DOD => NLW_ram_reg_256_319_0_2_DOD_UNCONNECTED,
      WCLK => clk,
      WE => ram_reg_256_319_0_2_i_1_n_0
    );
ram_reg_256_319_0_2_i_1: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00020000"
    )
        port map (
      I0 => we,
      I1 => a(7),
      I2 => a(6),
      I3 => a(9),
      I4 => a(8),
      O => ram_reg_256_319_0_2_i_1_n_0
    );
ram_reg_256_319_3_5: unisim.vcomponents.RAM64M
    generic map(
      INIT_A => X"0000000000000000",
      INIT_B => X"0000000000000000",
      INIT_C => X"0000000000000000",
      INIT_D => X"0000000000000000"
    )
        port map (
      ADDRA(5 downto 0) => dpra(5 downto 0),
      ADDRB(5 downto 0) => dpra(5 downto 0),
      ADDRC(5 downto 0) => dpra(5 downto 0),
      ADDRD(5 downto 0) => a(5 downto 0),
      DIA => d(3),
      DIB => d(4),
      DIC => d(5),
      DID => '0',
      DOA => ram_reg_256_319_3_5_n_0,
      DOB => ram_reg_256_319_3_5_n_1,
      DOC => ram_reg_256_319_3_5_n_2,
      DOD => NLW_ram_reg_256_319_3_5_DOD_UNCONNECTED,
      WCLK => clk,
      WE => ram_reg_256_319_0_2_i_1_n_0
    );
ram_reg_256_319_6_6: unisim.vcomponents.RAM64X1D
    generic map(
      INIT => X"0000000000000000"
    )
        port map (
      A0 => a(0),
      A1 => a(1),
      A2 => a(2),
      A3 => a(3),
      A4 => a(4),
      A5 => a(5),
      D => d(6),
      DPO => ram_reg_256_319_6_6_n_0,
      DPRA0 => dpra(0),
      DPRA1 => dpra(1),
      DPRA2 => dpra(2),
      DPRA3 => dpra(3),
      DPRA4 => dpra(4),
      DPRA5 => dpra(5),
      SPO => NLW_ram_reg_256_319_6_6_SPO_UNCONNECTED,
      WCLK => clk,
      WE => ram_reg_256_319_0_2_i_1_n_0
    );
ram_reg_256_319_7_7: unisim.vcomponents.RAM64X1D
    generic map(
      INIT => X"0000000000000000"
    )
        port map (
      A0 => a(0),
      A1 => a(1),
      A2 => a(2),
      A3 => a(3),
      A4 => a(4),
      A5 => a(5),
      D => d(7),
      DPO => ram_reg_256_319_7_7_n_0,
      DPRA0 => dpra(0),
      DPRA1 => dpra(1),
      DPRA2 => dpra(2),
      DPRA3 => dpra(3),
      DPRA4 => dpra(4),
      DPRA5 => dpra(5),
      SPO => NLW_ram_reg_256_319_7_7_SPO_UNCONNECTED,
      WCLK => clk,
      WE => ram_reg_256_319_0_2_i_1_n_0
    );
ram_reg_320_383_0_2: unisim.vcomponents.RAM64M
    generic map(
      INIT_A => X"0000000000000000",
      INIT_B => X"0000000000000000",
      INIT_C => X"0000000000000000",
      INIT_D => X"0000000000000000"
    )
        port map (
      ADDRA(5 downto 0) => dpra(5 downto 0),
      ADDRB(5 downto 0) => dpra(5 downto 0),
      ADDRC(5 downto 0) => dpra(5 downto 0),
      ADDRD(5 downto 0) => a(5 downto 0),
      DIA => d(0),
      DIB => d(1),
      DIC => d(2),
      DID => '0',
      DOA => ram_reg_320_383_0_2_n_0,
      DOB => ram_reg_320_383_0_2_n_1,
      DOC => ram_reg_320_383_0_2_n_2,
      DOD => NLW_ram_reg_320_383_0_2_DOD_UNCONNECTED,
      WCLK => clk,
      WE => ram_reg_320_383_0_2_i_1_n_0
    );
ram_reg_320_383_0_2_i_1: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00400000"
    )
        port map (
      I0 => a(9),
      I1 => a(8),
      I2 => a(6),
      I3 => a(7),
      I4 => we,
      O => ram_reg_320_383_0_2_i_1_n_0
    );
ram_reg_320_383_3_5: unisim.vcomponents.RAM64M
    generic map(
      INIT_A => X"0000000000000000",
      INIT_B => X"0000000000000000",
      INIT_C => X"0000000000000000",
      INIT_D => X"0000000000000000"
    )
        port map (
      ADDRA(5 downto 0) => dpra(5 downto 0),
      ADDRB(5 downto 0) => dpra(5 downto 0),
      ADDRC(5 downto 0) => dpra(5 downto 0),
      ADDRD(5 downto 0) => a(5 downto 0),
      DIA => d(3),
      DIB => d(4),
      DIC => d(5),
      DID => '0',
      DOA => ram_reg_320_383_3_5_n_0,
      DOB => ram_reg_320_383_3_5_n_1,
      DOC => ram_reg_320_383_3_5_n_2,
      DOD => NLW_ram_reg_320_383_3_5_DOD_UNCONNECTED,
      WCLK => clk,
      WE => ram_reg_320_383_0_2_i_1_n_0
    );
ram_reg_320_383_6_6: unisim.vcomponents.RAM64X1D
    generic map(
      INIT => X"0000000000000000"
    )
        port map (
      A0 => a(0),
      A1 => a(1),
      A2 => a(2),
      A3 => a(3),
      A4 => a(4),
      A5 => a(5),
      D => d(6),
      DPO => ram_reg_320_383_6_6_n_0,
      DPRA0 => dpra(0),
      DPRA1 => dpra(1),
      DPRA2 => dpra(2),
      DPRA3 => dpra(3),
      DPRA4 => dpra(4),
      DPRA5 => dpra(5),
      SPO => NLW_ram_reg_320_383_6_6_SPO_UNCONNECTED,
      WCLK => clk,
      WE => ram_reg_320_383_0_2_i_1_n_0
    );
ram_reg_320_383_7_7: unisim.vcomponents.RAM64X1D
    generic map(
      INIT => X"0000000000000000"
    )
        port map (
      A0 => a(0),
      A1 => a(1),
      A2 => a(2),
      A3 => a(3),
      A4 => a(4),
      A5 => a(5),
      D => d(7),
      DPO => ram_reg_320_383_7_7_n_0,
      DPRA0 => dpra(0),
      DPRA1 => dpra(1),
      DPRA2 => dpra(2),
      DPRA3 => dpra(3),
      DPRA4 => dpra(4),
      DPRA5 => dpra(5),
      SPO => NLW_ram_reg_320_383_7_7_SPO_UNCONNECTED,
      WCLK => clk,
      WE => ram_reg_320_383_0_2_i_1_n_0
    );
ram_reg_384_447_0_2: unisim.vcomponents.RAM64M
    generic map(
      INIT_A => X"0000000000000000",
      INIT_B => X"0000000000000000",
      INIT_C => X"0000000000000000",
      INIT_D => X"0000000000000000"
    )
        port map (
      ADDRA(5 downto 0) => dpra(5 downto 0),
      ADDRB(5 downto 0) => dpra(5 downto 0),
      ADDRC(5 downto 0) => dpra(5 downto 0),
      ADDRD(5 downto 0) => a(5 downto 0),
      DIA => d(0),
      DIB => d(1),
      DIC => d(2),
      DID => '0',
      DOA => ram_reg_384_447_0_2_n_0,
      DOB => ram_reg_384_447_0_2_n_1,
      DOC => ram_reg_384_447_0_2_n_2,
      DOD => NLW_ram_reg_384_447_0_2_DOD_UNCONNECTED,
      WCLK => clk,
      WE => ram_reg_384_447_0_2_i_1_n_0
    );
ram_reg_384_447_0_2_i_1: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00400000"
    )
        port map (
      I0 => a(9),
      I1 => a(8),
      I2 => a(7),
      I3 => a(6),
      I4 => we,
      O => ram_reg_384_447_0_2_i_1_n_0
    );
ram_reg_384_447_3_5: unisim.vcomponents.RAM64M
    generic map(
      INIT_A => X"0000000000000000",
      INIT_B => X"0000000000000000",
      INIT_C => X"0000000000000000",
      INIT_D => X"0000000000000000"
    )
        port map (
      ADDRA(5 downto 0) => dpra(5 downto 0),
      ADDRB(5 downto 0) => dpra(5 downto 0),
      ADDRC(5 downto 0) => dpra(5 downto 0),
      ADDRD(5 downto 0) => a(5 downto 0),
      DIA => d(3),
      DIB => d(4),
      DIC => d(5),
      DID => '0',
      DOA => ram_reg_384_447_3_5_n_0,
      DOB => ram_reg_384_447_3_5_n_1,
      DOC => ram_reg_384_447_3_5_n_2,
      DOD => NLW_ram_reg_384_447_3_5_DOD_UNCONNECTED,
      WCLK => clk,
      WE => ram_reg_384_447_0_2_i_1_n_0
    );
ram_reg_384_447_6_6: unisim.vcomponents.RAM64X1D
    generic map(
      INIT => X"0000000000000000"
    )
        port map (
      A0 => a(0),
      A1 => a(1),
      A2 => a(2),
      A3 => a(3),
      A4 => a(4),
      A5 => a(5),
      D => d(6),
      DPO => ram_reg_384_447_6_6_n_0,
      DPRA0 => dpra(0),
      DPRA1 => dpra(1),
      DPRA2 => dpra(2),
      DPRA3 => dpra(3),
      DPRA4 => dpra(4),
      DPRA5 => dpra(5),
      SPO => NLW_ram_reg_384_447_6_6_SPO_UNCONNECTED,
      WCLK => clk,
      WE => ram_reg_384_447_0_2_i_1_n_0
    );
ram_reg_384_447_7_7: unisim.vcomponents.RAM64X1D
    generic map(
      INIT => X"0000000000000000"
    )
        port map (
      A0 => a(0),
      A1 => a(1),
      A2 => a(2),
      A3 => a(3),
      A4 => a(4),
      A5 => a(5),
      D => d(7),
      DPO => ram_reg_384_447_7_7_n_0,
      DPRA0 => dpra(0),
      DPRA1 => dpra(1),
      DPRA2 => dpra(2),
      DPRA3 => dpra(3),
      DPRA4 => dpra(4),
      DPRA5 => dpra(5),
      SPO => NLW_ram_reg_384_447_7_7_SPO_UNCONNECTED,
      WCLK => clk,
      WE => ram_reg_384_447_0_2_i_1_n_0
    );
ram_reg_448_511_0_2: unisim.vcomponents.RAM64M
    generic map(
      INIT_A => X"0000000000000000",
      INIT_B => X"0000000000000000",
      INIT_C => X"0000000000000000",
      INIT_D => X"0000000000000000"
    )
        port map (
      ADDRA(5 downto 0) => dpra(5 downto 0),
      ADDRB(5 downto 0) => dpra(5 downto 0),
      ADDRC(5 downto 0) => dpra(5 downto 0),
      ADDRD(5 downto 0) => a(5 downto 0),
      DIA => d(0),
      DIB => d(1),
      DIC => d(2),
      DID => '0',
      DOA => ram_reg_448_511_0_2_n_0,
      DOB => ram_reg_448_511_0_2_n_1,
      DOC => ram_reg_448_511_0_2_n_2,
      DOD => NLW_ram_reg_448_511_0_2_DOD_UNCONNECTED,
      WCLK => clk,
      WE => ram_reg_448_511_0_2_i_1_n_0
    );
ram_reg_448_511_0_2_i_1: unisim.vcomponents.LUT5
    generic map(
      INIT => X"40000000"
    )
        port map (
      I0 => a(9),
      I1 => a(7),
      I2 => a(6),
      I3 => we,
      I4 => a(8),
      O => ram_reg_448_511_0_2_i_1_n_0
    );
ram_reg_448_511_3_5: unisim.vcomponents.RAM64M
    generic map(
      INIT_A => X"0000000000000000",
      INIT_B => X"0000000000000000",
      INIT_C => X"0000000000000000",
      INIT_D => X"0000000000000000"
    )
        port map (
      ADDRA(5 downto 0) => dpra(5 downto 0),
      ADDRB(5 downto 0) => dpra(5 downto 0),
      ADDRC(5 downto 0) => dpra(5 downto 0),
      ADDRD(5 downto 0) => a(5 downto 0),
      DIA => d(3),
      DIB => d(4),
      DIC => d(5),
      DID => '0',
      DOA => ram_reg_448_511_3_5_n_0,
      DOB => ram_reg_448_511_3_5_n_1,
      DOC => ram_reg_448_511_3_5_n_2,
      DOD => NLW_ram_reg_448_511_3_5_DOD_UNCONNECTED,
      WCLK => clk,
      WE => ram_reg_448_511_0_2_i_1_n_0
    );
ram_reg_448_511_6_6: unisim.vcomponents.RAM64X1D
    generic map(
      INIT => X"0000000000000000"
    )
        port map (
      A0 => a(0),
      A1 => a(1),
      A2 => a(2),
      A3 => a(3),
      A4 => a(4),
      A5 => a(5),
      D => d(6),
      DPO => ram_reg_448_511_6_6_n_0,
      DPRA0 => dpra(0),
      DPRA1 => dpra(1),
      DPRA2 => dpra(2),
      DPRA3 => dpra(3),
      DPRA4 => dpra(4),
      DPRA5 => dpra(5),
      SPO => NLW_ram_reg_448_511_6_6_SPO_UNCONNECTED,
      WCLK => clk,
      WE => ram_reg_448_511_0_2_i_1_n_0
    );
ram_reg_448_511_7_7: unisim.vcomponents.RAM64X1D
    generic map(
      INIT => X"0000000000000000"
    )
        port map (
      A0 => a(0),
      A1 => a(1),
      A2 => a(2),
      A3 => a(3),
      A4 => a(4),
      A5 => a(5),
      D => d(7),
      DPO => ram_reg_448_511_7_7_n_0,
      DPRA0 => dpra(0),
      DPRA1 => dpra(1),
      DPRA2 => dpra(2),
      DPRA3 => dpra(3),
      DPRA4 => dpra(4),
      DPRA5 => dpra(5),
      SPO => NLW_ram_reg_448_511_7_7_SPO_UNCONNECTED,
      WCLK => clk,
      WE => ram_reg_448_511_0_2_i_1_n_0
    );
ram_reg_512_575_0_2: unisim.vcomponents.RAM64M
    generic map(
      INIT_A => X"0000000000000000",
      INIT_B => X"0000000000000000",
      INIT_C => X"0000000000000000",
      INIT_D => X"0000000000000000"
    )
        port map (
      ADDRA(5 downto 0) => dpra(5 downto 0),
      ADDRB(5 downto 0) => dpra(5 downto 0),
      ADDRC(5 downto 0) => dpra(5 downto 0),
      ADDRD(5 downto 0) => a(5 downto 0),
      DIA => d(0),
      DIB => d(1),
      DIC => d(2),
      DID => '0',
      DOA => ram_reg_512_575_0_2_n_0,
      DOB => ram_reg_512_575_0_2_n_1,
      DOC => ram_reg_512_575_0_2_n_2,
      DOD => NLW_ram_reg_512_575_0_2_DOD_UNCONNECTED,
      WCLK => clk,
      WE => ram_reg_512_575_0_2_i_1_n_0
    );
ram_reg_512_575_0_2_i_1: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00020000"
    )
        port map (
      I0 => we,
      I1 => a(7),
      I2 => a(6),
      I3 => a(8),
      I4 => a(9),
      O => ram_reg_512_575_0_2_i_1_n_0
    );
ram_reg_512_575_3_5: unisim.vcomponents.RAM64M
    generic map(
      INIT_A => X"0000000000000000",
      INIT_B => X"0000000000000000",
      INIT_C => X"0000000000000000",
      INIT_D => X"0000000000000000"
    )
        port map (
      ADDRA(5 downto 0) => dpra(5 downto 0),
      ADDRB(5 downto 0) => dpra(5 downto 0),
      ADDRC(5 downto 0) => dpra(5 downto 0),
      ADDRD(5 downto 0) => a(5 downto 0),
      DIA => d(3),
      DIB => d(4),
      DIC => d(5),
      DID => '0',
      DOA => ram_reg_512_575_3_5_n_0,
      DOB => ram_reg_512_575_3_5_n_1,
      DOC => ram_reg_512_575_3_5_n_2,
      DOD => NLW_ram_reg_512_575_3_5_DOD_UNCONNECTED,
      WCLK => clk,
      WE => ram_reg_512_575_0_2_i_1_n_0
    );
ram_reg_512_575_6_6: unisim.vcomponents.RAM64X1D
    generic map(
      INIT => X"0000000000000000"
    )
        port map (
      A0 => a(0),
      A1 => a(1),
      A2 => a(2),
      A3 => a(3),
      A4 => a(4),
      A5 => a(5),
      D => d(6),
      DPO => ram_reg_512_575_6_6_n_0,
      DPRA0 => dpra(0),
      DPRA1 => dpra(1),
      DPRA2 => dpra(2),
      DPRA3 => dpra(3),
      DPRA4 => dpra(4),
      DPRA5 => dpra(5),
      SPO => NLW_ram_reg_512_575_6_6_SPO_UNCONNECTED,
      WCLK => clk,
      WE => ram_reg_512_575_0_2_i_1_n_0
    );
ram_reg_512_575_7_7: unisim.vcomponents.RAM64X1D
    generic map(
      INIT => X"0000000000000000"
    )
        port map (
      A0 => a(0),
      A1 => a(1),
      A2 => a(2),
      A3 => a(3),
      A4 => a(4),
      A5 => a(5),
      D => d(7),
      DPO => ram_reg_512_575_7_7_n_0,
      DPRA0 => dpra(0),
      DPRA1 => dpra(1),
      DPRA2 => dpra(2),
      DPRA3 => dpra(3),
      DPRA4 => dpra(4),
      DPRA5 => dpra(5),
      SPO => NLW_ram_reg_512_575_7_7_SPO_UNCONNECTED,
      WCLK => clk,
      WE => ram_reg_512_575_0_2_i_1_n_0
    );
ram_reg_576_639_0_2: unisim.vcomponents.RAM64M
    generic map(
      INIT_A => X"0000000000000000",
      INIT_B => X"0000000000000000",
      INIT_C => X"0000000000000000",
      INIT_D => X"0000000000000000"
    )
        port map (
      ADDRA(5 downto 0) => dpra(5 downto 0),
      ADDRB(5 downto 0) => dpra(5 downto 0),
      ADDRC(5 downto 0) => dpra(5 downto 0),
      ADDRD(5 downto 0) => a(5 downto 0),
      DIA => d(0),
      DIB => d(1),
      DIC => d(2),
      DID => '0',
      DOA => ram_reg_576_639_0_2_n_0,
      DOB => ram_reg_576_639_0_2_n_1,
      DOC => ram_reg_576_639_0_2_n_2,
      DOD => NLW_ram_reg_576_639_0_2_DOD_UNCONNECTED,
      WCLK => clk,
      WE => ram_reg_576_639_0_2_i_1_n_0
    );
ram_reg_576_639_0_2_i_1: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00400000"
    )
        port map (
      I0 => a(8),
      I1 => a(9),
      I2 => a(6),
      I3 => a(7),
      I4 => we,
      O => ram_reg_576_639_0_2_i_1_n_0
    );
ram_reg_576_639_3_5: unisim.vcomponents.RAM64M
    generic map(
      INIT_A => X"0000000000000000",
      INIT_B => X"0000000000000000",
      INIT_C => X"0000000000000000",
      INIT_D => X"0000000000000000"
    )
        port map (
      ADDRA(5 downto 0) => dpra(5 downto 0),
      ADDRB(5 downto 0) => dpra(5 downto 0),
      ADDRC(5 downto 0) => dpra(5 downto 0),
      ADDRD(5 downto 0) => a(5 downto 0),
      DIA => d(3),
      DIB => d(4),
      DIC => d(5),
      DID => '0',
      DOA => ram_reg_576_639_3_5_n_0,
      DOB => ram_reg_576_639_3_5_n_1,
      DOC => ram_reg_576_639_3_5_n_2,
      DOD => NLW_ram_reg_576_639_3_5_DOD_UNCONNECTED,
      WCLK => clk,
      WE => ram_reg_576_639_0_2_i_1_n_0
    );
ram_reg_576_639_6_6: unisim.vcomponents.RAM64X1D
    generic map(
      INIT => X"0000000000000000"
    )
        port map (
      A0 => a(0),
      A1 => a(1),
      A2 => a(2),
      A3 => a(3),
      A4 => a(4),
      A5 => a(5),
      D => d(6),
      DPO => ram_reg_576_639_6_6_n_0,
      DPRA0 => dpra(0),
      DPRA1 => dpra(1),
      DPRA2 => dpra(2),
      DPRA3 => dpra(3),
      DPRA4 => dpra(4),
      DPRA5 => dpra(5),
      SPO => NLW_ram_reg_576_639_6_6_SPO_UNCONNECTED,
      WCLK => clk,
      WE => ram_reg_576_639_0_2_i_1_n_0
    );
ram_reg_576_639_7_7: unisim.vcomponents.RAM64X1D
    generic map(
      INIT => X"0000000000000000"
    )
        port map (
      A0 => a(0),
      A1 => a(1),
      A2 => a(2),
      A3 => a(3),
      A4 => a(4),
      A5 => a(5),
      D => d(7),
      DPO => ram_reg_576_639_7_7_n_0,
      DPRA0 => dpra(0),
      DPRA1 => dpra(1),
      DPRA2 => dpra(2),
      DPRA3 => dpra(3),
      DPRA4 => dpra(4),
      DPRA5 => dpra(5),
      SPO => NLW_ram_reg_576_639_7_7_SPO_UNCONNECTED,
      WCLK => clk,
      WE => ram_reg_576_639_0_2_i_1_n_0
    );
ram_reg_640_703_0_2: unisim.vcomponents.RAM64M
    generic map(
      INIT_A => X"0000000000000000",
      INIT_B => X"0000000000000000",
      INIT_C => X"0000000000000000",
      INIT_D => X"0000000000000000"
    )
        port map (
      ADDRA(5 downto 0) => dpra(5 downto 0),
      ADDRB(5 downto 0) => dpra(5 downto 0),
      ADDRC(5 downto 0) => dpra(5 downto 0),
      ADDRD(5 downto 0) => a(5 downto 0),
      DIA => d(0),
      DIB => d(1),
      DIC => d(2),
      DID => '0',
      DOA => ram_reg_640_703_0_2_n_0,
      DOB => ram_reg_640_703_0_2_n_1,
      DOC => ram_reg_640_703_0_2_n_2,
      DOD => NLW_ram_reg_640_703_0_2_DOD_UNCONNECTED,
      WCLK => clk,
      WE => ram_reg_640_703_0_2_i_1_n_0
    );
ram_reg_640_703_0_2_i_1: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00400000"
    )
        port map (
      I0 => a(8),
      I1 => a(9),
      I2 => a(7),
      I3 => a(6),
      I4 => we,
      O => ram_reg_640_703_0_2_i_1_n_0
    );
ram_reg_640_703_3_5: unisim.vcomponents.RAM64M
    generic map(
      INIT_A => X"0000000000000000",
      INIT_B => X"0000000000000000",
      INIT_C => X"0000000000000000",
      INIT_D => X"0000000000000000"
    )
        port map (
      ADDRA(5 downto 0) => dpra(5 downto 0),
      ADDRB(5 downto 0) => dpra(5 downto 0),
      ADDRC(5 downto 0) => dpra(5 downto 0),
      ADDRD(5 downto 0) => a(5 downto 0),
      DIA => d(3),
      DIB => d(4),
      DIC => d(5),
      DID => '0',
      DOA => ram_reg_640_703_3_5_n_0,
      DOB => ram_reg_640_703_3_5_n_1,
      DOC => ram_reg_640_703_3_5_n_2,
      DOD => NLW_ram_reg_640_703_3_5_DOD_UNCONNECTED,
      WCLK => clk,
      WE => ram_reg_640_703_0_2_i_1_n_0
    );
ram_reg_640_703_6_6: unisim.vcomponents.RAM64X1D
    generic map(
      INIT => X"0000000000000000"
    )
        port map (
      A0 => a(0),
      A1 => a(1),
      A2 => a(2),
      A3 => a(3),
      A4 => a(4),
      A5 => a(5),
      D => d(6),
      DPO => ram_reg_640_703_6_6_n_0,
      DPRA0 => dpra(0),
      DPRA1 => dpra(1),
      DPRA2 => dpra(2),
      DPRA3 => dpra(3),
      DPRA4 => dpra(4),
      DPRA5 => dpra(5),
      SPO => NLW_ram_reg_640_703_6_6_SPO_UNCONNECTED,
      WCLK => clk,
      WE => ram_reg_640_703_0_2_i_1_n_0
    );
ram_reg_640_703_7_7: unisim.vcomponents.RAM64X1D
    generic map(
      INIT => X"0000000000000000"
    )
        port map (
      A0 => a(0),
      A1 => a(1),
      A2 => a(2),
      A3 => a(3),
      A4 => a(4),
      A5 => a(5),
      D => d(7),
      DPO => ram_reg_640_703_7_7_n_0,
      DPRA0 => dpra(0),
      DPRA1 => dpra(1),
      DPRA2 => dpra(2),
      DPRA3 => dpra(3),
      DPRA4 => dpra(4),
      DPRA5 => dpra(5),
      SPO => NLW_ram_reg_640_703_7_7_SPO_UNCONNECTED,
      WCLK => clk,
      WE => ram_reg_640_703_0_2_i_1_n_0
    );
ram_reg_64_127_0_2: unisim.vcomponents.RAM64M
    generic map(
      INIT_A => X"0000000000000000",
      INIT_B => X"0000000000000000",
      INIT_C => X"0000000000000000",
      INIT_D => X"0000000000000000"
    )
        port map (
      ADDRA(5 downto 0) => dpra(5 downto 0),
      ADDRB(5 downto 0) => dpra(5 downto 0),
      ADDRC(5 downto 0) => dpra(5 downto 0),
      ADDRD(5 downto 0) => a(5 downto 0),
      DIA => d(0),
      DIB => d(1),
      DIC => d(2),
      DID => '0',
      DOA => ram_reg_64_127_0_2_n_0,
      DOB => ram_reg_64_127_0_2_n_1,
      DOC => ram_reg_64_127_0_2_n_2,
      DOD => NLW_ram_reg_64_127_0_2_DOD_UNCONNECTED,
      WCLK => clk,
      WE => ram_reg_64_127_0_2_i_1_n_0
    );
ram_reg_64_127_0_2_i_1: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00020000"
    )
        port map (
      I0 => we,
      I1 => a(8),
      I2 => a(7),
      I3 => a(9),
      I4 => a(6),
      O => ram_reg_64_127_0_2_i_1_n_0
    );
ram_reg_64_127_3_5: unisim.vcomponents.RAM64M
    generic map(
      INIT_A => X"0000000000000000",
      INIT_B => X"0000000000000000",
      INIT_C => X"0000000000000000",
      INIT_D => X"0000000000000000"
    )
        port map (
      ADDRA(5 downto 0) => dpra(5 downto 0),
      ADDRB(5 downto 0) => dpra(5 downto 0),
      ADDRC(5 downto 0) => dpra(5 downto 0),
      ADDRD(5 downto 0) => a(5 downto 0),
      DIA => d(3),
      DIB => d(4),
      DIC => d(5),
      DID => '0',
      DOA => ram_reg_64_127_3_5_n_0,
      DOB => ram_reg_64_127_3_5_n_1,
      DOC => ram_reg_64_127_3_5_n_2,
      DOD => NLW_ram_reg_64_127_3_5_DOD_UNCONNECTED,
      WCLK => clk,
      WE => ram_reg_64_127_0_2_i_1_n_0
    );
ram_reg_64_127_6_6: unisim.vcomponents.RAM64X1D
    generic map(
      INIT => X"0000000000000000"
    )
        port map (
      A0 => a(0),
      A1 => a(1),
      A2 => a(2),
      A3 => a(3),
      A4 => a(4),
      A5 => a(5),
      D => d(6),
      DPO => ram_reg_64_127_6_6_n_0,
      DPRA0 => dpra(0),
      DPRA1 => dpra(1),
      DPRA2 => dpra(2),
      DPRA3 => dpra(3),
      DPRA4 => dpra(4),
      DPRA5 => dpra(5),
      SPO => NLW_ram_reg_64_127_6_6_SPO_UNCONNECTED,
      WCLK => clk,
      WE => ram_reg_64_127_0_2_i_1_n_0
    );
ram_reg_64_127_7_7: unisim.vcomponents.RAM64X1D
    generic map(
      INIT => X"0000000000000000"
    )
        port map (
      A0 => a(0),
      A1 => a(1),
      A2 => a(2),
      A3 => a(3),
      A4 => a(4),
      A5 => a(5),
      D => d(7),
      DPO => ram_reg_64_127_7_7_n_0,
      DPRA0 => dpra(0),
      DPRA1 => dpra(1),
      DPRA2 => dpra(2),
      DPRA3 => dpra(3),
      DPRA4 => dpra(4),
      DPRA5 => dpra(5),
      SPO => NLW_ram_reg_64_127_7_7_SPO_UNCONNECTED,
      WCLK => clk,
      WE => ram_reg_64_127_0_2_i_1_n_0
    );
ram_reg_704_767_0_2: unisim.vcomponents.RAM64M
    generic map(
      INIT_A => X"0000000000000000",
      INIT_B => X"0000000000000000",
      INIT_C => X"0000000000000000",
      INIT_D => X"0000000000000000"
    )
        port map (
      ADDRA(5 downto 0) => dpra(5 downto 0),
      ADDRB(5 downto 0) => dpra(5 downto 0),
      ADDRC(5 downto 0) => dpra(5 downto 0),
      ADDRD(5 downto 0) => a(5 downto 0),
      DIA => d(0),
      DIB => d(1),
      DIC => d(2),
      DID => '0',
      DOA => ram_reg_704_767_0_2_n_0,
      DOB => ram_reg_704_767_0_2_n_1,
      DOC => ram_reg_704_767_0_2_n_2,
      DOD => NLW_ram_reg_704_767_0_2_DOD_UNCONNECTED,
      WCLK => clk,
      WE => ram_reg_704_767_0_2_i_1_n_0
    );
ram_reg_704_767_0_2_i_1: unisim.vcomponents.LUT5
    generic map(
      INIT => X"40000000"
    )
        port map (
      I0 => a(8),
      I1 => a(7),
      I2 => a(6),
      I3 => we,
      I4 => a(9),
      O => ram_reg_704_767_0_2_i_1_n_0
    );
ram_reg_704_767_3_5: unisim.vcomponents.RAM64M
    generic map(
      INIT_A => X"0000000000000000",
      INIT_B => X"0000000000000000",
      INIT_C => X"0000000000000000",
      INIT_D => X"0000000000000000"
    )
        port map (
      ADDRA(5 downto 0) => dpra(5 downto 0),
      ADDRB(5 downto 0) => dpra(5 downto 0),
      ADDRC(5 downto 0) => dpra(5 downto 0),
      ADDRD(5 downto 0) => a(5 downto 0),
      DIA => d(3),
      DIB => d(4),
      DIC => d(5),
      DID => '0',
      DOA => ram_reg_704_767_3_5_n_0,
      DOB => ram_reg_704_767_3_5_n_1,
      DOC => ram_reg_704_767_3_5_n_2,
      DOD => NLW_ram_reg_704_767_3_5_DOD_UNCONNECTED,
      WCLK => clk,
      WE => ram_reg_704_767_0_2_i_1_n_0
    );
ram_reg_704_767_6_6: unisim.vcomponents.RAM64X1D
    generic map(
      INIT => X"0000000000000000"
    )
        port map (
      A0 => a(0),
      A1 => a(1),
      A2 => a(2),
      A3 => a(3),
      A4 => a(4),
      A5 => a(5),
      D => d(6),
      DPO => ram_reg_704_767_6_6_n_0,
      DPRA0 => dpra(0),
      DPRA1 => dpra(1),
      DPRA2 => dpra(2),
      DPRA3 => dpra(3),
      DPRA4 => dpra(4),
      DPRA5 => dpra(5),
      SPO => NLW_ram_reg_704_767_6_6_SPO_UNCONNECTED,
      WCLK => clk,
      WE => ram_reg_704_767_0_2_i_1_n_0
    );
ram_reg_704_767_7_7: unisim.vcomponents.RAM64X1D
    generic map(
      INIT => X"0000000000000000"
    )
        port map (
      A0 => a(0),
      A1 => a(1),
      A2 => a(2),
      A3 => a(3),
      A4 => a(4),
      A5 => a(5),
      D => d(7),
      DPO => ram_reg_704_767_7_7_n_0,
      DPRA0 => dpra(0),
      DPRA1 => dpra(1),
      DPRA2 => dpra(2),
      DPRA3 => dpra(3),
      DPRA4 => dpra(4),
      DPRA5 => dpra(5),
      SPO => NLW_ram_reg_704_767_7_7_SPO_UNCONNECTED,
      WCLK => clk,
      WE => ram_reg_704_767_0_2_i_1_n_0
    );
ram_reg_768_831_0_2: unisim.vcomponents.RAM64M
    generic map(
      INIT_A => X"0000000000000000",
      INIT_B => X"0000000000000000",
      INIT_C => X"0000000000000000",
      INIT_D => X"0000000000000000"
    )
        port map (
      ADDRA(5 downto 0) => dpra(5 downto 0),
      ADDRB(5 downto 0) => dpra(5 downto 0),
      ADDRC(5 downto 0) => dpra(5 downto 0),
      ADDRD(5 downto 0) => a(5 downto 0),
      DIA => d(0),
      DIB => d(1),
      DIC => d(2),
      DID => '0',
      DOA => ram_reg_768_831_0_2_n_0,
      DOB => ram_reg_768_831_0_2_n_1,
      DOC => ram_reg_768_831_0_2_n_2,
      DOD => NLW_ram_reg_768_831_0_2_DOD_UNCONNECTED,
      WCLK => clk,
      WE => ram_reg_768_831_0_2_i_1_n_0
    );
ram_reg_768_831_0_2_i_1: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00400000"
    )
        port map (
      I0 => a(7),
      I1 => a(9),
      I2 => a(8),
      I3 => a(6),
      I4 => we,
      O => ram_reg_768_831_0_2_i_1_n_0
    );
ram_reg_768_831_3_5: unisim.vcomponents.RAM64M
    generic map(
      INIT_A => X"0000000000000000",
      INIT_B => X"0000000000000000",
      INIT_C => X"0000000000000000",
      INIT_D => X"0000000000000000"
    )
        port map (
      ADDRA(5 downto 0) => dpra(5 downto 0),
      ADDRB(5 downto 0) => dpra(5 downto 0),
      ADDRC(5 downto 0) => dpra(5 downto 0),
      ADDRD(5 downto 0) => a(5 downto 0),
      DIA => d(3),
      DIB => d(4),
      DIC => d(5),
      DID => '0',
      DOA => ram_reg_768_831_3_5_n_0,
      DOB => ram_reg_768_831_3_5_n_1,
      DOC => ram_reg_768_831_3_5_n_2,
      DOD => NLW_ram_reg_768_831_3_5_DOD_UNCONNECTED,
      WCLK => clk,
      WE => ram_reg_768_831_0_2_i_1_n_0
    );
ram_reg_768_831_6_6: unisim.vcomponents.RAM64X1D
    generic map(
      INIT => X"0000000000000000"
    )
        port map (
      A0 => a(0),
      A1 => a(1),
      A2 => a(2),
      A3 => a(3),
      A4 => a(4),
      A5 => a(5),
      D => d(6),
      DPO => ram_reg_768_831_6_6_n_0,
      DPRA0 => dpra(0),
      DPRA1 => dpra(1),
      DPRA2 => dpra(2),
      DPRA3 => dpra(3),
      DPRA4 => dpra(4),
      DPRA5 => dpra(5),
      SPO => NLW_ram_reg_768_831_6_6_SPO_UNCONNECTED,
      WCLK => clk,
      WE => ram_reg_768_831_0_2_i_1_n_0
    );
ram_reg_768_831_7_7: unisim.vcomponents.RAM64X1D
    generic map(
      INIT => X"0000000000000000"
    )
        port map (
      A0 => a(0),
      A1 => a(1),
      A2 => a(2),
      A3 => a(3),
      A4 => a(4),
      A5 => a(5),
      D => d(7),
      DPO => ram_reg_768_831_7_7_n_0,
      DPRA0 => dpra(0),
      DPRA1 => dpra(1),
      DPRA2 => dpra(2),
      DPRA3 => dpra(3),
      DPRA4 => dpra(4),
      DPRA5 => dpra(5),
      SPO => NLW_ram_reg_768_831_7_7_SPO_UNCONNECTED,
      WCLK => clk,
      WE => ram_reg_768_831_0_2_i_1_n_0
    );
ram_reg_832_895_0_2: unisim.vcomponents.RAM64M
    generic map(
      INIT_A => X"0000000000000000",
      INIT_B => X"0000000000000000",
      INIT_C => X"0000000000000000",
      INIT_D => X"0000000000000000"
    )
        port map (
      ADDRA(5 downto 0) => dpra(5 downto 0),
      ADDRB(5 downto 0) => dpra(5 downto 0),
      ADDRC(5 downto 0) => dpra(5 downto 0),
      ADDRD(5 downto 0) => a(5 downto 0),
      DIA => d(0),
      DIB => d(1),
      DIC => d(2),
      DID => '0',
      DOA => ram_reg_832_895_0_2_n_0,
      DOB => ram_reg_832_895_0_2_n_1,
      DOC => ram_reg_832_895_0_2_n_2,
      DOD => NLW_ram_reg_832_895_0_2_DOD_UNCONNECTED,
      WCLK => clk,
      WE => ram_reg_832_895_0_2_i_1_n_0
    );
ram_reg_832_895_0_2_i_1: unisim.vcomponents.LUT5
    generic map(
      INIT => X"40000000"
    )
        port map (
      I0 => a(7),
      I1 => a(8),
      I2 => a(6),
      I3 => we,
      I4 => a(9),
      O => ram_reg_832_895_0_2_i_1_n_0
    );
ram_reg_832_895_3_5: unisim.vcomponents.RAM64M
    generic map(
      INIT_A => X"0000000000000000",
      INIT_B => X"0000000000000000",
      INIT_C => X"0000000000000000",
      INIT_D => X"0000000000000000"
    )
        port map (
      ADDRA(5 downto 0) => dpra(5 downto 0),
      ADDRB(5 downto 0) => dpra(5 downto 0),
      ADDRC(5 downto 0) => dpra(5 downto 0),
      ADDRD(5 downto 0) => a(5 downto 0),
      DIA => d(3),
      DIB => d(4),
      DIC => d(5),
      DID => '0',
      DOA => ram_reg_832_895_3_5_n_0,
      DOB => ram_reg_832_895_3_5_n_1,
      DOC => ram_reg_832_895_3_5_n_2,
      DOD => NLW_ram_reg_832_895_3_5_DOD_UNCONNECTED,
      WCLK => clk,
      WE => ram_reg_832_895_0_2_i_1_n_0
    );
ram_reg_832_895_6_6: unisim.vcomponents.RAM64X1D
    generic map(
      INIT => X"0000000000000000"
    )
        port map (
      A0 => a(0),
      A1 => a(1),
      A2 => a(2),
      A3 => a(3),
      A4 => a(4),
      A5 => a(5),
      D => d(6),
      DPO => ram_reg_832_895_6_6_n_0,
      DPRA0 => dpra(0),
      DPRA1 => dpra(1),
      DPRA2 => dpra(2),
      DPRA3 => dpra(3),
      DPRA4 => dpra(4),
      DPRA5 => dpra(5),
      SPO => NLW_ram_reg_832_895_6_6_SPO_UNCONNECTED,
      WCLK => clk,
      WE => ram_reg_832_895_0_2_i_1_n_0
    );
ram_reg_832_895_7_7: unisim.vcomponents.RAM64X1D
    generic map(
      INIT => X"0000000000000000"
    )
        port map (
      A0 => a(0),
      A1 => a(1),
      A2 => a(2),
      A3 => a(3),
      A4 => a(4),
      A5 => a(5),
      D => d(7),
      DPO => ram_reg_832_895_7_7_n_0,
      DPRA0 => dpra(0),
      DPRA1 => dpra(1),
      DPRA2 => dpra(2),
      DPRA3 => dpra(3),
      DPRA4 => dpra(4),
      DPRA5 => dpra(5),
      SPO => NLW_ram_reg_832_895_7_7_SPO_UNCONNECTED,
      WCLK => clk,
      WE => ram_reg_832_895_0_2_i_1_n_0
    );
ram_reg_896_959_0_2: unisim.vcomponents.RAM64M
    generic map(
      INIT_A => X"0000000000000000",
      INIT_B => X"0000000000000000",
      INIT_C => X"0000000000000000",
      INIT_D => X"0000000000000000"
    )
        port map (
      ADDRA(5 downto 0) => dpra(5 downto 0),
      ADDRB(5 downto 0) => dpra(5 downto 0),
      ADDRC(5 downto 0) => dpra(5 downto 0),
      ADDRD(5 downto 0) => a(5 downto 0),
      DIA => d(0),
      DIB => d(1),
      DIC => d(2),
      DID => '0',
      DOA => ram_reg_896_959_0_2_n_0,
      DOB => ram_reg_896_959_0_2_n_1,
      DOC => ram_reg_896_959_0_2_n_2,
      DOD => NLW_ram_reg_896_959_0_2_DOD_UNCONNECTED,
      WCLK => clk,
      WE => ram_reg_896_959_0_2_i_1_n_0
    );
ram_reg_896_959_0_2_i_1: unisim.vcomponents.LUT5
    generic map(
      INIT => X"40000000"
    )
        port map (
      I0 => a(6),
      I1 => a(8),
      I2 => a(7),
      I3 => we,
      I4 => a(9),
      O => ram_reg_896_959_0_2_i_1_n_0
    );
ram_reg_896_959_3_5: unisim.vcomponents.RAM64M
    generic map(
      INIT_A => X"0000000000000000",
      INIT_B => X"0000000000000000",
      INIT_C => X"0000000000000000",
      INIT_D => X"0000000000000000"
    )
        port map (
      ADDRA(5 downto 0) => dpra(5 downto 0),
      ADDRB(5 downto 0) => dpra(5 downto 0),
      ADDRC(5 downto 0) => dpra(5 downto 0),
      ADDRD(5 downto 0) => a(5 downto 0),
      DIA => d(3),
      DIB => d(4),
      DIC => d(5),
      DID => '0',
      DOA => ram_reg_896_959_3_5_n_0,
      DOB => ram_reg_896_959_3_5_n_1,
      DOC => ram_reg_896_959_3_5_n_2,
      DOD => NLW_ram_reg_896_959_3_5_DOD_UNCONNECTED,
      WCLK => clk,
      WE => ram_reg_896_959_0_2_i_1_n_0
    );
ram_reg_896_959_6_6: unisim.vcomponents.RAM64X1D
    generic map(
      INIT => X"0000000000000000"
    )
        port map (
      A0 => a(0),
      A1 => a(1),
      A2 => a(2),
      A3 => a(3),
      A4 => a(4),
      A5 => a(5),
      D => d(6),
      DPO => ram_reg_896_959_6_6_n_0,
      DPRA0 => dpra(0),
      DPRA1 => dpra(1),
      DPRA2 => dpra(2),
      DPRA3 => dpra(3),
      DPRA4 => dpra(4),
      DPRA5 => dpra(5),
      SPO => NLW_ram_reg_896_959_6_6_SPO_UNCONNECTED,
      WCLK => clk,
      WE => ram_reg_896_959_0_2_i_1_n_0
    );
ram_reg_896_959_7_7: unisim.vcomponents.RAM64X1D
    generic map(
      INIT => X"0000000000000000"
    )
        port map (
      A0 => a(0),
      A1 => a(1),
      A2 => a(2),
      A3 => a(3),
      A4 => a(4),
      A5 => a(5),
      D => d(7),
      DPO => ram_reg_896_959_7_7_n_0,
      DPRA0 => dpra(0),
      DPRA1 => dpra(1),
      DPRA2 => dpra(2),
      DPRA3 => dpra(3),
      DPRA4 => dpra(4),
      DPRA5 => dpra(5),
      SPO => NLW_ram_reg_896_959_7_7_SPO_UNCONNECTED,
      WCLK => clk,
      WE => ram_reg_896_959_0_2_i_1_n_0
    );
ram_reg_960_1023_0_2: unisim.vcomponents.RAM64M
    generic map(
      INIT_A => X"0000000000000000",
      INIT_B => X"0000000000000000",
      INIT_C => X"0000000000000000",
      INIT_D => X"0000000000000000"
    )
        port map (
      ADDRA(5 downto 0) => dpra(5 downto 0),
      ADDRB(5 downto 0) => dpra(5 downto 0),
      ADDRC(5 downto 0) => dpra(5 downto 0),
      ADDRD(5 downto 0) => a(5 downto 0),
      DIA => d(0),
      DIB => d(1),
      DIC => d(2),
      DID => '0',
      DOA => ram_reg_960_1023_0_2_n_0,
      DOB => ram_reg_960_1023_0_2_n_1,
      DOC => ram_reg_960_1023_0_2_n_2,
      DOD => NLW_ram_reg_960_1023_0_2_DOD_UNCONNECTED,
      WCLK => clk,
      WE => ram_reg_960_1023_0_2_i_1_n_0
    );
ram_reg_960_1023_0_2_i_1: unisim.vcomponents.LUT5
    generic map(
      INIT => X"80000000"
    )
        port map (
      I0 => we,
      I1 => a(7),
      I2 => a(6),
      I3 => a(9),
      I4 => a(8),
      O => ram_reg_960_1023_0_2_i_1_n_0
    );
ram_reg_960_1023_3_5: unisim.vcomponents.RAM64M
    generic map(
      INIT_A => X"0000000000000000",
      INIT_B => X"0000000000000000",
      INIT_C => X"0000000000000000",
      INIT_D => X"0000000000000000"
    )
        port map (
      ADDRA(5 downto 0) => dpra(5 downto 0),
      ADDRB(5 downto 0) => dpra(5 downto 0),
      ADDRC(5 downto 0) => dpra(5 downto 0),
      ADDRD(5 downto 0) => a(5 downto 0),
      DIA => d(3),
      DIB => d(4),
      DIC => d(5),
      DID => '0',
      DOA => ram_reg_960_1023_3_5_n_0,
      DOB => ram_reg_960_1023_3_5_n_1,
      DOC => ram_reg_960_1023_3_5_n_2,
      DOD => NLW_ram_reg_960_1023_3_5_DOD_UNCONNECTED,
      WCLK => clk,
      WE => ram_reg_960_1023_0_2_i_1_n_0
    );
ram_reg_960_1023_6_6: unisim.vcomponents.RAM64X1D
    generic map(
      INIT => X"0000000000000000"
    )
        port map (
      A0 => a(0),
      A1 => a(1),
      A2 => a(2),
      A3 => a(3),
      A4 => a(4),
      A5 => a(5),
      D => d(6),
      DPO => ram_reg_960_1023_6_6_n_0,
      DPRA0 => dpra(0),
      DPRA1 => dpra(1),
      DPRA2 => dpra(2),
      DPRA3 => dpra(3),
      DPRA4 => dpra(4),
      DPRA5 => dpra(5),
      SPO => NLW_ram_reg_960_1023_6_6_SPO_UNCONNECTED,
      WCLK => clk,
      WE => ram_reg_960_1023_0_2_i_1_n_0
    );
ram_reg_960_1023_7_7: unisim.vcomponents.RAM64X1D
    generic map(
      INIT => X"0000000000000000"
    )
        port map (
      A0 => a(0),
      A1 => a(1),
      A2 => a(2),
      A3 => a(3),
      A4 => a(4),
      A5 => a(5),
      D => d(7),
      DPO => ram_reg_960_1023_7_7_n_0,
      DPRA0 => dpra(0),
      DPRA1 => dpra(1),
      DPRA2 => dpra(2),
      DPRA3 => dpra(3),
      DPRA4 => dpra(4),
      DPRA5 => dpra(5),
      SPO => NLW_ram_reg_960_1023_7_7_SPO_UNCONNECTED,
      WCLK => clk,
      WE => ram_reg_960_1023_0_2_i_1_n_0
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity dist_mem_gen_0_dist_mem_gen_v8_0_12_synth is
  port (
    dpo : out STD_LOGIC_VECTOR ( 7 downto 0 );
    clk : in STD_LOGIC;
    d : in STD_LOGIC_VECTOR ( 7 downto 0 );
    dpra : in STD_LOGIC_VECTOR ( 9 downto 0 );
    a : in STD_LOGIC_VECTOR ( 9 downto 0 );
    we : in STD_LOGIC
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of dist_mem_gen_0_dist_mem_gen_v8_0_12_synth : entity is "dist_mem_gen_v8_0_12_synth";
end dist_mem_gen_0_dist_mem_gen_v8_0_12_synth;

architecture STRUCTURE of dist_mem_gen_0_dist_mem_gen_v8_0_12_synth is
begin
\gen_sdp_ram.sdpram_inst\: entity work.dist_mem_gen_0_sdpram
     port map (
      a(9 downto 0) => a(9 downto 0),
      clk => clk,
      d(7 downto 0) => d(7 downto 0),
      dpo(7 downto 0) => dpo(7 downto 0),
      dpra(9 downto 0) => dpra(9 downto 0),
      we => we
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity dist_mem_gen_0_dist_mem_gen_v8_0_12 is
  port (
    a : in STD_LOGIC_VECTOR ( 9 downto 0 );
    d : in STD_LOGIC_VECTOR ( 7 downto 0 );
    dpra : in STD_LOGIC_VECTOR ( 9 downto 0 );
    clk : in STD_LOGIC;
    we : in STD_LOGIC;
    i_ce : in STD_LOGIC;
    qspo_ce : in STD_LOGIC;
    qdpo_ce : in STD_LOGIC;
    qdpo_clk : in STD_LOGIC;
    qspo_rst : in STD_LOGIC;
    qdpo_rst : in STD_LOGIC;
    qspo_srst : in STD_LOGIC;
    qdpo_srst : in STD_LOGIC;
    spo : out STD_LOGIC_VECTOR ( 7 downto 0 );
    dpo : out STD_LOGIC_VECTOR ( 7 downto 0 );
    qspo : out STD_LOGIC_VECTOR ( 7 downto 0 );
    qdpo : out STD_LOGIC_VECTOR ( 7 downto 0 )
  );
  attribute C_ADDR_WIDTH : integer;
  attribute C_ADDR_WIDTH of dist_mem_gen_0_dist_mem_gen_v8_0_12 : entity is 10;
  attribute C_DEFAULT_DATA : string;
  attribute C_DEFAULT_DATA of dist_mem_gen_0_dist_mem_gen_v8_0_12 : entity is "0";
  attribute C_DEPTH : integer;
  attribute C_DEPTH of dist_mem_gen_0_dist_mem_gen_v8_0_12 : entity is 1024;
  attribute C_ELABORATION_DIR : string;
  attribute C_ELABORATION_DIR of dist_mem_gen_0_dist_mem_gen_v8_0_12 : entity is "./";
  attribute C_FAMILY : string;
  attribute C_FAMILY of dist_mem_gen_0_dist_mem_gen_v8_0_12 : entity is "zynq";
  attribute C_HAS_CLK : integer;
  attribute C_HAS_CLK of dist_mem_gen_0_dist_mem_gen_v8_0_12 : entity is 1;
  attribute C_HAS_D : integer;
  attribute C_HAS_D of dist_mem_gen_0_dist_mem_gen_v8_0_12 : entity is 1;
  attribute C_HAS_DPO : integer;
  attribute C_HAS_DPO of dist_mem_gen_0_dist_mem_gen_v8_0_12 : entity is 1;
  attribute C_HAS_DPRA : integer;
  attribute C_HAS_DPRA of dist_mem_gen_0_dist_mem_gen_v8_0_12 : entity is 1;
  attribute C_HAS_I_CE : integer;
  attribute C_HAS_I_CE of dist_mem_gen_0_dist_mem_gen_v8_0_12 : entity is 0;
  attribute C_HAS_QDPO : integer;
  attribute C_HAS_QDPO of dist_mem_gen_0_dist_mem_gen_v8_0_12 : entity is 0;
  attribute C_HAS_QDPO_CE : integer;
  attribute C_HAS_QDPO_CE of dist_mem_gen_0_dist_mem_gen_v8_0_12 : entity is 0;
  attribute C_HAS_QDPO_CLK : integer;
  attribute C_HAS_QDPO_CLK of dist_mem_gen_0_dist_mem_gen_v8_0_12 : entity is 0;
  attribute C_HAS_QDPO_RST : integer;
  attribute C_HAS_QDPO_RST of dist_mem_gen_0_dist_mem_gen_v8_0_12 : entity is 0;
  attribute C_HAS_QDPO_SRST : integer;
  attribute C_HAS_QDPO_SRST of dist_mem_gen_0_dist_mem_gen_v8_0_12 : entity is 0;
  attribute C_HAS_QSPO : integer;
  attribute C_HAS_QSPO of dist_mem_gen_0_dist_mem_gen_v8_0_12 : entity is 0;
  attribute C_HAS_QSPO_CE : integer;
  attribute C_HAS_QSPO_CE of dist_mem_gen_0_dist_mem_gen_v8_0_12 : entity is 0;
  attribute C_HAS_QSPO_RST : integer;
  attribute C_HAS_QSPO_RST of dist_mem_gen_0_dist_mem_gen_v8_0_12 : entity is 0;
  attribute C_HAS_QSPO_SRST : integer;
  attribute C_HAS_QSPO_SRST of dist_mem_gen_0_dist_mem_gen_v8_0_12 : entity is 0;
  attribute C_HAS_SPO : integer;
  attribute C_HAS_SPO of dist_mem_gen_0_dist_mem_gen_v8_0_12 : entity is 0;
  attribute C_HAS_WE : integer;
  attribute C_HAS_WE of dist_mem_gen_0_dist_mem_gen_v8_0_12 : entity is 1;
  attribute C_MEM_INIT_FILE : string;
  attribute C_MEM_INIT_FILE of dist_mem_gen_0_dist_mem_gen_v8_0_12 : entity is "no_coe_file_loaded";
  attribute C_MEM_TYPE : integer;
  attribute C_MEM_TYPE of dist_mem_gen_0_dist_mem_gen_v8_0_12 : entity is 4;
  attribute C_PARSER_TYPE : integer;
  attribute C_PARSER_TYPE of dist_mem_gen_0_dist_mem_gen_v8_0_12 : entity is 1;
  attribute C_PIPELINE_STAGES : integer;
  attribute C_PIPELINE_STAGES of dist_mem_gen_0_dist_mem_gen_v8_0_12 : entity is 0;
  attribute C_QCE_JOINED : integer;
  attribute C_QCE_JOINED of dist_mem_gen_0_dist_mem_gen_v8_0_12 : entity is 0;
  attribute C_QUALIFY_WE : integer;
  attribute C_QUALIFY_WE of dist_mem_gen_0_dist_mem_gen_v8_0_12 : entity is 0;
  attribute C_READ_MIF : integer;
  attribute C_READ_MIF of dist_mem_gen_0_dist_mem_gen_v8_0_12 : entity is 0;
  attribute C_REG_A_D_INPUTS : integer;
  attribute C_REG_A_D_INPUTS of dist_mem_gen_0_dist_mem_gen_v8_0_12 : entity is 0;
  attribute C_REG_DPRA_INPUT : integer;
  attribute C_REG_DPRA_INPUT of dist_mem_gen_0_dist_mem_gen_v8_0_12 : entity is 0;
  attribute C_SYNC_ENABLE : integer;
  attribute C_SYNC_ENABLE of dist_mem_gen_0_dist_mem_gen_v8_0_12 : entity is 1;
  attribute C_WIDTH : integer;
  attribute C_WIDTH of dist_mem_gen_0_dist_mem_gen_v8_0_12 : entity is 8;
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of dist_mem_gen_0_dist_mem_gen_v8_0_12 : entity is "dist_mem_gen_v8_0_12";
end dist_mem_gen_0_dist_mem_gen_v8_0_12;

architecture STRUCTURE of dist_mem_gen_0_dist_mem_gen_v8_0_12 is
  signal \<const0>\ : STD_LOGIC;
begin
  qdpo(7) <= \<const0>\;
  qdpo(6) <= \<const0>\;
  qdpo(5) <= \<const0>\;
  qdpo(4) <= \<const0>\;
  qdpo(3) <= \<const0>\;
  qdpo(2) <= \<const0>\;
  qdpo(1) <= \<const0>\;
  qdpo(0) <= \<const0>\;
  qspo(7) <= \<const0>\;
  qspo(6) <= \<const0>\;
  qspo(5) <= \<const0>\;
  qspo(4) <= \<const0>\;
  qspo(3) <= \<const0>\;
  qspo(2) <= \<const0>\;
  qspo(1) <= \<const0>\;
  qspo(0) <= \<const0>\;
  spo(7) <= \<const0>\;
  spo(6) <= \<const0>\;
  spo(5) <= \<const0>\;
  spo(4) <= \<const0>\;
  spo(3) <= \<const0>\;
  spo(2) <= \<const0>\;
  spo(1) <= \<const0>\;
  spo(0) <= \<const0>\;
GND: unisim.vcomponents.GND
     port map (
      G => \<const0>\
    );
\synth_options.dist_mem_inst\: entity work.dist_mem_gen_0_dist_mem_gen_v8_0_12_synth
     port map (
      a(9 downto 0) => a(9 downto 0),
      clk => clk,
      d(7 downto 0) => d(7 downto 0),
      dpo(7 downto 0) => dpo(7 downto 0),
      dpra(9 downto 0) => dpra(9 downto 0),
      we => we
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity dist_mem_gen_0 is
  port (
    a : in STD_LOGIC_VECTOR ( 9 downto 0 );
    d : in STD_LOGIC_VECTOR ( 7 downto 0 );
    dpra : in STD_LOGIC_VECTOR ( 9 downto 0 );
    clk : in STD_LOGIC;
    we : in STD_LOGIC;
    dpo : out STD_LOGIC_VECTOR ( 7 downto 0 )
  );
  attribute NotValidForBitStream : boolean;
  attribute NotValidForBitStream of dist_mem_gen_0 : entity is true;
  attribute CHECK_LICENSE_TYPE : string;
  attribute CHECK_LICENSE_TYPE of dist_mem_gen_0 : entity is "dist_mem_gen_0,dist_mem_gen_v8_0_12,{}";
  attribute downgradeipidentifiedwarnings : string;
  attribute downgradeipidentifiedwarnings of dist_mem_gen_0 : entity is "yes";
  attribute x_core_info : string;
  attribute x_core_info of dist_mem_gen_0 : entity is "dist_mem_gen_v8_0_12,Vivado 2017.4";
end dist_mem_gen_0;

architecture STRUCTURE of dist_mem_gen_0 is
  signal NLW_U0_qdpo_UNCONNECTED : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal NLW_U0_qspo_UNCONNECTED : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal NLW_U0_spo_UNCONNECTED : STD_LOGIC_VECTOR ( 7 downto 0 );
  attribute C_FAMILY : string;
  attribute C_FAMILY of U0 : label is "zynq";
  attribute C_HAS_CLK : integer;
  attribute C_HAS_CLK of U0 : label is 1;
  attribute C_HAS_D : integer;
  attribute C_HAS_D of U0 : label is 1;
  attribute C_HAS_DPO : integer;
  attribute C_HAS_DPO of U0 : label is 1;
  attribute C_HAS_DPRA : integer;
  attribute C_HAS_DPRA of U0 : label is 1;
  attribute C_HAS_QDPO : integer;
  attribute C_HAS_QDPO of U0 : label is 0;
  attribute C_HAS_QDPO_CE : integer;
  attribute C_HAS_QDPO_CE of U0 : label is 0;
  attribute C_HAS_QDPO_CLK : integer;
  attribute C_HAS_QDPO_CLK of U0 : label is 0;
  attribute C_HAS_QDPO_RST : integer;
  attribute C_HAS_QDPO_RST of U0 : label is 0;
  attribute C_HAS_QDPO_SRST : integer;
  attribute C_HAS_QDPO_SRST of U0 : label is 0;
  attribute C_HAS_QSPO : integer;
  attribute C_HAS_QSPO of U0 : label is 0;
  attribute C_HAS_QSPO_RST : integer;
  attribute C_HAS_QSPO_RST of U0 : label is 0;
  attribute C_HAS_QSPO_SRST : integer;
  attribute C_HAS_QSPO_SRST of U0 : label is 0;
  attribute C_HAS_SPO : integer;
  attribute C_HAS_SPO of U0 : label is 0;
  attribute C_HAS_WE : integer;
  attribute C_HAS_WE of U0 : label is 1;
  attribute C_MEM_TYPE : integer;
  attribute C_MEM_TYPE of U0 : label is 4;
  attribute C_REG_DPRA_INPUT : integer;
  attribute C_REG_DPRA_INPUT of U0 : label is 0;
  attribute c_addr_width : integer;
  attribute c_addr_width of U0 : label is 10;
  attribute c_default_data : string;
  attribute c_default_data of U0 : label is "0";
  attribute c_depth : integer;
  attribute c_depth of U0 : label is 1024;
  attribute c_elaboration_dir : string;
  attribute c_elaboration_dir of U0 : label is "./";
  attribute c_has_i_ce : integer;
  attribute c_has_i_ce of U0 : label is 0;
  attribute c_has_qspo_ce : integer;
  attribute c_has_qspo_ce of U0 : label is 0;
  attribute c_mem_init_file : string;
  attribute c_mem_init_file of U0 : label is "no_coe_file_loaded";
  attribute c_parser_type : integer;
  attribute c_parser_type of U0 : label is 1;
  attribute c_pipeline_stages : integer;
  attribute c_pipeline_stages of U0 : label is 0;
  attribute c_qce_joined : integer;
  attribute c_qce_joined of U0 : label is 0;
  attribute c_qualify_we : integer;
  attribute c_qualify_we of U0 : label is 0;
  attribute c_read_mif : integer;
  attribute c_read_mif of U0 : label is 0;
  attribute c_reg_a_d_inputs : integer;
  attribute c_reg_a_d_inputs of U0 : label is 0;
  attribute c_sync_enable : integer;
  attribute c_sync_enable of U0 : label is 1;
  attribute c_width : integer;
  attribute c_width of U0 : label is 8;
begin
U0: entity work.dist_mem_gen_0_dist_mem_gen_v8_0_12
     port map (
      a(9 downto 0) => a(9 downto 0),
      clk => clk,
      d(7 downto 0) => d(7 downto 0),
      dpo(7 downto 0) => dpo(7 downto 0),
      dpra(9 downto 0) => dpra(9 downto 0),
      i_ce => '1',
      qdpo(7 downto 0) => NLW_U0_qdpo_UNCONNECTED(7 downto 0),
      qdpo_ce => '1',
      qdpo_clk => '0',
      qdpo_rst => '0',
      qdpo_srst => '0',
      qspo(7 downto 0) => NLW_U0_qspo_UNCONNECTED(7 downto 0),
      qspo_ce => '1',
      qspo_rst => '0',
      qspo_srst => '0',
      spo(7 downto 0) => NLW_U0_spo_UNCONNECTED(7 downto 0),
      we => we
    );
end STRUCTURE;
