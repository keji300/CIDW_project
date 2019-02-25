// Copyright 1986-2017 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2017.4 (win64) Build 2086221 Fri Dec 15 20:55:39 MST 2017
// Date        : Thu Feb 14 09:46:58 2019
// Host        : PC-20181124UOWH running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode synth_stub
//               d:/FPGA_CIDW/dual_ram2/uart_dpram/uart_dpram.srcs/sources_1/ip/dist_mem_gen_0/dist_mem_gen_0_stub.v
// Design      : dist_mem_gen_0
// Purpose     : Stub declaration of top-level module interface
// Device      : xc7z020clg484-2
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* x_core_info = "dist_mem_gen_v8_0_12,Vivado 2017.4" *)
module dist_mem_gen_0(a, d, dpra, clk, we, dpo)
/* synthesis syn_black_box black_box_pad_pin="a[9:0],d[7:0],dpra[9:0],clk,we,dpo[7:0]" */;
  input [9:0]a;
  input [7:0]d;
  input [9:0]dpra;
  input clk;
  input we;
  output [7:0]dpo;
endmodule
