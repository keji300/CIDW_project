`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2018/11/29 17:38:27
// Design Name: 
// Module Name: wr_pl_ddr3
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


module wr_pl_ddr3(
	input			clk					,
	input			rst					,
	input			ddr3_init_complet	,
	input			pl_ddr_wr_start		,
	input	[31:0]	pl_ddr_wr_addr		,
	input	[31:0]	pl_ddr_wr_length	,
	input			pl_ddr_wr_en		,
	input	[31:0]	pl_ddr_wr_data		,
	
	input			s_axis_s2mm_cmd_tready	,
	output			s_axis_s2mm_cmd_tvalid	,
	output	[71:0]	s_axis_s2mm_cmd_tdata	,
	
	input			s_axis_s2mm_tready		,
	output	[31:0]	s_axis_s2mm_tdata		,
	output	[3:0]	s_axis_s2mm_tkeep		,
	output			s_axis_s2mm_tlast		,
	output			s_axis_s2mm_tvalid		
    );
	
	//parameter start_addr	= 32'h0000_0000;
	//parameter PKG_NUM		= 32'd1;
	//parameter btt			= 23'd320;// 80x32/8=320
	parameter w_type		= 1'b1;
	parameter eof			= 1'b1;
	
	reg		[2:0]	state;
	reg				fifo_wr_en;
	reg		[31:0]	fifo_wr_data;
	wire			fifo_empty;
	wire			fifo_rd_en;
	reg		[31:0]	fifo_rd_cnt;
	wire	[31:0]	fifo_rd_data;
	
	reg		[22:0]	btt;
	reg		[31:0]	addr;
	reg		[3:0]	cnt;
	reg				start_wr_catch;//捕获寄存器
	reg				start_wr_sync;//同步寄存器
	wire			start_wr_rise;//上升沿
	
	/* ila_0 ila_0_inst (
		.clk(clk), // input wire clk
		.probe0({
				addr,
				btt,
				s_axis_s2mm_cmd_tvalid,
				s_axis_s2mm_tdata,
				s_axis_s2mm_tvalid,
				s_axis_s2mm_tlast
				}) // input wire [99:0] probe0
	); */
	
	always @ (posedge clk, posedge rst)
	begin
		if (rst)
			state <= 0;
		else
			case (state)
				3'd0	:	if (ddr3_init_complet)//等待DDR初始化结束
								state <= 1;
							else
								state <= 0;
				
				3'd1	:	if (start_wr_rise)//等待数据
								state <= 2;
							else
								state <= 1;
				
				3'd2	:	if (s_axis_s2mm_cmd_tready)//等待AXI总线空闲,发送命令
								state <= 3;
							else
								state <= 2;
				
				3'd3	:	if (cnt == 15)//命令发送后需要至少等待10clk
								state <= 4;
							else
								state <= 3;
				
				3'd4	:	if (s_axis_s2mm_tlast)//等待本次数据传输完成
								state <= 1;
							else
								state <= 4;
				
				default	:	state <= 0;
			endcase
	end 
	
	always @ (posedge clk)
	begin
		start_wr_catch <= pl_ddr_wr_start;
		start_wr_sync <= start_wr_catch;
	end
	
	assign start_wr_rise = ~start_wr_sync && start_wr_catch;
	
	always @ (posedge clk, posedge rst)
	begin
		if (rst)
		begin
			fifo_wr_en <= 0;
			fifo_wr_data <= 0;
		end
		else
		begin
			fifo_wr_en <= pl_ddr_wr_en;
			fifo_wr_data <= pl_ddr_wr_data;
		end
	end
	
	always @ (posedge clk, posedge rst)
	begin
		if (rst)
			cnt <= 0;
		else if (state == 3)
			cnt <= cnt + 1'd1;
		else
			cnt <= 0;
	end
	
	always @ (posedge clk, posedge rst)
	begin
		if (rst)
			addr <= 0;
		else 
			addr <= pl_ddr_wr_addr;
	end
	
	always @ (posedge clk, posedge rst)
	begin
		if (rst)
			btt <= 0;
		else
			btt <= pl_ddr_wr_length[22:0];
	end
	
	assign s_axis_s2mm_cmd_tvalid = (state == 2 && s_axis_s2mm_cmd_tready) ? 1'b1 : 1'b0;
	assign s_axis_s2mm_cmd_tdata = {4'b0000,4'b0000,addr,1'b0,eof,6'b000000,w_type,btt};
	
	assign fifo_rd_en = (state == 4) && (~fifo_empty) && s_axis_s2mm_tready;
	
	always @ (posedge clk, posedge rst)
	begin
		if (rst)
			fifo_rd_cnt <= 0;
		else if (start_wr_rise)
			fifo_rd_cnt <= 0;
		else if (fifo_rd_en)
			if (fifo_rd_cnt == btt[22:2] - 1)
				fifo_rd_cnt <= 0;
			else
				fifo_rd_cnt <= fifo_rd_cnt + 1'd1;
		else
			fifo_rd_cnt <= fifo_rd_cnt;
	end
	
	assign s_axis_s2mm_tvalid = fifo_rd_en;
	assign s_axis_s2mm_tdata = fifo_rd_data;
	assign s_axis_s2mm_tlast = (fifo_rd_cnt == btt[22:2] - 1 && fifo_rd_en) ? 1'b1 : 1'b0;
	assign s_axis_s2mm_tkeep = 4'hf;
	
	first_fifo_w32_d512 first_fifo_w32_d512_inst (
		.clk	(clk),      	// input wire clk
		.srst	(rst),    		// input wire srst
		.din	(fifo_wr_data),	// input wire [31 : 0] din
		.wr_en	(fifo_wr_en),	// input wire wr_en
		.rd_en	(fifo_rd_en),	// input wire rd_en
		.dout	(fifo_rd_data),	// output wire [31 : 0] dout
		.full	(),				// output wire full
		.empty	(fifo_empty)	// output wire empty
	);
	
endmodule
