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
// FPGAģ��SPI�������ӿڿ���ADC   TLV1544
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
    input [3:0] ADC_channel_select,                //ͨ��ѡ��
    input Do_conv,                   //ʹ�ܲ����ź�
    output reg AD_done,                 //ת�����
    output reg [9:0] ADC_DATA,            //�������
    
    //ADC SPI�ӿ�
    input TLV1544_SDO,              //ADC�������ź�
    input TLV1544_EOC,         //ADC��ת����־λ
    output reg TLV1544_SDI,         //ADC������
    output reg TLV1544_SCLK,        //ADC IO CLK
    output reg TLV1544_NCS,         //ADCƬѡ
    output  TLV1544_FS,
    output reg data_vaild ,         //������Ч�ź�
     output reg [7:0] LSM_CNT
    );
    
    assign TLV1544_FS = 1'b1;
    
//    reg [7:0] LSM_CNT;      //�������л� ������
    reg [9:0] ADC_DATA_r;
    
    
    //����20ns����һ�εļ�����
    always@(posedge clk or negedge rst_n)
        if(!rst_n)
            begin
                LSM_CNT <= 8'd0;
            end
        else if ( (LSM_CNT < 8'd204) && (TLV1544_EOC == 1'b1) && (Do_conv || LSM_CNT >=8'd0) )
            begin
                LSM_CNT <= LSM_CNT + 1'b1;
            end
        else if (LSM_CNT < 8'd204 && TLV1544_EOC == 1'b0)       //ADC��ת������
            LSM_CNT <= LSM_CNT;
        else if (LSM_CNT == 8'd204 && TLV1544_EOC <= 1'b1)             //ADCת�����
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
                    1:                  //cs���ͣ�SDI��ֵΪͨ����ѡ��
                        begin
                            TLV1544_NCS <= 1'b0;
                            TLV1544_SDI <= ADC_channel_select[3];
                        end
                    9:                  //IO CLK ���ߣ�����IO CLK�������ذ����ݴ���
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
                            TLV1544_SCLK <= 1'b0;       //DI�Ѿ���ֵ��ɣ����治����DI��ֵ��ֻ��Ҫ��ʱ�����ͼ���
                        end
                    89:
                        begin
                            TLV1544_SCLK <= 1'b1;
                            ADC_DATA_r[5] <= TLV1544_SDO;
                        end
                    99:
                        begin
                                TLV1544_SCLK <= 1'b0;       //DI�Ѿ���ֵ��ɣ����治����DI��ֵ��ֻ��Ҫ��ʱ�����ͼ���
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
                    189:                //���ݷ������(������Ч)
                        begin
                            TLV1544_SCLK <= 1'b1;
                            ADC_DATA_r[0] <= TLV1544_SDO;
                            data_vaild <= 1'b1;
//                            ADC_DATA <= {ADC_DATA_r[9:1] ,TLV1544_SDO};     //ֱ���������
                        end
                    199:            //�ȴ�����ת�����
                        begin
                            TLV1544_SCLK <= 1'b0;
                            TLV1544_NCS <= 1'b1;        //cs ����
                        end
                    204:                        //199-201�ǵȴ�EOC~CS�ź� 100ns
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













