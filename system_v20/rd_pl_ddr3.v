`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2018/11/29 18:32:04
// Design Name: 
// Module Name: rd_pl_ddr3
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


module rd_pl_ddr3(
	input			clk					,
	input			rst					,
	input			ddr3_init_complet	,
	input			pl_ddr_rd_start		,
	input	[31:0]	pl_ddr_rd_addr		,
	input	[31:0]	pl_ddr_rd_length	,
	
	output	reg 		pl_ddr_rd_en	,
	output	reg [31:0]	pl_ddr_rd_data	,
	
	input			s_axis_mm2s_cmd_tready	,
	output			s_axis_mm2s_cmd_tvalid	,
	output	[71:0]	s_axis_mm2s_cmd_tdata	,
	
	input			m_axis_mm2s_tlast		,
	input			m_axis_mm2s_tvalid		,
	input	[3:0]	m_axis_mm2s_tkeep		,
	input	[31:0]	m_axis_mm2s_tdata		,
	output			m_axis_mm2s_tready		
    );
	
	//parameter PKG_NUM		= 32'd1;
	//parameter start_addr	= 32'h0000_0000;
	//parameter btt			= 23'd320;
	parameter w_type		= 1'b1;
	parameter eof			= 1'b1;

	reg		[1:0]	state;
	reg		[31:0]	addr;
	reg		[22:0]	btt;
	reg				m_axis_mm2s_tlast_del;
	reg				start_rd_catch,start_rd_sync;
	wire			start_rd_rise;
	
	always @ (posedge clk, posedge rst)
	begin
		if (rst)
			state <= 0;
		else
			case (state)
				2'd0	:	if (ddr3_init_complet)
								state <= 0;
							else
								state <= 1;
				
				2'd1	:	if (start_rd_rise)
								state <= 2;
							else
								state <= 1;
				
				2'd2	:	if (s_axis_mm2s_cmd_tready)
								state <= 3;
							else
								state <= 2;
				
				2'd3	:	if (~m_axis_mm2s_tlast_del && m_axis_mm2s_tlast)
								state <= 1;
							else
								state <= 3;
				
				default	:	state <= 0;
			endcase
	end 
	
	always @ (posedge clk)
	begin
		start_rd_catch <= pl_ddr_rd_start;
		start_rd_sync <= start_rd_catch;
		m_axis_mm2s_tlast_del <= m_axis_mm2s_tlast;
	end
	
	assign start_rd_rise = ~start_rd_sync && start_rd_catch;
	
	always @ (posedge clk, posedge rst)
	begin
		if (rst)
			addr <= 0;
		else
			addr <= pl_ddr_rd_addr;
	end
	
	always @ (posedge clk, posedge rst)
	begin
		if (rst)
			btt <= 0;
		else
			btt <= pl_ddr_rd_length[22:0];
	end
	
	assign s_axis_mm2s_cmd_tvalid = (state == 2 && s_axis_mm2s_cmd_tready) ? 1'b1 : 1'b0;
	assign s_axis_mm2s_cmd_tdata = {4'b0000,4'b0000,addr,1'b0,eof,6'b000000,w_type,btt};
	
	assign m_axis_mm2s_tready = 1;
	
	always @ (posedge clk, posedge rst)
	begin
		if (rst)
			pl_ddr_rd_en <= 0;
		else
			pl_ddr_rd_en <= m_axis_mm2s_tvalid;
	end
	
	always @ (posedge clk, posedge rst)
	begin
		if (rst)
			pl_ddr_rd_data <= 0;
		else
			pl_ddr_rd_data <= m_axis_mm2s_tdata;
	end
	
endmodule
