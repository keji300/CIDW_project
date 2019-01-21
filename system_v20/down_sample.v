`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2018/12/18 19:15:08
// Design Name: 
// Module Name: down_sample
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


module down_sample(
input clk,
input rst,
input [31:0]data_in,
input valid_in,
output reg [31:0] data_out,
output reg valid_out
    );
    //10倍降采样，用最后一个有效值，所有值均无效用32'b0代替
    
    
    
    reg [3:0] cont_10;
    reg [79:0] valid_flag;
    reg [6:0] cont_80;
    reg [1:0] state;
    reg we;
    reg [6:0] w_addr;
    reg [6:0] r_addr;
    wire [31:0] r_data;
    reg [31:0]w_data;
    always @ (posedge clk or negedge rst)
    begin
    	if (! rst)
    	begin
    		cont_10 <= 0;
    		valid_out <=0;
    		valid_flag <= 0;
    		cont_80 <= 0;
    		state <= 0;
    		we <= 0;
    	end
    	else
    	begin
    		case (state)
    		0:
    		begin
    			valid_out <= 0;
    			cont_80 <= cont_80 + valid_in;
    			state <= valid_in;
    			valid_flag [cont_80] <= valid_flag [cont_80] | (data_in[31] & valid_in);
    			we <= data_in[31] & valid_in;
    			w_addr <= cont_80;
    			w_data <= data_in;
    		end
    		1:
    		begin
    			r_addr <= 0;
				if (cont_80 >= 79 && valid_in)
				begin
					cont_80 <= 0;
					state <= (cont_10>=9  ?  2 : 0                 );
					 cont_10 <= cont_10 + 1;
				end
				else
				begin
					cont_80 <= cont_80 + valid_in;
					state <= state;
				end
				valid_flag [cont_80] <= valid_flag [cont_80] | (data_in[31] & valid_in);
				we <= data_in[31] & valid_in;
				w_addr <= cont_80;
				w_data <= data_in;
    		end
    		2:
    		begin
    			data_out <= valid_flag[0] ? r_data : 32'b0;
    			valid_flag <= valid_flag >>1;
    			valid_flag[79] <= 0;
    			valid_out <= 1;
    			cont_10 <= 0;
    			r_addr <= r_addr + 1;
    			if (r_addr >= 79)
    			begin
    				state <=0;
    				
    			end
    			else
    			begin
    				state <= state;
    			end
    		end
    		endcase
    	end
    end
    
    
    
     dist_mem_32x128 my_dist_mem_32x128
       (
        .a     (w_addr   ),
        .d     (w_data   ),
        .dpra  (r_addr),
        .clk   (clk ),
        .we    (we  ),
        .dpo   (r_data )
      );
    
endmodule
