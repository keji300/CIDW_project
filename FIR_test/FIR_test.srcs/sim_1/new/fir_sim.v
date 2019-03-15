`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/03/15 15:08:45
// Design Name: 
// Module Name: fir_sim
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


module fir_sim(

    );

// fir_test Parameters
parameter PERIOD  = 10;


// fir_test Inputs
reg   clk                                  = 0 ;
reg   rst_n                                = 0 ;
reg   [15:0]  FIR_in                       = 0 ;
reg   out_en                               = 0 ;


reg [15:0] mem[1:4096];
// fir_test Outputs
wire  [31:0]  FIR_out                      ;


initial
begin
    forever #(PERIOD/2)  clk=~clk;
end

initial
begin
    #(PERIOD*2) rst_n  =  1;
end

fir_test  fir_test_inst (
    .clk                     ( clk             ),
    .rst_n                   ( rst_n           ),
    .FIR_in                  ( FIR_in   [15:0] ),
    .out_en                  ( out_en          ),

    .FIR_out                 ( FIR_out  [31:0] )
);

initial
begin
    #(PERIOD*3+1)
    out_en = 1;
    $readmemh("D:/FPGA_CIDW/FIR_test/sin2.txt",mem);

end
integer i;
always@(posedge clk or negedge rst_n) 
    if(!rst_n)                                
        FIR_in <= 16'b0 ;
    else
            FIR_in <= mem[i];     



always@(posedge clk or negedge rst_n) 
    if(!rst_n)
        i <= 12'd0;
    else
        i <= i + 1'd1;




endmodule
