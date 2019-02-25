`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/02/14 16:05:34
// Design Name: 
// Module Name: key_filter
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


module key_filter(
    input clk,
    input rst_n,
    input key_in,
    output reg key_flag,  //当按键按下计数完20ms的时候，产生一个脉冲flag
    output reg key_state  //当出现key_flag的时候高电平的key_state拉低，直到按键松开回到平稳状态在拉高
    );
    
   parameter  IDEL  =  4'b0001;
   parameter  FILTER0 = 4'b0010;
   parameter   DOWN = 4'b0100;
   parameter  FILTER = 4'b1000;

    reg [3:0] state;
    
    //边沿检测 ：使用两个寄存器寄存两个连续时钟周期的状态，然后用组合逻辑去判断状态是否变化
    reg key_tmp0,key_tmp1;
    wire pedge,nedge;
    
    always@(posedge clk or negedge rst_n)
    begin
        if(!rst_n)
            begin
                key_tmp0 <= 0;
                key_tmp1 <= 0;
            end
        else
            begin
                key_tmp0 <= key_in;
                key_tmp1 <= key_tmp0;
            end  
    end
    
    assign nedge = !key_tmp0 & key_tmp1;
    assign pedge = key_tmp0 & ( !key_tmp1);

//20ms计数器 50_000_000 ->20 ns ---> 1000_000
reg [19:0] cnt;
reg en_cnt;
reg cnt_full;  //计数满标志信号
always@(posedge clk or negedge rst_n)
    if(!rst_n)
        cnt <= 20'd0;
    else if (en_cnt)
        cnt <= cnt + 1'b1;
    else
        cnt <= 20'd0;
        
always@(posedge clk or negedge rst_n)
    if(!rst_n)
        cnt_full <=1'b0;
    else if (cnt == 20'd999999 )
        cnt_full <=1'b1;
    else
        cnt_full <=1'b0;

//状态机
    always@(posedge clk or negedge rst_n)
        if(!rst_n)
            begin
                key_flag <=1'b0;
                key_state <= 1'b1;
                en_cnt <= 1'b0;
                state <= IDEL;
            end
        else 
            begin
                case (state)
                    IDEL :
                      begin
                        key_flag <= 1'b0;
                        if(nedge)
                            begin
                                state <= FILTER0;
                                en_cnt <= 1'b1; //检测到下降沿使能计数
                            end
                        else
                            state <= IDEL;
                        end
                   //滤波状态         
                   FILTER0 :
                        if(cnt_full)
                        begin
                            key_flag <= 1'b1;
                            key_state <= 1'b0;
                            state <= DOWN;
                            en_cnt <=0;
                        end
                        else if (pedge)         //没计数满就检测到上升沿表示是一个抖动，回到IDEL
                        begin
                            en_cnt <= 0;
                            state <= IDEL;
                        end
                        else
                            state <= FILTER0;
                     //按键按下的状态
                     DOWN:
                        begin
                            key_flag <= 1'b0;
                            if(pedge)
                                begin
                                    state <= FILTER;
                                    en_cnt <=1'b1;
                                end
                            else
                                state <= DOWN;
                        end
                       //案件弹起的滤波状态
                    FILTER:
                        if(cnt_full)
                            begin
                                key_flag <= 1'b1;
                                key_state <= 1'b1;
                                state <= IDEL;
                            end
                        else if (nedge)
                            begin
                                en_cnt <= 1'b0;
                                state <= DOWN;
                            end
                        else
                            state <= FILTER;
                       //
                    default : 
                        begin
                            en_cnt <= 1'b0;
                            key_flag <= 1'b0;
                            key_state <= 1'b1;
                            state <= IDEL;    
                        end  
                        
                endcase
                            
                            
            end

        
    
endmodule




















































