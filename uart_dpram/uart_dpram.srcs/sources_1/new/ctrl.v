`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/02/14 10:21:08
// Design Name: 
// Module Name: ctrl
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


module ctrl(
    input key_flag,
    input key_state,
    input clk,
    input rst_n,
    input rx_done,
    input tx_done,
    output wren,
    output reg  [7:0] wr_addr,
    output reg  [7:0] rd_addr,
    output reg send_en
    

    );
    
    reg do_send;    //开始读ram数据的信号
    reg r0_send_done,r1_send_done;
    
    
    //每接收一个rx的信号就发送到ram中
    //即 rx_done 和wr_en 同步
    assign wren = rx_done;
    
    //一直到wren信号的下个时钟会把数据写入对应的地址
    always@(posedge clk or negedge rst_n)
    begin
        if (!rst_n)
            wr_addr <= 8'd0;
        else if(rx_done)
            wr_addr <= wr_addr + 1'b1;  //每到来一个rx_done 写地址加1·
        else
            wr_addr <= wr_addr;
    end
    
    //读ram中的信号
     always@(posedge clk or negedge rst_n)
       begin
           if (!rst_n)
              do_send <= 1'd0;
           else if (key_flag && !key_state)   //key_flag有效并且key_flga为低表示按键有效，开始读ram中的数据
              do_send <= ~do_send;  //将按键操作变为乒乓操作，按一次反转一次标志
     
      end
      
      always@(posedge clk or negedge rst_n)
      begin
            if (!rst_n)
                rd_addr <= 8'd0;
            else if (do_send && tx_done) //按键按下并且上一次发送已经完成
                rd_addr <= rd_addr + 1'b1;
            else 
                rd_addr <= rd_addr;
      end
    
    //把输出的信号延迟2拍，在把r1_send_done作为控制信号
    //因为ram在读地址+1的时候会延迟2拍把信号输出
     always@(posedge clk or negedge rst_n)
               begin
                     if (!rst_n)
                        begin
                         r0_send_done <= 1'b0;
                         r1_send_done <= 1'b0;
                        end
                     else
                        begin
                             r0_send_done <= (do_send && tx_done);
                              r1_send_done <= r0_send_done ;
                        end
               end
    
    
    
    always@(posedge clk or negedge rst_n)
            begin
                  if (!rst_n)
                    send_en = 1'b0;
                  else if (key_flag && !key_state)
                    send_en <= 1'b1;
                  else if (r1_send_done) //延迟2拍在使能发送信号
                    send_en <= 1'b1;
                 else
                    send_en <= 1'b0;
                  
             end
    
endmodule





























