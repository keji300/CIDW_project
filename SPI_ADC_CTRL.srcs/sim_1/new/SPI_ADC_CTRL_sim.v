`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/02/27 15:29:57
// Design Name: 
// Module Name: SPI_ADC_CTRL_sim
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

`define clk_period 20

module SPI_ADC_CTRL_sim;

    reg clk;
    reg rst_n;
    reg [3:0] ADC_channel_select;                //ͨ��ѡ��
    reg Do_conv;                   //ʹ�ܲ����ź�
    wire AD_done;                 //ת�����
    wire [9:0] ADC_DATA;            //�������
    wire [7:0] LSM_CNT;
    //ADC SPI�ӿ�
   reg TLV1544_SDO;              //ADC�������ź�
   reg TLV1544_EOC;         //ADC��ת����־λ
    wire TLV1544_SDI;         //ADC������
    wire TLV1544_SCLK;        //ADC IO CLK
    wire TLV1544_NCS;        //ADCƬѡ
    wire  TLV1544_FS;
    wire  data_vaild ;         //������Ч�ź�

SPI_ADC_CTRL                                    SPI_ADC_CTRL_inst(
   . clk                                                 (clk                            ),
   . rst_n                                              ( rst_n                        ),
   . ADC_channel_select                       ( ADC_channel_select ),
   . Do_conv                                        ( Do_conv                   ),
   . AD_done                                       ( AD_done                  ),
   . ADC_DATA                                    (  ADC_DATA              ) ,
    
    //ADC SPI�ӿ�                                     /ADC SPI�ӿ�                
    . TLV1544_SDO                               (     TLV1544_SDO            ) ,
    . TLV1544_EOC                               (    TLV1544_EOC             ),
    . TLV1544_SDI                                (    TLV1544_SDI              ),
    . TLV1544_SCLK                              (   TLV1544_SCLK            ) ,
    . TLV1544_NCS                               (  TLV1544_NCS              ) ,
    . TLV1544_FS                                   (  TLV1544_FS               ) ,
    . data_vaild                                     (    data_vaild                ) ,       
    . LSM_CNT                                      (LSM_CNT)
    );
      
    initial clk = 1'b1;
    always #(`clk_period /2) clk = ~clk;
    
    initial 
        begin
            rst_n = 1'b0;
            Do_conv = 1'b0;
            ADC_channel_select = 4'b0;
            TLV1544_SDO = 1'b0;
            TLV1544_EOC =1'b1;
            #(`clk_period * 10 + 1)
            rst_n = 1'b1;
            ADC_channel_select = 4'd0;
            Do_conv = 1'b1;
            # (`clk_period );
            Do_conv = 1'b0;
            @(posedge SPI_ADC_CTRL_inst.LSM_CNT == 8'd189)     //ģ��EOC ��IO_CLK ��10�������ص�ʱ��Ϊ0
                TLV1544_EOC  = 1'b0;
                #(`clk_period * 10 + 3);
                TLV1544_EOC  = 1'b1;
            
        end

    initial
        begin
            forever 
                begin
                    TLV1544_SDO = ~TLV1544_SDO;
                    #350;
                end
        end



endmodule
