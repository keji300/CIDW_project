`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/02/25 15:48:40
// Design Name: 
// Module Name: dac_sim
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

module dac_sim;

    reg clk;
    reg rst_n;
    reg [10:0] ctrl_word;         //��������
    reg update_reg;               
    
    wire  update_down;
    wire  TLC5620_CLK;
    wire  TLC5620_DATA;
    wire  TLC5620_LOAD;        //һ��latch
    wire  TLC5620_LADC;          //����latch
    wire [6:0] cnt;  

dac_ctrl_top                     dac_ctrl_top_inst(
   .clk                               (clk),
   .rst_n                            (rst_n),
   .ctrl_word                     (ctrl_word),         //��������
   .update_reg                  (update_reg),               
  
  .update_down               (update_down),
  .TLC5620_CLK                (TLC5620_CLK),
  .TLC5620_DATA             (TLC5620_DATA),
  .TLC5620_LOAD             (TLC5620_LOAD),        //һ��latch
  .TLC5620_LADC             (TLC5620_LADC),          //����latch
  .cnt                               (cnt)
    );

    initial clk = 1;
    always #(`clk_period/2) clk = ~clk;
    
    initial 
        begin
            rst_n = 1'b0;
            update_reg = 1'b0;
            ctrl_word = 0;
            
            #(`clk_period*100 + 1)
            rst_n = 1'b1;
            #(`clk_period * 20);
            ctrl_word = {2'd0,1'b0,8'haa};         //ѡ��ͨ��0���������0��8λ����λaa
            update_reg = 1'b1;
            #(`clk_period);
            update_reg = 1'b0;
            @(posedge update_down)          //�ȴ�update_down�ź�������
             #(`clk_period * 40);
             ctrl_word = {2'd0,1'b0,8'h55};         //ѡ��ͨ��0���������0��8λ����λ55
             update_reg = 1'b1;
            @(posedge update_down)
             #(`clk_period * 40);
            
        end
        



endmodule












