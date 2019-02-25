`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/02/19 15:09:52
// Design Name: 
// Module Name: uart_byte_rx
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
/*
    1.起始位检测进程
    2.波特率产生模块 （10+6）*10
    3.数据接收进程
*/
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
/*工业环境下的数据接收实现，保证通信的稳定
每一位的数据的中间时刻是最稳定的，一般应用采集中间时刻的数据
在工业环境具有强电磁干扰 ，需要使用多次采样求概率的方法：
将每一位数据进行多次（16次）采样（数据变化时钟前后的数据不稳定顾不进行采样只采样中间段的数据）
而仅仅在中间进行采样，选择出现位数多的数据作为采样结果
    
*/
//////////////////////////////////////////////////////////////////////////////////


module uart_byte_rx(
    input rs232_rx,
    input [2:0] baud_set,
    input clk,
    input rst_n,
        
    output reg rx_done,
    output reg [7:0] rx_data
    );
    
    
    reg [15:0] bps_clk;
    reg [8:0] bps_cnt;
    reg [15:0] bps_DR;      //分频计数器最大值
    reg [15:0] div_cnt;         //分频计数器
    reg tmp0_rs232_rx, tmp1_rs232_rx; //暂存寄存器
    reg uart_state;
    
    reg [2:0] r_data_byte [7:0] ;       //累加检测到的数据（数据最大是6=1+1+1+1+1+1）
    reg [2:0] START_BIT,STOP_BIT;
    
    reg [7:0] tmp_data_byte;
    
    
    wire negdge;
     //rs232_rx是外部的异步信号，为了避免亚稳态，必须进行同步，加两级寄存器
     reg s0_rs232_rx,s1_rs232_rx; //同步寄存器
     always@(posedge clk or negedge rst_n)
        if(!rst_n)
            begin
                s0_rs232_rx <= 1'b0;
                s1_rs232_rx <= 1'b0;
            end
        else 
            begin
                s0_rs232_rx <= rs232_rx;
                s1_rs232_rx <= s0_rs232_rx;
            end
   
   //baud查找表
    always@(posedge clk or negedge rst_n)
        if(!rst_n)
             bps_DR <= 16'd324;
         else
            begin
                case(baud_set)
                   0 : bps_DR <=  16'd324;    //9600
                   1 : bps_DR <=  16'd162;    //115200
                   2 : bps_DR <=  16'd80;
                   3 : bps_DR <=  16'd53;
                 default : bps_DR <= 16'd324;
                endcase
             end
    
    // 数据寄存
    always @(posedge clk or negedge rst_n)
        if(!rst_n)
            begin
                tmp0_rs232_rx <= 1'b0;
                tmp1_rs232_rx <= 1'b0;
            end
        else
            begin
                tmp0_rs232_rx <= s1_rs232_rx;
                tmp1_rs232_rx <= tmp0_rs232_rx;
            end
            
       //起始位检测(边沿检测）     
        assign negdge =  !tmp0_rs232_rx & tmp1_rs232_rx; //前一个时刻为1，后一个时刻为0 -》下降沿
         
       //分频计数
           always@(posedge clk or negedge rst_n)
          if(!rst_n)
              div_cnt <= 16'd0;
          else if (uart_state)   //send_en = 1 -> uart_state =1 -> 开始计数
              begin
                  if(div_cnt <= bps_DR)
                        div_cnt <= 16'd0;
                   else 
                         div_cnt <= div_cnt + 1'b1;
              end
          else
              div_cnt <= 16'd0;  
            
            
            
   //产生波特率时钟
       always@(posedge clk or negedge rst_n)
       if(!rst_n)
           bps_clk <= 1'b0;
       else if (div_cnt <= 16'd1)   //如果当div_cnt =最大值的时候开始计数，信号会滞后一位
           bps_clk = 1'b1;
       else
           bps_clk <= 1'b0;      
           
                 
            // 计算接收位置  bps_cnt的值=160表示发送完成
      always@(posedge clk or negedge rst_n)
          if(!rst_n)
              bps_cnt <= 8'd0;
          else if (rx_done |  (bps_cnt == 8'd12 && (START_BIT > 2)))               //反馈回路 如果起始位错误也停止传输
              bps_cnt  <= 8'd0;       
          else if (bps_clk)
              bps_cnt <= bps_cnt + 1'b1;
         else
              bps_cnt <= bps_cnt;
              
              
  //接收完成信号
       always@(posedge clk or negedge rst_n)
       if (!rst_n)
            rx_done <= 1'b0;
       else if (bps_cnt == 8'd159 )
            rx_done <= 1'b1;
       else
            rx_done <= rx_done;
    
    
    
 //多路器 （数据输入）
        always@(posedge clk or negedge rst_n)
    if(!rst_n)
        begin
            START_BIT <= 3'd0;
            r_data_byte[0] <= 3'd0;
            r_data_byte[1] <= 3'd0;
            r_data_byte[2] <= 3'd0;
            r_data_byte[3] <= 3'd0;
            r_data_byte[4] <= 3'd0;
            r_data_byte[5] <= 3'd0;
            r_data_byte[6] <= 3'd0;
            r_data_byte[7] <= 3'd0;
            STOP_BIT <= 3'd0;
        end
    else 
        begin
            case(bps_cnt)   //发送完成bps_cnt会清0 这时候把数据也清0重新计算概率
                0:begin
                     START_BIT <= 3'd0;
                           r_data_byte[0] <= 3'd0;
                           r_data_byte[1] <= 3'd0;
                           r_data_byte[2] <= 3'd0;
                           r_data_byte[3] <= 3'd0;
                           r_data_byte[4] <= 3'd0;
                           r_data_byte[5] <= 3'd0;
                           r_data_byte[6] <= 3'd0;
                           r_data_byte[7] <= 3'd0;
                           STOP_BIT <= 3'd0;
                end
                6,7,8,9,10,11: START_BIT <= START_BIT + s1_rs232_rx;
                6+16,7+16,8+16,9+16,10+16,11+16: r_data_byte[0] <= r_data_byte[0] +s1_rs232_rx ;  
                6+16+16,7+16+16,8+16+16,9+16+16,10+16+16,11+16+16: r_data_byte[1] <= r_data_byte[1] +s1_rs232_rx ;
                54,55,56,57,58,59: r_data_byte[2] <= r_data_byte[2] +s1_rs232_rx ;
                70,71,72,73,74,75: r_data_byte[3] <= r_data_byte[3] +s1_rs232_rx ;
                86,87,88,89,90,91: r_data_byte[4] <= r_data_byte[4] +s1_rs232_rx ;
                102,103,104,105,106,107: r_data_byte[5] <= r_data_byte[5] +s1_rs232_rx ;
                118,119,120,121,122,123: r_data_byte[6] <= r_data_byte[6] +s1_rs232_rx ;
                134,135,136,137,138,139: r_data_byte[7] <= r_data_byte[7] +s1_rs232_rx ;
                150,151,152,153,154,155: r_data_byte[8] <= r_data_byte[8] +s1_rs232_rx ;              
                
//             default : 
           endcase
        end
   
   //数据提取
        always@(posedge clk or negedge rst_n)
            if (!rst_n)
                begin
                    tmp_data_byte <= 8'd0;
                end
            else if (bps_cnt == 159)
                begin
                    tmp_data_byte [0] <= r_data_byte [0][2] ; 
                    tmp_data_byte [1] <= r_data_byte [1][2] ; 
                    tmp_data_byte [2] <= r_data_byte [2][2] ;
                    tmp_data_byte [3] <= r_data_byte [3][2] ; 
                    tmp_data_byte [4] <= r_data_byte [4][2] ; 
                    tmp_data_byte [5] <= r_data_byte [5][2] ; 
                    tmp_data_byte [6] <= r_data_byte [6][2] ; 
                    tmp_data_byte [7] <= r_data_byte [7][2] ; 
                end

//控制uart_state
        always@(posedge clk or negedge rst_n)
            if (!rst_n)
                uart_state <= 1'b0;
            else if (negdge)
                uart_state = 1'b1;
            else if (rx_done || (bps_cnt == 8'd12 && (START_BIT > 2)) ) //发送完成或者接收错误
                uart_state = 1'b0;
            else
                uart_state <= uart_state;
                
    //数据输出
   always@(posedge clk or negedge rst_n)
    if (!rst_n)
         rx_data <= 8'b0;
    else if (bps_cnt == 8'd159 )
         rx_data <= tmp_data_byte;
    else
         rx_data <= rx_data;
         
         
endmodule








































