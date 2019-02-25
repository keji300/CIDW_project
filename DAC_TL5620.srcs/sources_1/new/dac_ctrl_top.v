`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/02/25 13:37:51
// Design Name: 
// Module Name: dac_ctrl_top
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// �����������л��ķ������DAC��TLC5620�Ľӿ�ʱ��
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module dac_ctrl_top(
    input clk,
    input rst_n,
    input [10:0] ctrl_word,         //��������
    input update_reg,               
    
    output reg update_down,
    output reg TLC5620_CLK,
    output reg TLC5620_DATA,
    output reg TLC5620_LOAD,        //һ��latch
    output reg TLC5620_LADC,          //����latch
    output reg [6:0] cnt          
   
    );
    
  //  reg [6:0] cnt;  //���л�������
    
    always@(posedge clk or negedge rst_n)
        if(!rst_n)
            cnt <= 7'd0;
        else if (update_reg == 1 | cnt )   //��ʼ�����ݽ�����߼�������ʼ������ʱ���һֱ����
            begin
                if (cnt == 7'd82)
                    cnt <= 7'd0;
                else
                    cnt <= cnt +7'd1;
            end
        else
            cnt <= 7'd0;
        
   always@(posedge clk or negedge rst_n)
        if(!rst_n)     
            begin
                TLC5620_CLK <= 1'b0;
                TLC5620_DATA <= 1'b0;
                TLC5620_LOAD  <= 1'b1;       //TLC5620_LOAD  �½��ر�ʾ���ź������һ��latch
                TLC5620_LADC  <= 1'b0;          //TLC5620_LADC ʼ����Ч��ʾ�ڶ���latchʼ�մ�ͨ
                update_down <= 1'b0;        //���ݸ�������ź�
            end
        else
            case (cnt)      //ADCʱ���߼�
                0: 
                    begin
                        TLC5620_CLK <= 1'b0;
                        TLC5620_DATA <= 1'b0;
                        TLC5620_LOAD  <= 1'b0;
                        TLC5620_LADC  <= 1'b0;
                        update_down <= 1'b0;
                    end
                1:
                    begin
                        TLC5620_CLK <= 1'b1;
                        TLC5620_DATA <= ctrl_word[10];      //���ݽ����Ǵ��н�����λ�Ĵ���
                    end
                4:  TLC5620_CLK <= 1'b0;
                7:
                    begin
                        TLC5620_CLK <= 1'b1;
                        TLC5620_DATA <= ctrl_word[9];
                    end
                10:     TLC5620_CLK <= 1'b0;
                13:
                    begin
                        TLC5620_CLK <= 1'b1;
                        TLC5620_DATA <= ctrl_word[8];
                    end
                16:     TLC5620_CLK <= 1'b0;
                19: 
                    begin
                        TLC5620_CLK <= 1'b1;
                        TLC5620_DATA <= ctrl_word[7];
                    end
                22:     TLC5620_CLK <= 1'b0;
                25:
                     begin
                           TLC5620_CLK <= 1'b1;
                           TLC5620_DATA <= ctrl_word[6];
                       end
                28:     TLC5620_CLK <= 1'b0;
                31:
                     begin
                          TLC5620_CLK <= 1'b1;
                          TLC5620_DATA <= ctrl_word[5];
                      end
                34:     TLC5620_CLK <= 1'b0;
                37:
                    begin
                          TLC5620_CLK <= 1'b1;
                          TLC5620_DATA <= ctrl_word[4];
                      end
                40:     TLC5620_CLK <= 1'b0;
                43:
                    begin
                          TLC5620_CLK <= 1'b1;
                          TLC5620_DATA <= ctrl_word[3];
                      end
                46:     TLC5620_CLK <= 1'b0;
                49:
                    begin
                          TLC5620_CLK <= 1'b1;
                          TLC5620_DATA <= ctrl_word[2];
                      end
                52:     TLC5620_CLK <= 1'b0;
                55:
                    begin
                          TLC5620_CLK <= 1'b1;
                          TLC5620_DATA <= ctrl_word[1];
                      end
                58:     TLC5620_CLK <= 1'b0;
                61:
                    begin
                          TLC5620_CLK <= 1'b1;
                          TLC5620_DATA <= ctrl_word[0];
                      end
                64:     TLC5620_CLK <= 1'b0;
                67:     TLC5620_LOAD <= 1'b0;       //�������ݽ���һ��latch
                80:     TLC5620_LOAD <= 1'b1;
                82:     update_down <= 1'b1;        //���ݸ������
                default : ;
               
            endcase
        
    
endmodule




















