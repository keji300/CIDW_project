`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/02/27 10:04:53
// Design Name: 
// Module Name: SPI_ADC_CTRL
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// FPGA模拟SPI控制器接口控制ADC   TLV1544
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module SPI_ADC_CTRL(
    input clk,
    input rst_n,
    input [3:0] ADC_channel_select,                //通道选择
    input Do_conv,                   //使能采样信号
    output reg AD_done,                 //转换完成
    output reg [9:0] ADC_DATA,            //采样结果
    
    //ADC SPI接口
    input TLV1544_SDO,              //ADC的输入信号
    input TLV1544_EOC,         //ADC的转换标志位
    output reg TLV1544_SDI,         //ADC的配置
    output reg TLV1544_SCLK,        //ADC IO CLK
    output reg TLV1544_NCS,         //ADC片选
    output  TLV1544_FS,
    output reg data_vaild ,         //数据有效信号
     output reg [7:0] LSM_CNT
    );
    
    assign TLV1544_FS = 1'b1;
    
//    reg [7:0] LSM_CNT;      //线性序列机 计数器
    reg [9:0] ADC_DATA_r;
    
    
    //产生20ns计数一次的计数器
    always@(posedge clk or negedge rst_n)
        if(!rst_n)
            begin
                LSM_CNT <= 8'd0;
            end
        else if ( (LSM_CNT < 8'd204) && (TLV1544_EOC == 1'b1) && (Do_conv || LSM_CNT >=8'd0) )
            begin
                LSM_CNT <= LSM_CNT + 1'b1;
            end
        else if (LSM_CNT < 8'd204 && TLV1544_EOC == 1'b0)       //ADC在转换过程
            LSM_CNT <= LSM_CNT;
        else if (LSM_CNT == 8'd204 && TLV1544_EOC <= 1'b1)             //ADC转换完成
            LSM_CNT <= 8'd0;
    
    always@(posedge clk or negedge rst_n)
        if(!rst_n)
            begin
                ADC_DATA_r <= 10'd0;
                TLV1544_SDI <= 1'b0;
                TLV1544_SCLK <= 1'b0;
                TLV1544_NCS <= 1'b1;
                AD_done <= 1'b1;
                data_vaild <= 1'b0;
//                ADC_DATA <= 10'd0;
            end
        else
            begin
                case (LSM_CNT)
                    0:
                        begin
                            ADC_DATA_r <= 10'd0;
                            TLV1544_SDI <= 1'b0;
                            TLV1544_SCLK <= 1'b0;
                            TLV1544_NCS <= 1'b1;
                            AD_done <= 1'b0;
                            data_vaild <= 1'b0;
//                            ADC_DATA <= 10'd0;
                        end
                    1:                  //cs拉低，SDI赋值为通道的选择
                        begin
                            TLV1544_NCS <= 1'b0;
                            TLV1544_SDI <= ADC_channel_select[3];
                        end
                    9:                  //IO CLK 拉高，即在IO CLK的上升沿把数据存入
                        begin
                            TLV1544_SCLK <= 1'b1;
                            ADC_DATA_r[9] <= TLV1544_SDO;
                        end
                    19:
                        begin
                            TLV1544_SDI <= ADC_channel_select[2];
                            TLV1544_SCLK <= 1'b0;
                        end
                    29:
                        begin
                            TLV1544_SCLK <= 1'b1;
                            ADC_DATA_r[8] <= TLV1544_SDO;
                        end
                    39:
                        begin
                            TLV1544_SDI <= ADC_channel_select[1];
                            TLV1544_SCLK <= 1'b0;
                        end
                    49:
                        begin
                            TLV1544_SCLK <= 1'b1;
                            ADC_DATA_r[7] <= TLV1544_SDO;
                        end
                    59:
                        begin
                            TLV1544_SDI <= ADC_channel_select[0];
                            TLV1544_SCLK <= 1'b0;
                        end
                    69:
                        begin
                            TLV1544_SCLK <= 1'b1;
                            ADC_DATA_r[6] <= TLV1544_SDO;
                        end
                    79:
                        begin
                            TLV1544_SCLK <= 1'b0;       //DI已经赋值完成，后面不关心DI的值，只需要把时钟拉低即可
                        end
                    89:
                        begin
                            TLV1544_SCLK <= 1'b1;
                            ADC_DATA_r[5] <= TLV1544_SDO;
                        end
                    99:
                        begin
                                TLV1544_SCLK <= 1'b0;       //DI已经赋值完成，后面不关心DI的值，只需要把时钟拉低即可
                        end
                    109:
                        begin
                            TLV1544_SCLK <= 1'b1;
                            ADC_DATA_r[4] <= TLV1544_SDO;
                        end
                    119: 
                        begin
                            TLV1544_SCLK <= 1'b0;
                        end
                    129: 
                        begin
                            TLV1544_SCLK <= 1'b1;
                            ADC_DATA_r[3] <= TLV1544_SDO;
                        end
                    139: 
                        begin
                            TLV1544_SCLK <= 1'b0;
                        end
                    149: 
                        begin
                            TLV1544_SCLK <= 1'b1;
                            ADC_DATA_r[2] <= TLV1544_SDO;
                        end
                    159: 
                        begin
                            TLV1544_SCLK <= 1'b0;
                        end
                    169: 
                        begin
                            TLV1544_SCLK <= 1'b1;
                            ADC_DATA_r[1] <= TLV1544_SDO;
                        end
                    179: 
                        begin
                            TLV1544_SCLK <= 1'b0;
                        end
                    189:                //数据发送完成(数据有效)
                        begin
                            TLV1544_SCLK <= 1'b1;
                            ADC_DATA_r[0] <= TLV1544_SDO;
                            data_vaild <= 1'b1;
//                            ADC_DATA <= {ADC_DATA_r[9:1] ,TLV1544_SDO};     //直接输出数据
                        end
                    199:            //等待数据转换完成
                        begin
                            TLV1544_SCLK <= 1'b0;
                            TLV1544_NCS <= 1'b1;        //cs 拉高
                        end
                    204:                        //199-201是等待EOC~CS信号 100ns
                        begin
                            AD_done <= 1'b1;
                        end
                   default : data_vaild <= 1'b0 ;     
                                       

                endcase
            end
            
         always@(posedge clk or negedge rst_n)
            if(!rst_n) 
              ADC_DATA <= 10'd0;
            else if (data_vaild)
                begin
                    ADC_DATA[0] <= ADC_DATA_r[0];
                    ADC_DATA[1] <= ADC_DATA_r[1];
                    ADC_DATA[2] <= ADC_DATA_r[2];
                    ADC_DATA[3] <= ADC_DATA_r[3];
                    ADC_DATA[4] <= ADC_DATA_r[4];
                    ADC_DATA[5] <= ADC_DATA_r[5];
                    ADC_DATA[6] <= ADC_DATA_r[6];
                    ADC_DATA[7] <= ADC_DATA_r[7];
                    ADC_DATA[8] <= ADC_DATA_r[8];
                    ADC_DATA[9] <= ADC_DATA_r[9];
                end
                
            
            
            
            
            
            
            
endmodule













