`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2018/12/04 17:41:10
// Design Name: 
// Module Name: lvds_data_process
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


module lvds_data_process(
	input			rst,
	input			clk_ps,
	input			user_clk,
	input			select,
	input			lvds_data_en,
	input	[31:0]	lvds_data,
	
	output	reg 		data_out_en,
	output	reg [31:0]	data_out
    );
	
	reg		[1:0]	state;
	reg				select_del;
	reg		[12:0]	num;
	reg		[31:0]	test_data;
	
	reg				fifo_wr_en;
	reg		[31:0]	fifo_wr_data;
	wire			fifo_empty;
	wire			fifo_rd_en;
	wire	[31:0]	fifo_rd_data;
	
	/* ila_0 ila_0_inst (
		.clk(clk_ps), // input wire clk
		.probe0({
				fifo_wr_en,
				fifo_wr_data,
				select,
				pl_ddr_wr_finish,
				state
				}) // input wire [99:0] probe0
	); */
	
	always @ (posedge clk_ps, posedge rst)
	begin
		if (rst)
			state <= 0;
		else
			case (state)
				2'd0	:	if (~select_del && select)
								state <= 1;
							else
								state <= 0;
				
				2'd1	:	if (num == 0)
								state <= 2;
							else
								state <= 1;
				
				2'd2	:	if (~select && select_del)
								state <= 3;
							else
								state <= 2;
				
				2'd3	:	if (num == 0)
								state <= 0;
							else
								state <= 3;
				
				default	:	state <= 0;
			endcase
	end
	
	always @ (posedge clk_ps) select_del <= select;
	
	always @ (posedge clk_ps, posedge rst)
	begin
		if (rst)
			num <= 0;
		else if (lvds_data_en)
			if (num == 7999)
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
		else if (state == 2 || state == 3)
			if (lvds_data_en)
				if (test_data == 8000 - 1)
					test_data <= 0;
				else
					test_data <= test_data + 1'd1;
			else
				test_data <= test_data;
		else
			test_data <= 0;
	end
	
	always @ (posedge clk_ps, posedge rst)
	begin
		if (rst)
			fifo_wr_en <= 0;
		else
			fifo_wr_en <= lvds_data_en;
	end
	
	always @ (posedge clk_ps, posedge rst)
	begin
		if (rst)
			fifo_wr_data <= 0;
		else if (select)
			fifo_wr_data <= test_data;
		else
			fifo_wr_data <= lvds_data;
	end
	
	assign fifo_rd_en = ~fifo_empty;
	
	always @ (posedge user_clk, posedge rst)
	begin
		if (rst)
			data_out_en <= 0;
		else
			data_out_en <= fifo_rd_en;
	end
	
	always @ (posedge user_clk, posedge rst)
	begin
		if (rst)
			data_out <= 0;
		else
			data_out <= fifo_rd_data;
	end
	
	first_fifo_32x128 first_fifo_32x128_inst (
		.wr_clk		(clk_ps),  // input wire wr_clk
		.wr_rst		(1'b0),  // input wire wr_rst
		.rd_clk		(user_clk),  // input wire rd_clk
		.rd_rst		(1'b0),  // input wire rd_rst
		.din		(fifo_wr_data),        // input wire [31 : 0] din
		.wr_en		(fifo_wr_en),    // input wire wr_en
		.rd_en		(fifo_rd_en),    // input wire rd_en
		.dout		(fifo_rd_data),      // output wire [31 : 0] dout
		.full		(),      // output wire full
		.empty		(fifo_empty)    // output wire empty
	);
	
endmodule
