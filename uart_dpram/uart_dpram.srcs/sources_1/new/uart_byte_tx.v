`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/02/15 10:19:43
// Design Name: 
// Module Name: uart_byte_tx
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// ʵ��uart����ͨ��Э��
/*	1.ͨ����ʱ�ӷ�Ƶ����ʵ�ֶԲ����ʵĿ���  50Mhz -��9600hz
	2.�õ������ʵ�ʱ�Ӻ��ʱ�ӽ��м���bps_clk ��bps_clk��ֵ�ͱ�ʾЭ���еĵڼ�������
	3. ������·����� tx_done bps_cnt

*/
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module uart_byte_tx(
    input clk,
    input rst_n,
    input [7:0] data_byte,
    input send_en,
    input [2:0] baud_set,
    output reg rs232_tx,
    output reg tx_done,
    output reg uart_state
    );
    
  //  parameter bps_DR = 104167;
    reg [15:0] div_cnt;   //��Ƶ����������

    reg bps_clk; //������ʱ��
    
    reg [15:0] bps_DR; //��Ƶ�������ֵ
    
    reg [3:0] bps_cnt;  //baud ʱ�Ӽ����� �����㷢�͵��ڼ������ݣ�
    
    reg [7:0] r_data_byte;  //�Ĵ������data_byte
    
    //div counter
    always@(posedge clk or negedge rst_n)
    if(!rst_n)
        div_cnt <= 16'd0;
    else if (uart_state)   //send_en = 1 -> uart_state =1 -> ��ʼ����
        begin
            if(div_cnt <= bps_DR)
                  div_cnt <= 16'd0;
             else 
                   div_cnt <= div_cnt + 1'b1;
        end
    else
        div_cnt <= 16'd0;
   
   //����������ʱ��
    always@(posedge clk or negedge rst_n)
    if(!rst_n)
        bps_clk <= 1'b0;
    else if (div_cnt <= 16'd1)   //�����div_cnt =���ֵ��ʱ��ʼ�������źŻ��ͺ�һλ
        bps_clk = 1'b1;
    else
        bps_clk <= 1'b0;
        
        //���bps���ұ�
    always@(posedge clk or negedge rst_n)
    if(!rst_n)
        bps_DR <= 16'd5207;
    else
        begin
            case(baud_set)
                0 : bps_DR <=  16'd5207;    //9600
                1 : bps_DR <=  16'd2603;    //115200
                2 : bps_DR <=  16'd1301;
                3 : bps_DR <=  16'd867;
               default : bps_DR <= 16'd5207;
            endcase
        end
    
    // ���㷢��λ��  bps_cnt��ֵ=11��ʾ�������
    always@(posedge clk or negedge rst_n)
    if(!rst_n)
        bps_cnt <= 4'd0;
    else if (tx_done)               //������·
        bps_cnt  <= 4'd0;       
    else if (bps_clk)
        bps_cnt <= bps_cnt + 1'b1;
   else
        bps_cnt <= bps_cnt;
        
   //��������ź�
   always@(posedge clk or negedge rst_n)
   if (!rst_n)
        tx_done <= 1'b0;
   else if (bps_cnt == 4'd11 )
        tx_done <= 1'b1;
   else
        tx_done <= tx_done;
        
     //��·��
     always@(posedge clk or negedge rst_n)
        if(!rst_n)
            rs232_tx <= 1'b1;
        else 
            begin
                case(bps_cnt)
                    0: rs232_tx <= 1'b1;
                    1: rs232_tx <= 1'b0;  //start bit
                    2: rs232_tx <=r_data_byte[0] ;
                    3: rs232_tx <=r_data_byte[1] ;
                    4: rs232_tx <=r_data_byte[2] ;
                    5: rs232_tx <=r_data_byte[3] ;
                    6: rs232_tx <=r_data_byte[4] ;
                    7: rs232_tx <=r_data_byte[5] ;
                    8: rs232_tx <=r_data_byte[6] ;
                    9: rs232_tx <=r_data_byte[7] ;
                    10: rs232_tx <=  1'b0;      //stop bit
                 default : rs232_tx <= 1'b1;
               endcase
            end
         
  //�Ĵ������źţ�ֻ����send_en��Ч��ʱ��ŷ�������   
    always@(posedge clk or negedge rst_n)
       if(!rst_n) 
            r_data_byte <= 8'd0;
        else if (send_en)
            r_data_byte <= data_byte;
        else
            r_data_byte <= data_byte;
      
    // uart_state
      always@(posedge clk or negedge rst_n)
       if(!rst_n)  
            uart_state <= 1'b0; 
       else if (send_en)
            uart_state <= 1'b1;
       else if (tx_done)
            uart_state <= 1'b0;
        else
            uart_state <= uart_state;
            
            
endmodule




























