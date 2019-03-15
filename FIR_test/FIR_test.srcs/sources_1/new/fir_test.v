`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/03/15 13:55:30
// Design Name: 
// Module Name: fir_test
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


module fir_test(
    input clk,
    input rst_n,
    input  [15:0] FIR_in,
    input out_en,
    output reg  [31:0] FIR_out

    );

//第一级流水线实现输入信号的延�?
    reg  [15:0] delay_pipeline1;
    reg  [15:0] delay_pipeline2;
    reg  [15:0] delay_pipeline3;
    reg  [15:0] delay_pipeline4;
    reg  [15:0] delay_pipeline5;
    reg  [15:0] delay_pipeline6;
    reg  [15:0] delay_pipeline7;
    reg  [15:0] delay_pipeline8;
    reg  [15:0] delay_pipeline9;

    always @(posedge clk or negedge rst_n)
        begin
            if (!rst_n)
                begin
                    delay_pipeline1 <= 16'd0;
                    delay_pipeline2 <= 16'd0;
                    delay_pipeline3 <= 16'd0;
                    delay_pipeline4 <= 16'd0;
                    delay_pipeline5 <= 16'd0;
                    delay_pipeline6 <= 16'd0;
                    delay_pipeline7 <= 16'd0;
                    delay_pipeline8 <= 16'd0;
                    delay_pipeline9 <= 16'd0;
                end
            else
                begin
                    delay_pipeline1 <= FIR_in;          //�?新的数据总是在delay_pipeline1
                    delay_pipeline2 <= delay_pipeline1;
                    delay_pipeline3 <= delay_pipeline2;
                    delay_pipeline4 <= delay_pipeline3;
                    delay_pipeline5 <= delay_pipeline4;
                    delay_pipeline6 <= delay_pipeline5;
                    delay_pipeline7 <= delay_pipeline6;
                    delay_pipeline8 <= delay_pipeline7;
                    delay_pipeline9 <= delay_pipeline8;
                end
        end

    //卷积的乘法运�? 248,246,20,74,102,74,20,246,248
   wire [7:0]  coeff1 = 'd7;
   wire [7:0] coeff2 = 'd4;
   wire [7:0] coeff3 = 'd51;
   wire [7:0] coeff4 = 'd136;
   wire [7:0] coeff5 = 'd179;
   wire [7:0] coeff6 = 'd136;
   wire [7:0] coeff7 = 'd51;
   wire [7:0] coeff8 = 'd4;
   wire [7:0] coeff9 = 'd7;

    reg  [24:0] muti_data1;
    reg  [24:0] muti_data2;
    reg  [24:0] muti_data3;
    reg  [24:0] muti_data4;
    reg  [24:0] muti_data5;
    reg  [24:0] muti_data6;
    reg  [24:0] muti_data7;
    reg  [24:0] muti_data8;
    reg  [24:0] muti_data9;

    always @(posedge clk or negedge rst_n)
        begin
            if (!rst_n)
                muti_data1 <= 'd0;
            else
                muti_data1 <= delay_pipeline1 * coeff1;  
        end

    always @(posedge clk or negedge rst_n) begin if (!rst_n) muti_data2 <= 'd0; else muti_data2 <= delay_pipeline2 * coeff2; end
    always @(posedge clk or negedge rst_n) begin if (!rst_n) muti_data3 <= 'd0; else muti_data3 <= delay_pipeline3 * coeff3; end
    always @(posedge clk or negedge rst_n) begin if (!rst_n) muti_data4 <= 'd0; else muti_data4 <= delay_pipeline4 * coeff4; end
    always @(posedge clk or negedge rst_n) begin if (!rst_n) muti_data5 <= 'd0; else muti_data5 <= delay_pipeline5 * coeff5; end
    always @(posedge clk or negedge rst_n) begin if (!rst_n) muti_data6 <= 'd0; else muti_data6 <= delay_pipeline6 * coeff6; end
    always @(posedge clk or negedge rst_n) begin if (!rst_n) muti_data7 <= 'd0; else muti_data7 <= delay_pipeline7 * coeff7; end
    always @(posedge clk or negedge rst_n) begin if (!rst_n) muti_data8 <= 'd0; else muti_data8 <= delay_pipeline8 * coeff8; end
    always @(posedge clk or negedge rst_n) begin if (!rst_n) muti_data9 <= 'd0; else muti_data9 <= delay_pipeline9 * coeff9; end

    // 加法�?
    reg  [31:0] sum1;
    reg  [31:0] sum2;
    reg  [31:0] sum3;
    reg  [31:0] sum4;
    reg  [31:0] sum5;
    reg  [31:0] sum6;
    reg  [31:0] sum7;
    reg  [31:0] sum8;

    always @* sum1 <= muti_data1 + muti_data2;

    always @* sum2 <= sum1 + muti_data3;

    always @* sum3 <= sum2 + muti_data4;

    always @* sum4 <= sum3 + muti_data5;

    always @* sum5 <= sum4 + muti_data6;

    always @* sum6 <= sum5 + muti_data7;

    always @* sum7 <= sum6 + muti_data8;

    always @* sum8 <= sum7 + muti_data9;

    always @(posedge clk or negedge rst_n)
        begin
            if(!rst_n)
                FIR_out <= 'd0;
            else if(out_en)
                FIR_out <= sum8;
        end







endmodule
