`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/03/11 14:11:59
// Design Name: 
// Module Name: fft_sin_sim
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

`define clk_periods 20
`define data_length 1024;
module fft_sin_sim(

    );
    
    reg aclk, arst;
    reg [11:0] input_data_ch1;
    wire [18:0] fft_real, fft_imag;
    wire fft_out_valid;
    wire [42:0]   amp;
    fft_test                         fft_test_inst (      
            .aclk                     (aclk),
            .aresetn                 (arst),
    
            .input_data_ch1 (input_data_ch1),
            .fft_real                  (fft_real),
            .fft_imag               (fft_imag),
            .amp                      (amp),
            .fft_out_valid        (fft_out_valid)
    );
    
    initial 
        begin
            aclk = 0;
            input_data_ch1 = 12'd0;
            arst = 0;
            # (`clk_periods*1 + 1);
            arst = 1;
        end
        
        
        always # (`clk_periods /2) aclk = ~aclk;
        
        integer Pattern;
        reg [11:0] stimulus[1:1024];
        
        initial
            begin
                $readmemb("D:/FPGA_CIDW/system_v28/sin.txt",stimulus);
                Pattern = 0;
                repeat(1000)
                    begin
                        Pattern = Pattern +1 ;
                        input_data_ch1 = stimulus[Pattern];
                        # `clk_periods;
                    end
            end
        
    
    
    
    
    
    
endmodule














