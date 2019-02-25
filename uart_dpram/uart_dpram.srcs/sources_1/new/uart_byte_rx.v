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
    1.��ʼλ������
    2.�����ʲ���ģ�� ��10+6��*10
    3.���ݽ��ս���
*/
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
/*��ҵ�����µ����ݽ���ʵ�֣���֤ͨ�ŵ��ȶ�
ÿһλ�����ݵ��м�ʱ�������ȶ��ģ�һ��Ӧ�òɼ��м�ʱ�̵�����
�ڹ�ҵ��������ǿ��Ÿ��� ����Ҫʹ�ö�β�������ʵķ�����
��ÿһλ���ݽ��ж�Σ�16�Σ����������ݱ仯ʱ��ǰ������ݲ��ȶ��˲����в���ֻ�����м�ε����ݣ�
���������м���в�����ѡ�����λ�����������Ϊ�������
    
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
    reg [15:0] bps_DR;      //��Ƶ���������ֵ
    reg [15:0] div_cnt;         //��Ƶ������
    reg tmp0_rs232_rx, tmp1_rs232_rx; //�ݴ�Ĵ���
    reg uart_state;
    
    reg [2:0] r_data_byte [7:0] ;       //�ۼӼ�⵽�����ݣ����������6=1+1+1+1+1+1��
    reg [2:0] START_BIT,STOP_BIT;
    
    reg [7:0] tmp_data_byte;
    
    
    wire negdge;
     //rs232_rx���ⲿ���첽�źţ�Ϊ�˱�������̬���������ͬ�����������Ĵ���
     reg s0_rs232_rx,s1_rs232_rx; //ͬ���Ĵ���
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
   
   //baud���ұ�
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
    
    // ���ݼĴ�
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
            
       //��ʼλ���(���ؼ�⣩     
        assign negdge =  !tmp0_rs232_rx & tmp1_rs232_rx; //ǰһ��ʱ��Ϊ1����һ��ʱ��Ϊ0 -���½���
         
       //��Ƶ����
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
           
                 
            // �������λ��  bps_cnt��ֵ=160��ʾ�������
      always@(posedge clk or negedge rst_n)
          if(!rst_n)
              bps_cnt <= 8'd0;
          else if (rx_done |  (bps_cnt == 8'd12 && (START_BIT > 2)))               //������· �����ʼλ����Ҳֹͣ����
              bps_cnt  <= 8'd0;       
          else if (bps_clk)
              bps_cnt <= bps_cnt + 1'b1;
         else
              bps_cnt <= bps_cnt;
              
              
  //��������ź�
       always@(posedge clk or negedge rst_n)
       if (!rst_n)
            rx_done <= 1'b0;
       else if (bps_cnt == 8'd159 )
            rx_done <= 1'b1;
       else
            rx_done <= rx_done;
    
    
    
 //��·�� ���������룩
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
            case(bps_cnt)   //�������bps_cnt����0 ��ʱ�������Ҳ��0���¼������
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
   
   //������ȡ
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

//����uart_state
        always@(posedge clk or negedge rst_n)
            if (!rst_n)
                uart_state <= 1'b0;
            else if (negdge)
                uart_state = 1'b1;
            else if (rx_done || (bps_cnt == 8'd12 && (START_BIT > 2)) ) //������ɻ��߽��մ���
                uart_state = 1'b0;
            else
                uart_state <= uart_state;
                
    //�������
   always@(posedge clk or negedge rst_n)
    if (!rst_n)
         rx_data <= 8'b0;
    else if (bps_cnt == 8'd159 )
         rx_data <= tmp_data_byte;
    else
         rx_data <= rx_data;
         
         
endmodule








































