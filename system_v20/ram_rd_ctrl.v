`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2018/11/20 11:47:44
// Design Name: 
// Module Name: ram_rd_ctrl
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


module ram_rd_ctrl(
	input			rst_n,
	input			clk_ps,
	input			data_ddr_flag,
	input	[31:0]	ads0_data,
	input	[31:0]	ads1_data,
	input	[31:0]	ads2_data,
	input	[31:0]	ads3_data,
	input	[31:0]	ads4_data,
	input	[31:0]	ads5_data,
	input	[31:0]	ads6_data,
	input	[31:0]	ads7_data,
	input	[31:0]	ads8_data,
	input	[31:0]	ads9_data,
	
	output	reg [9:0]	ram_rd_en,
	output	reg			data_valid,
	output	reg	[31:0]	data
    );
	
	reg				state;
	reg		[2:0]	cnt;
	reg		[3:0]	num;
	
	reg				state_del1,state_del2;
	reg		[2:0]	cnt_del1,cnt_del2;
	reg		[3:0]	num_del1,num_del2;
	
	always @ (posedge clk_ps, negedge rst_n)
	begin
		if (!rst_n)
			state <= 0;
		else
			case (state)
				0	:	if (data_ddr_flag)
							state <= 1;
						else
							state <= 0;
							
				1	:	if ((num == 9) && (cnt == 7))
							state <= 0;
						else
							state <= 1;
			endcase
	end 
	
	always @ (posedge clk_ps, negedge rst_n)
	begin
		if (!rst_n)
			cnt <= 0;
		else if (state == 1)	
			cnt <= cnt + 1'd1;
		else
			cnt <= 0;
	end
	
	always @ (posedge clk_ps, negedge rst_n)
	begin
		if (!rst_n)
			num <= 0;
		else if (state == 1)
			if (cnt == 7)
				num <= num + 1'd1;
			else
				num <= num;
		else
			num <= 0;
	end
	
	always @ (posedge clk_ps, negedge rst_n)
	begin
		if (!rst_n)
			ram_rd_en <= 0;
		else if (state == 1)
			case (num)
				4'd0	:	begin ram_rd_en[0] <= 1'b1; ram_rd_en[9] <= 1'b0; end
				4'd1	:	begin ram_rd_en[1] <= 1'b1; ram_rd_en[0] <= 1'b0; end
				4'd2	:	begin ram_rd_en[2] <= 1'b1; ram_rd_en[1] <= 1'b0; end
				4'd3	:	begin ram_rd_en[3] <= 1'b1; ram_rd_en[2] <= 1'b0; end
				4'd4	:	begin ram_rd_en[4] <= 1'b1; ram_rd_en[3] <= 1'b0; end
				4'd5	:	begin ram_rd_en[5] <= 1'b1; ram_rd_en[4] <= 1'b0; end
				4'd6	:	begin ram_rd_en[6] <= 1'b1; ram_rd_en[5] <= 1'b0; end
				4'd7	:	begin ram_rd_en[7] <= 1'b1; ram_rd_en[6] <= 1'b0; end
				4'd8	:	begin ram_rd_en[8] <= 1'b1; ram_rd_en[7] <= 1'b0; end
				4'd9	:	begin ram_rd_en[9] <= 1'b1; ram_rd_en[8] <= 1'b0; end
				default	:	ram_rd_en <= 0;
			endcase
		else
		begin
			ram_rd_en <= 0;
		end
	end
	
	//RAM输出有一拍潜伏期
	always @ (posedge clk_ps, negedge rst_n)
	begin
		if (!rst_n)
		begin
			cnt_del1 <= 0;
			num_del1 <= 0;
			state_del1 <= 0;
			cnt_del2 <= 0;
			num_del2 <= 0;
			state_del2 <= 0;
		end
		else
		begin
			cnt_del1 <= cnt;
			num_del1 <= num;
			state_del1 <= state;
			cnt_del2 <= cnt_del1;
			num_del2 <= num_del1;
			state_del2 <= state_del1;
		end
	end
	
	always @ (posedge clk_ps, negedge rst_n)
	begin
		if (!rst_n)
			data_valid <= 0;
		else if (state_del1 == 1)
			data_valid <= 1;
		else
			data_valid <= 0;
	end
	
	always @ (*)
	begin
		if (!rst_n)
			data = 0;
		else if (state_del2 == 1)
			case (num_del2)
				4'd0	:	data = ads0_data;
				4'd1	:	data = ads1_data;
				4'd2	:	data = ads2_data;
				4'd3	:	data = ads3_data;
				4'd4	:	data = ads4_data;
				4'd5	:	data = ads5_data;
				4'd6	:	data = ads6_data;
				4'd7	:	data = ads7_data;
				4'd8	:	data = ads8_data;
				4'd9	:	data = ads9_data;
				default	:	data = 0;
			endcase
	end
	
endmodule
