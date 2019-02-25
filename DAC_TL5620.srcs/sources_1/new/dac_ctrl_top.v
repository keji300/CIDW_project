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
// 采用线性序列机的方法设计DAC：TLC5620的接口时序
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
    input [10:0] ctrl_word,         //输入数据
    input update_reg,               
    
    output reg update_down,
    output reg TLC5620_CLK,
    output reg TLC5620_DATA,
    output reg TLC5620_LOAD,        //一级latch
    output reg TLC5620_LADC,          //二级latch
    output reg [6:0] cnt          
   
    );
    
  //  reg [6:0] cnt;  //序列机计数器
    
    always@(posedge clk or negedge rst_n)
        if(!rst_n)
            cnt <= 7'd0;
        else if (update_reg == 1 | cnt )   //开始有数据进入或者计数器开始计数的时候就一直计数
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
                TLC5620_LOAD  <= 1'b1;       //TLC5620_LOAD  下降沿表示将信号输入第一级latch
                TLC5620_LADC  <= 1'b0;          //TLC5620_LADC 始终有效表示第二级latch始终打通
                update_down <= 1'b0;        //数据更新完成信号
            end
        else
            case (cnt)      //ADC时序逻辑
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
                        TLC5620_DATA <= ctrl_word[10];      //数据进入是串行进入移位寄存器
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
                67:     TLC5620_LOAD <= 1'b0;       //输入数据进第一级latch
                80:     TLC5620_LOAD <= 1'b1;
                82:     update_down <= 1'b1;        //数据更新完成
                default : ;
               
            endcase
        
    
endmodule




















