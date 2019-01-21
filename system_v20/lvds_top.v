`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2018/10/23 10:40:40
// Design Name: 
// Module Name: lvds_top
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


module lvds_top(
	input			rst_n,
	input			lvds_clk,
	input			clk_ps,
	input	[31:0]	start,
	
	input	[9:0]	lvds_data_in_p,
	input	[9:0]	lvds_data_in_n,
	
	output	[9:0]	lvds_data_out_p,
	output	[9:0]	lvds_data_out_n,
	
	output	[31:0]	data,
	output			data_valid,
	output			interrupt_flag,
	output	[31:0]	interrupt_reg
    );
	
	wire			tx_flag;
	wire			data_ddr_flag;
	wire	[9:0]	lvds_data_in;
	wire	[31:0]	ads_data[9:0];
	wire	[9:0]	ram_rd_en;
	
	reg 	[9:0]	lvds_data_out;
	wire			lvds_data_out_temp;
	
	// ila_0 ILA(
		// .clk(lvds_clk), // input wire clk
		// .probe0({
				// tx_flag,
				// lvds_data_out_temp,
				// data,
				// data_valid,
				// interrupt_flag,
				// interrupt_reg,
				// ads_data[9]
				// }) // input wire [99:0] probe0
	// );
	
	genvar i;
	
	generate for (i=0;i<10;i=i+1)
		begin : LVDS_BLOCK
			IBUFDS #(
				.IOSTANDARD("LVDS_25")	// 指定输入端口的电平标准，如果不确定，可设为DEFAULT
			) IBUFDS_inst (
				.O(lvds_data_in[i]), 		   // 时钟缓冲输出
				.I(lvds_data_in_p[i]), // 差分时钟的正端输入，需要和顶层模块的端口直接连接
				.IB(lvds_data_in_n[i]) // 差分时钟的负端输入，需要和顶层模块的端口直接连接
			); 
			
			OBUFDS #(
				.IOSTANDARD("LVDS_25"), // 指名输出端口的电平标准
				.SLEW("SLOW")
			) OBUFDS_inst (
				.O(lvds_data_out_p[i]), 	// 差分正端输出，直接连接到顶层模块端口
				.OB(lvds_data_out_n[i]),	// 差分负端输出，直接连接到顶层模块端口
				.I(lvds_data_out[i])			// 缓冲器输入
			);

			lvds_rx lvds_rx_inst(
				.rst_n			(rst_n			),
				.clk_ps			(clk_ps			),
				.lvds_clk		(lvds_clk		),
				.lvds_data_in	(lvds_data_in[i]),
				.ram_rd_en		(ram_rd_en[i]	),
				.ads_data		(ads_data[i]	)
			);
		end 
	endgenerate
	
	lvds_tx lvds_tx_inst(
		.rst_n			(rst_n			),
		.lvds_clk		(lvds_clk		),
		.tx_flag		(tx_flag		),
		.lvds_data_out	(lvds_data_out_temp)
    );
	
	always @ (posedge lvds_clk, negedge rst_n)
	begin
		if (!rst_n)
			lvds_data_out <= 0;
		else
			lvds_data_out <= {10{lvds_data_out_temp}};
	end
	
	timer timer_inst(
		.rst_n				(rst_n			),
		.lvds_clk			(lvds_clk		),
		.clk_ps				(clk_ps			),
		.start				(start			),	
		.data_ddr_flag		(data_ddr_flag	),
		.tx_flag			(tx_flag		),
		.interrupt_flag		(interrupt_flag	),
		.interrupt_reg		(interrupt_reg	)
    );
	
	ram_rd_ctrl ram_rd_ctrl_inst(
		.rst_n				(rst_n			),
		.clk_ps				(clk_ps			),
		.data_ddr_flag		(data_ddr_flag	),
		.ads0_data			(ads_data[0]	),
		.ads1_data			(ads_data[1]	),
		.ads2_data			(ads_data[2]	),
		.ads3_data			(ads_data[3]	),
		.ads4_data			(ads_data[4]	),
		.ads5_data			(ads_data[5]	),
		.ads6_data			(ads_data[6]	),
		.ads7_data			(ads_data[7]	),
		.ads8_data			(ads_data[8]	),
		.ads9_data			(ads_data[9]	),
		
		.ram_rd_en			(ram_rd_en		),
		.data_valid			(data_valid		),
		.data				(data			)
    );
	
endmodule
