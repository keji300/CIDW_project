`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/02/15 09:14:06
// Design Name: 
// Module Name: key_filter_tb
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

module key_filter_tb;

reg clk;
reg rst_n;
reg key_in;
wire key_flag;
wire key_state;

key_filter      key_filter_inst(
    .clk             (clk),
    .rst_n          (rst_n),
    .key_in        (key_in),
    .key_flag     (key_flag),
    .key_state    (key_state)
);

initial clk = 1;
always #(`clk_period/2)  clk = ~clk;

initial 
    begin
        rst_n = 1'b0;
        key_in = 1'b1;
        #(`clk_period * 10)  rst_n = 1'b0;
        #(`clk_period * 10 + 1) ;
       //ģ�ⶶ��
//        key_in = 0; #1000;
//        key_in = 1;#2000;
//        key_in = 0; #1400;
//        key_in = 1;#2400;
//        key_in = 0; #1300;
//        key_in = 1;#200;
//        //�ȶ�
//        key_in = 0;#200000100;
//        #10000;
//        //�ͷ�
//           key_in = 1; #1000;
//           key_in = 0;#2000;
//           key_in = 1; #1400;
//           key_in = 0;#2400;
//           key_in = 1; #1300;
//           key_in = 0;#200;
//            key_in = 1;#20000100;
            
//            #10000;
            press_key;
            #10000
            press_key;
           
    end
    
    //task ģ��һ�ΰ��µĹ���
    reg [15:0] myrand;
    
    task press_key;
        begin
            repeat (50) 
                begin
                    myrand ={$random} % 65536; //��ֵ֤����0~65535������{ }����-65535~65536
                    #myrand key_in = ~key_in; //key_in �����ʱ����ת50 ��
                end
                key_in = 0;
                #50000000;
                //�ͷ�
                begin
                    myrand ={$random} % 65536; //��ֵ֤����0~65535������{ }����-65535~65536
                    #myrand key_in = ~key_in; //key_in �����ʱ����ת50 ��
                end
                    key_in = 1;
                    #50000000;
                
                
        end
    endtask

endmodule






















