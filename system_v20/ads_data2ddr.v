`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2018/11/06 13:51:28
// Design Name: 
// Module Name: ads_data2ddr
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


module ads_data2ddr(
	input			clk_ps,
	input			rst,
	input			data_valid,
	input	[31:0]	data,
	input			select,
	output	reg	[31:0]	pack_num,
	
	input				s_axis_s2mm_cmd_tready	,
	output				s_axis_s2mm_cmd_tvalid	,
	output		[71:0]	s_axis_s2mm_cmd_tdata	,
	
	input				s_axis_s2mm_tready		,
	output	[63:0]		s_axis_s2mm_tdata		,
	output	[7:0]		s_axis_s2mm_tkeep		,
	output				s_axis_s2mm_tlast		,
	output				s_axis_s2mm_tvalid		
    );
	
	/* ila_0 ILA0(
		.clk(clk_ps), // input wire clk
		.probe0({
				fifo_wr_en	,
				fifo_wr_cnt	,
				fifo_wr_data,
				select_state,
				test_data,
				data_valid,
				num,
				s_axis_s2mm_tlast
				}) // input wire [99:0] probe0
	);
	
	ila_0 ILA1(
		.clk(clk_ps), // input wire clk
		.probe0({
				addr,
				s_axis_s2mm_cmd_tvalid,
				s_axis_s2mm_tvalid,
				s_axis_s2mm_tready,
				s_axis_s2mm_tdata,
				s_axis_s2mm_tlast
				}) // input wire [99:0] probe0
	); */
	
	parameter DATA_PACK		= 8'd10;
	parameter START_ADDR	= 32'h3e00_0000;
	parameter btt			= 23'd320;// 80x32/8=320
	parameter w_type		= 1'b1;
	parameter eof			= 1'b1;
	
	reg		[1:0]	state;
	reg		[3:0]	cnt;
	reg				fifo_wr_en;
	reg		[6:0]	fifo_wr_cnt;
	reg		[31:0]	fifo_wr_data;
	wire			fifo_empty;
	wire			fifo_rd_en;
	reg		[5:0]	fifo_rd_cnt;
	wire	[63:0]	fifo_rd_data;
	
	reg		[31:0]	addr;
	reg		[31:0]	test_data;
	reg		[6:0]	num;
	reg				select_del;
	reg		[1:0]	select_state;
	
	always @ (posedge clk_ps, posedge rst)
	begin
		if (rst)
			select_state <= 0;
		else
			case (select_state)
				2'd0	:	if (~select_del && select)
								select_state <= 1;
							else
								select_state <= 0;
				
				2'd1	:	if (s_axis_s2mm_tlast)
								select_state <= 2;
							else
								select_state <= 1;
				
				2'd2	:	if (~select && select_del)
								select_state <= 3;
							else
								select_state <= 2;
				
				2'd3	:	if (s_axis_s2mm_tlast)
								select_state <= 0;
							else
								select_state <= 3;
				
				default	:	select_state <= 0;
			endcase
	end
	
	always @ (posedge clk_ps) select_del <= select;
	
	always @ (posedge clk_ps, posedge rst)
	begin
		if (rst)
			num <= 0;
		else if (data_valid)
			if (num == 79)
				num <= 0;
			else
				num <= num + 1'd1;
		else
			num <= num;
	end
	
	always @ (posedge clk_ps, posedge rst)
	begin
		if (rst)
			test_data <= 0;
		else if (~select_del && select)
			test_data <= 0;
		else if (select_state == 2 || select_state == 3)
			if (data_valid && num == 79)
				test_data <= test_data + 1'd1;
			else
				test_data <= test_data;
		else
			test_data <= 0;
	end
	
	always @ (posedge clk_ps, posedge rst)
	begin
		if (rst)
			state <= 0;
		else
			case (state)
				2'd0	:	if (fifo_wr_cnt == 0 && fifo_wr_en)
								state <= 1;
							else
								state <= 0;
				
				2'd1	:	if (s_axis_s2mm_cmd_tready)
								state <= 2;
							else
								state <= 1;
				
				2'd2	:	if (cnt == 15)
								state <= 3;
							else
								state <= 2;
				
				2'd3	:	if (s_axis_s2mm_tlast)
								state <= 0;
							else
								state <= 3;
				
				default	:	state <= 0;
			endcase
	end
	
	always @ (posedge clk_ps, posedge rst)
	begin
		if (rst)
			fifo_wr_en <= 0;
		else
			fifo_wr_en <= data_valid;
	end
	
	always @ (posedge clk_ps, posedge rst)
	begin
		if (rst)
			fifo_wr_cnt <= 0;
		else if (fifo_wr_en)
			if (fifo_wr_cnt == 80 - 1)
				fifo_wr_cnt <= 0;
			else
				fifo_wr_cnt <= fifo_wr_cnt + 1'd1;
		else
			fifo_wr_cnt <= fifo_wr_cnt;
	end
	
	always @ (posedge clk_ps, posedge rst)
	begin
		if (rst)
			fifo_wr_data <= 0;
		else if (select)
			fifo_wr_data <= test_data;
		else
			fifo_wr_data <= data;
	end
	
	always @ (posedge clk_ps, posedge rst)
	begin
		if (rst)
			cnt <= 0;
		else if (state == 2)
			cnt <= cnt + 1'd1;
		else
			cnt <= 0;
	end
	
	assign s_axis_s2mm_cmd_tvalid = (state == 1 && s_axis_s2mm_cmd_tready) ? 1'b1 : 1'b0;
	
	always @ (posedge clk_ps, posedge rst)
	begin
		if (rst)
			addr <= START_ADDR;
		else if (s_axis_s2mm_tlast)
			if (addr == START_ADDR + (DATA_PACK - 1)*btt)
				addr <= START_ADDR;
			else
				addr <= addr + btt;
		else
			addr <= addr;
	end
	
	assign s_axis_s2mm_cmd_tdata = {4'b0000,4'b0000, addr,1'b0,eof,6'b000000,w_type,btt};
	
	assign fifo_rd_en = (~fifo_empty) && (state == 3) && s_axis_s2mm_tready;
	
	always @ (posedge clk_ps, posedge rst)
	begin
		if (rst)
			fifo_rd_cnt <= 0;
		else if (fifo_rd_en)
			if (fifo_rd_cnt == 40 - 1)
				fifo_rd_cnt <= 0;
			else
				fifo_rd_cnt <= fifo_rd_cnt + 1'd1;
		else
			fifo_rd_cnt <= fifo_rd_cnt;
	end
	
	first_fifo_in32_out64 first_fifo_in32_out64_inst (
		.wr_clk		(clk_ps),            
		.wr_rst		(rst),            
		.rd_clk		(clk_ps),            
		.rd_rst		(rst),            
		.din		(fifo_wr_data),                  
		.wr_en		(fifo_wr_en),              
		.rd_en		(fifo_rd_en),              
		.dout		(fifo_rd_data),                
		.full		(),                
		.empty		(fifo_empty)
	);
	
	assign s_axis_s2mm_tdata = {fifo_rd_data[31:0],fifo_rd_data[63:32]};
	assign s_axis_s2mm_tkeep = 8'hff;
	assign s_axis_s2mm_tvalid = fifo_rd_en;
	assign s_axis_s2mm_tlast = ((fifo_rd_cnt == 40 - 1) && fifo_rd_en) ? 1'b1 : 1'b0;
	
	always @ (posedge clk_ps, posedge rst)
	begin
		if (rst)
			pack_num <= 0;
		else if (s_axis_s2mm_tlast)
			if (pack_num == 10)
				pack_num <= 1;
			else
				pack_num <= pack_num + 1;
		else
			pack_num <= pack_num;
	end
	
endmodule
