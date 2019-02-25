`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/02/14 09:15:49
// Design Name: 
// Module Name: uart_dpram_top
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


module uart_dpram_top(
    input clk,
    input rst_n,
    input key_in,
    input rx232_rx,
    
    output rx232_tx
   
    );
    
    wire key_flag;
    wire key_state;
    wire rx_done;
    wire tx_done;
    wire send_en;
    wire [7:0] rd_addr;
    wire [7:0] wr_addr;
    wire wren;
    wire [7:0] rx_data,tx_data;
    
    
    
    //tx module
    uart_byte_tx    uart_byte_tx_inst(
        .clk(clk),
        .rst_n(rst_n),
        .send_en(send_en),
        .tx_data(tx_data),
        .baud_set(3'd0),    //baud set 0 means 9600
        .rs232_tx(rs232_tx),
        .tx_done(tx_done),
        .uart_state()          //ignore
    );
    
    //rx_module 
    uart_byte_rx        uart_byte_rx_inst(
        .clk(clk),
        .rst_n(rst_n),
        .baud_set(3'd0),
        .rx232_rx(rx232_rx),
        .rx_done(rx_done),
        .rx_data(rx_data)
        
);
  
 //key module 
key_filter      key_filter_inst(
    .clk(clk),
    .rst_n(rst_n),
    .key_in(key_in),
    .key_flag(key_flag),
    .key_state(key_state)
); 

//ram ip
 blk_mem_gen_0      blk_mem_gen_0_inst(
     .clk(clk),
     .ena(1'b1),
     .wea(wren),
     .addra(wr_addr), 
     .dina(rx_data),   //从uart_rx模块接收到的数据（上位机过来）
     .clkb(clk), 
     .addrb(rd_addr),
     .doutb(tx_data)   //输出信号，给uart_tx模块
 );
 
 //ctrl module
    ctrl        ctrl_inst(
        .clk(clk),
        .rst_n(rst_n),
        .key_flag(key_flag),
        .key_state(key_state),
        .rx_done(rx_done),
        .tx_done(tx_done),
        //output
        .wren(wren),
        .wr_addr(wr_addr),
        .rd_addr(rd_addr),
        .send_en(send_en)
        
    );
 


   
   
   
   
endmodule
