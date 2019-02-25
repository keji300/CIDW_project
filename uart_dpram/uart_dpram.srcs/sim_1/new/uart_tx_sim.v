`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/02/19 14:45:51
// Design Name: 
// Module Name: uart_tx_sim
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
module uart_tx_sim;


    reg clk;
    reg rst_n;
    reg [7:0] data_byte;
    reg send_en;
    reg [2:0] baud_set;
    wire rs232_tx;
    wire tx_done;
    wire uart_state;
    
    
    
uart_byte_tx    uart_byte_tx_inst(
     .clk                 (clk),
     .rst_n              ( rst_n),
    .data_byte      (data_byte),
    .send_en        (send_en)   ,
    .baud_set        (baud_set)  ,
    .rs232_tx         ( rs232_tx),
    .tx_done         (tx_done),
    .uart_state      (uart_state)
    );


    initial clk = 1;
    always #(`clk_period/2) clk = ~clk;
    
    initial begin
        rst_n = 1'b0;
        data_byte = 8'd0;
        send_en = 1'd0;
        baud_set = 3'd0;        //9600bps
        #(`clk_period*20 + 1)
        rst_n = 1'b1;
        #(`clk_period*50 + 1)
        data_byte = 8'haa;
        send_en = 1'd1;
        #`clk_period
           send_en = 1'd0;
            @ (posedge tx_done)   //当tx_done上升沿的时候，表示一次发送完成
            # (`clk_period*5000)   //延迟一段时间在发送一次信号
            data_byte = 8'h55;
            send_en = 1'd0;
        end
            
            
            








endmodule


















