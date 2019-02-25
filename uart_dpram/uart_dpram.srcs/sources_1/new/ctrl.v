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
    
    reg do_send;    //��ʼ��ram���ݵ��ź�
    reg r0_send_done,r1_send_done;
    
    
    //ÿ����һ��rx���źžͷ��͵�ram��
    //�� rx_done ��wr_en ͬ��
    assign wren = rx_done;
    
    //һֱ��wren�źŵ��¸�ʱ�ӻ������д���Ӧ�ĵ�ַ
    always@(posedge clk or negedge rst_n)
    begin
        if (!rst_n)
            wr_addr <= 8'd0;
        else if(rx_done)
            wr_addr <= wr_addr + 1'b1;  //ÿ����һ��rx_done д��ַ��1��
        else
            wr_addr <= wr_addr;
    end
    
    //��ram�е��ź�
     always@(posedge clk or negedge rst_n)
       begin
           if (!rst_n)
              do_send <= 1'd0;
           else if (key_flag && !key_state)   //key_flag��Ч����key_flgaΪ�ͱ�ʾ������Ч����ʼ��ram�е�����
              do_send <= ~do_send;  //������������Ϊƹ�Ҳ�������һ�η�תһ�α�־
     
      end
      
      always@(posedge clk or negedge rst_n)
      begin
            if (!rst_n)
                rd_addr <= 8'd0;
            else if (do_send && tx_done) //�������²�����һ�η����Ѿ����
                rd_addr <= rd_addr + 1'b1;
            else 
                rd_addr <= rd_addr;
      end
    
    //��������ź��ӳ�2�ģ��ڰ�r1_send_done��Ϊ�����ź�
    //��Ϊram�ڶ���ַ+1��ʱ����ӳ�2�İ��ź����
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
                  else if (r1_send_done) //�ӳ�2����ʹ�ܷ����ź�
                    send_en <= 1'b1;
                 else
                    send_en <= 1'b0;
                  
             end
    
endmodule





























