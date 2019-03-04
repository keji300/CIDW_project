`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/03/04 17:05:21
// Design Name: 
// Module Name: ir_decode_sim
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
module ir_decode_sim;

  reg clk;
  reg rst_n;
  reg iir;
  wire get_flag;
  wire [14:0] ir_data;
  wire [14:0] ir_addr;

IR_decode           IR_decode_inst(
   . clk                        (clk),
   . rst_n                     (rst_n),
   . iir                          (iir),
   . get_flag               (get_flag),
   . ir_data                  (ir_data),
   .  ir_addr                 (ir_addr)
   );

    initial clk = 1;
    always # (`clk_period /2) clk = ~clk;
    
    initial 
        begin
            rst_n = 1'b0;
            iir = 1'b0;
            # (`clk_period * 10 + 1)
            rst_n = 1'b1;
            
            iir = 1'b1;
            send_data(1,8'h12);
            #(60000000);
            send_data(3,8'heb);
            #(60000000);
        end

    integer i;
    
    task   send_data;
        input [15:0] addr;
        input [7:0] data;
        begin
        //IIRcommunication protocol
            iir = 1'b0;
            #900000;
            iir = 1;
            #450000;
            //addr
            for(i=0;i<15;i=i+1)
                begin
                    bit_send(i);
                end        
                //data
            for(i=0;i<7;i=i+1)
                begin
                    bit_send(data[i]);
                end 
                //~data
            for(i=0;i<7;i=i+1)
                    begin
                        bit_send(~data[i]);
                    end 
            //stop plus
            iir = 0;
            #560000;
            iir = 1;
                    
        end 
        
    
    endtask


    task bit_send;
        input one_bit;
        begin
            iir = 0;
            #560000;
            iir = 1;
            if(one_bit)
                #1690000;
            else
                #560000;
        end
    endtask


endmodule













