`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2018/11/30 09:47:05
// Design Name: 
// Module Name: wr_ps_ddr3
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


module wr_ps_ddr3(
	input			rst					,
	input			clk_ps				,
	input			ps_ddr_wr_start		,
	input	[31:0]	ps_ddr_wr_addr		,
	input	[31:0]	ps_ddr_wr_length	,
	input			ps_ddr_wr_en		,
	input	[31:0]	ps_ddr_wr_data		,
	
	input			s_axis_s2mm_cmd_tready	,
	output			s_axis_s2mm_cmd_tvalid	,
	output	[71:0]	s_axis_s2mm_cmd_tdata	,
	
	input			s_axis_s2mm_tready		,
	output	[63:0]	s_axis_s2mm_tdata		,
	output	[7:0]	s_axis_s2mm_tkeep		,
	output			s_axis_s2mm_tlast		,
	output			s_axis_s2mm_tvalid		
    );
	
	//parameter DATA_PACK		= 8'd10;
	//parameter START_ADDR	= 32'h3e00_0000;
	//parameter btt			= 23'd320;// 80x32/8=320
	parameter w_type		= 1'b1;
	parameter eof			= 1'b1;
	
	reg		[1:0]	state;
	reg		[3:0]	cnt;
	reg				fifo_wr_en;
	reg		[31:0]	fifo_wr_data;
	wire			fifo_empty;
	wire			fifo_rd_en;
	reg		[31:0]	fifo_rd_cnt;
	wire	[63:0]	fifo_rd_data;
	
	reg		[22:0]	btt;
	reg		[31:0]	addr;
	reg				start_wr_catch;//²¶»ñ¼Ä´æÆ÷
	reg				start_wr_sync;//Í¬²½¼Ä´æÆ÷
	wire			start_wr_rise;//ÉÏÉýÑØ		
	
	/* ila_0 ila_0_inst (
		.clk(clk_ps), // input wire clk
		.probe0({
				ps_ddr_wr_en,
				ps_ddr_wr_data
				}) // input wire [99:0] probe0
	); */
	
	always @ (posedge clk_ps, posedge rst)
	begin
		if (rst)
			state <= 0;
		else
			case (state)
				2'd0	:	if (start_wr_rise)
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
	
	always @ (posedge clk_ps)
	begin
		start_wr_catch <= ps_ddr_wr_start;
		start_wr_sync <= start_wr_catch;
	end
	
	assign start_wr_rise = ~start_wr_sync && start_wr_catch;
	
	always @ (posedge clk_ps, posedge rst)
	begin
		if (rst)
			fifo_wr_en <= 0;
		else
			fifo_wr_en <= ps_ddr_wr_en;
	end
	
	always @ (posedge clk_ps, posedge rst)
	begin
		if (rst)
			fifo_wr_data <= 0;
		else
			fifo_wr_data <= ps_ddr_wr_data;
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
			btt <= 0;
		else
			btt <= ps_ddr_wr_length[22:0];
	end
	
	always @ (posedge clk_ps, posedge rst)
	begin
		if (rst)
			addr <= 0;
		else
			addr <= ps_ddr_wr_addr;
	end
	
	assign s_axis_s2mm_cmd_tdata = {4'b0000,4'b0000,addr,1'b0,eof,6'b000000,w_type,btt};
	
	assign fifo_rd_en = (~fifo_empty) && (state == 3) && s_axis_s2mm_tready;
	
	always @ (posedge clk_ps, posedge rst)
	begin
		if (rst)
			fifo_rd_cnt <= 0;
		else if (fifo_rd_en)
			if (fifo_rd_cnt == btt[22:3] - 1)
				fifo_rd_cnt <= 0;
			else
				fifo_rd_cnt <= fifo_rd_cnt + 1'd1;
		else
			fifo_rd_cnt <= fifo_rd_cnt;
	end
	
	first_fifo_in32_out64 first_fifo_in32_out64_inst (
		.wr_clk		(clk_ps),            
		.wr_rst		(1'b0),            
		.rd_clk		(clk_ps),            
		.rd_rst		(1'b0),            
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
	assign s_axis_s2mm_tlast = ((fifo_rd_cnt == btt[22:3] - 1) && fifo_rd_en) ? 1'b1 : 1'b0;
	 ila_ps_ddr ila_ps_ddr(
		.clk    (clk_ps),
		.probe0 (rst),
		.probe1 (s_axis_s2mm_tready),
		.probe2 (fifo_rd_data),
		.probe3 (s_axis_s2mm_tkeep),
		.probe4 (s_axis_s2mm_tlast	),
		.probe5 (s_axis_s2mm_tvalid)
);
endmodule
