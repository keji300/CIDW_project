`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/02/14 16:05:34
// Design Name: 
// Module Name: key_filter
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


module key_filter(
    input clk,
    input rst_n,
    input key_in,
    output reg key_flag,  //���������¼�����20ms��ʱ�򣬲���һ������flag
    output reg key_state  //������key_flag��ʱ��ߵ�ƽ��key_state���ͣ�ֱ�������ɿ��ص�ƽ��״̬������
    );
    
   parameter  IDEL  =  4'b0001;
   parameter  FILTER0 = 4'b0010;
   parameter   DOWN = 4'b0100;
   parameter  FILTER = 4'b1000;

    reg [3:0] state;
    
    //���ؼ�� ��ʹ�������Ĵ����Ĵ���������ʱ�����ڵ�״̬��Ȼ��������߼�ȥ�ж�״̬�Ƿ�仯
    reg key_tmp0,key_tmp1;
    wire pedge,nedge;
    
    always@(posedge clk or negedge rst_n)
    begin
        if(!rst_n)
            begin
                key_tmp0 <= 0;
                key_tmp1 <= 0;
            end
        else
            begin
                key_tmp0 <= key_in;
                key_tmp1 <= key_tmp0;
            end  
    end
    
    assign nedge = !key_tmp0 & key_tmp1;
    assign pedge = key_tmp0 & ( !key_tmp1);

//20ms������ 50_000_000 ->20 ns ---> 1000_000
reg [19:0] cnt;
reg en_cnt;
reg cnt_full;  //��������־�ź�
always@(posedge clk or negedge rst_n)
    if(!rst_n)
        cnt <= 20'd0;
    else if (en_cnt)
        cnt <= cnt + 1'b1;
    else
        cnt <= 20'd0;
        
always@(posedge clk or negedge rst_n)
    if(!rst_n)
        cnt_full <=1'b0;
    else if (cnt == 20'd999999 )
        cnt_full <=1'b1;
    else
        cnt_full <=1'b0;

//״̬��
    always@(posedge clk or negedge rst_n)
        if(!rst_n)
            begin
                key_flag <=1'b0;
                key_state <= 1'b1;
                en_cnt <= 1'b0;
                state <= IDEL;
            end
        else 
            begin
                case (state)
                    IDEL :
                      begin
                        key_flag <= 1'b0;
                        if(nedge)
                            begin
                                state <= FILTER0;
                                en_cnt <= 1'b1; //��⵽�½���ʹ�ܼ���
                            end
                        else
                            state <= IDEL;
                        end
                   //�˲�״̬         
                   FILTER0 :
                        if(cnt_full)
                        begin
                            key_flag <= 1'b1;
                            key_state <= 1'b0;
                            state <= DOWN;
                            en_cnt <=0;
                        end
                        else if (pedge)         //û�������ͼ�⵽�����ر�ʾ��һ���������ص�IDEL
                        begin
                            en_cnt <= 0;
                            state <= IDEL;
                        end
                        else
                            state <= FILTER0;
                     //�������µ�״̬
                     DOWN:
                        begin
                            key_flag <= 1'b0;
                            if(pedge)
                                begin
                                    state <= FILTER;
                                    en_cnt <=1'b1;
                                end
                            else
                                state <= DOWN;
                        end
                       //����������˲�״̬
                    FILTER:
                        if(cnt_full)
                            begin
                                key_flag <= 1'b1;
                                key_state <= 1'b1;
                                state <= IDEL;
                            end
                        else if (nedge)
                            begin
                                en_cnt <= 1'b0;
                                state <= DOWN;
                            end
                        else
                            state <= FILTER;
                       //
                    default : 
                        begin
                            en_cnt <= 1'b0;
                            key_flag <= 1'b0;
                            key_state <= 1'b1;
                            state <= IDEL;    
                        end  
                        
                endcase
                            
                            
            end

        
    
endmodule




















































