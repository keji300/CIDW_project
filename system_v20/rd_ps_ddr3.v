`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2018/12/10 09:53:32
// Design Name: 
// Module Name: rd_ps_ddr3
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module rd_ps_ddr3(
	input			rst,
	input			clk_ps,
	
	input			ps_ddr_rd_start,
	input	[31:0]	ps_ddr_rd_addr,
	input	[31:0]	ps_ddr_rd_length,
	
	input			s_axis_mm2s_cmd_tready,
	output			s_axis_mm2s_cmd_tvalid,
	output	[71:0]	s_axis_mm2s_cmd_tdata,
	
	input			m_axis_mm2s_tlast,
	input			m_axis_mm2s_tvalid,
	input	[3:0]	m_axis_mm2s_tkeep,
	input	[31:0]	m_axis_mm2s_tdata,
	output			m_axis_mm2s_tready,
	
	output	reg 		ps_ddr_rd_en,
	output	reg [31:0]	ps_ddr_rd_data
    );
	
	parameter w_type = 1'b1;
	parameter eof	 = 1'b1;
	
	reg		[1:0]	state;
	reg				ps_ddr_rd_start_del1;
	reg				ps_ddr_rd_start_del2;
	wire			ps_ddr_rd_start_rise;
	reg		[22:0]	btt;
	reg		[31:0]	addr;
	
	always @ (posedge clk_ps, posedge rst)
	begin
		if (rst)
			state <= 0;
		else
			case (state)
				2'd0	:	if (ps_ddr_rd_start_rise)
								state <= 1;
							else
								state <= 0;
				
				2'd1	:	if (s_axis_mm2s_cmd_tready)
								state <= 2;
							else
								state <= 1;
				
				2'd2	:	if (m_axis_mm2s_tlast)
								state <= 0;
							else
								state <= 2;
				
				default	:	state <= 0;
			endcase
	end 
	
	always @ (posedge clk_ps)
	begin
		ps_ddr_rd_start_del1 <= ps_ddr_rd_start;
		ps_ddr_rd_start_del2 <= ps_ddr_rd_start_del1;
	end
	
	assign ps_ddr_rd_start_rise = ~ps_ddr_rd_start_del2 && ps_ddr_rd_start_del1;
	
	always @ (posedge clk_ps, posedge rst)
	begin
		if (rst)
			btt <= 0;
		else
			btt <= ps_ddr_rd_length[22:0];
	end
	
	always @ (posedge clk_ps, posedge rst)
	begin
		if (rst)
			addr <= 0;
		else
			addr <= ps_ddr_rd_addr;
	end
	
	assign s_axis_mm2s_cmd_tvalid = s_axis_mm2s_cmd_tready && (state == 1);
	assign s_axis_mm2s_cmd_tdata = {4'b0000,4'b0000,addr,1'b0,eof,6'b000000,w_type,btt};
	
	always @ (posedge clk_ps, posedge rst)
	begin
		if (rst)
			ps_ddr_rd_en <= 0;
		else
			ps_ddr_rd_en <= m_axis_mm2s_tvalid;
	end
	
	always @ (posedge clk_ps, posedge rst)
	begin
		if (rst)
			ps_ddr_rd_data <= 0;
		else
			ps_ddr_rd_data <= m_axis_mm2s_tdata;
	end
	
	assign m_axis_mm2s_tready = 1;
	
endmodule
