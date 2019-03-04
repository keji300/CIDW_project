`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/02/28 21:53:09
// Design Name: 
// Module Name: HT6221_top
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// ����ʱ�򣺵ȴ�9ms�͵�ƽ��4.5ms�ĸߵ�ƽ����ʼ�ź�
//Ȼ��ʶ��32λ�ĵ�ַ�룬�����룬���ݷ��� ���������
// Dependencies:  
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// ״̬��ʵ��
/*  S0:IDEL �ȴ�IR�����źŵ��½���
    S1: ʶ��9ms�ĵ͵�ƽ�����룬ʶ��ɹ��������ʶ��4.5ms�ĸߵ�ƽ������
    S2: ʶ��4.5ms�ĸߵ�ƽ������
    S3:  ����״̬������32�����ֶ�����߷������󣬷���IDEL
//////////////////////////////////////////////////////////////////////////////////
*/

module IR_decode(
    input clk,
    input rst_n,
    input iir,                                      //IR�����ź�
    output get_flag,
    output wire [14:0] ir_data,
    output wire [14:0] ir_addr
    );
    
    reg [31:0] data_tmp;
    reg cnt_en;
    reg [19:0] cnt;     //time cnt
    reg t9ms_ok;        //9ms 
    reg t4_5ms_ok;      //4.5ms
    reg t_56ms_ok;      //0.56ms
    reg t1_69ms_ok;     //1.69ms
    
    reg get_data_done;      //32λ���ݽ������
    reg timeout; 
    
    reg [3:0] state;
    parameter IDEL = 4'b0001;
    parameter LEADER_T9 = 4'b0010;
    parameter LEADER_T4_5 = 4'b0100;
    parameter DATE_GET= 4'b1000;
    
    assign ir_data = data_tmp [31:16];
    assign ir_addr = data_tmp [15:0];
    //
    assign get_flag = get_data_done;
    //
    always@(posedge clk or negedge rst_n)
        if (!rst_n)
            cnt <= 19'd0;
        else if (cnt_en)
            begin
                    cnt <= cnt + 1'd1;
            end
       else
            cnt <= 19'd0;

//
always@(posedge clk or negedge rst_n)
        if (!rst_n)
            timeout <= 1'b0;
        else if (cnt > 19'd500000)
            begin
                  timeout <= 1'b1;
            end
       else
            timeout <= 1'b0;

                
    
    // 9ms ʶ�� ������λ1��
    always@(posedge clk or negedge rst_n)
        if (!rst_n)
                t9ms_ok <= 1'b0;
        else if (cnt > 'd425000 && cnt < 'd475000)      //cnt ����8.5~9.5ms֮��
            t9ms_ok <= 1'b1;
        else
            t9ms_ok <= 1'b0;
            
        //4.5ms   ������λ2��
       always@(posedge clk or negedge rst_n)
            if (!rst_n)
                    t4_5ms_ok <= 1'b0;
            else if (cnt > 'd212500 && cnt < 'd237500)      
                t4_5ms_ok <= 1'b1;
            else
                t4_5ms_ok <= 1'b0;
                
  //560us  �߼�0
  always@(posedge clk or negedge rst_n)
       if (!rst_n)
           t_56ms_ok <= 1'b0;
       else if (cnt > 'd25000 && cnt < 'd30000)      //500us~600us
           t_56ms_ok <= 1'b1;
       else
           t_56ms_ok <= 1'b0;
           
       //1.69ms       �߼�1
   always@(posedge clk or negedge rst_n)
        if (!rst_n)
            t1_69ms_ok <= 1'b0;
        else if (cnt > 'd80000 && cnt < 'd90000)      //1.6~1.8 ns
            t1_69ms_ok <= 1'b1;
        else
            t1_69ms_ok <= 1'b0;
    
    // edge test
    reg s_ir0,s_ir1;
     always@(posedge clk or negedge rst_n )
            if (!rst_n)
               begin 
                    s_ir0 <= 1'b0;
                    s_ir1 <= 1'b0;
                end
           else
            begin
                s_ir0 <= iir;
                s_ir1 <= s_ir0;
            end
    
     reg s_ir0_tmp,s_ir1_tmp;
     always@(posedge clk  or negedge rst_n )
        if (!rst_n)
            begin
                s_ir0_tmp <=1'b0;
                s_ir1_tmp <=1'b0;
            end
        else
       begin
          s_ir0_tmp <= s_ir1;
          s_ir1_tmp <= s_ir0_tmp;
       end
   
   wire ir_pdege,ir_ndege;
   assign ir_pdege = !s_ir1_tmp && s_ir0_tmp;
   assign ir_ndege = s_ir1_tmp && !s_ir0_tmp;       //�½��ص�ʱ�����������
   
    
    always@(posedge clk or negedge rst_n)
        if (!rst_n)
          begin
            state <= IDEL;
            cnt_en <= 1'b0;
          end
        else if (timeout)
            begin
                case (state)
                    IDEL:   
                        if (ir_ndege)
                        begin
                            cnt_en <= 1'b1;
                            state <= LEADER_T9;
                        end
                        else
                        begin
                            cnt_en <= 1'b0;
                            state <= IDEL;
                        end
                        
                    LEADER_T9 :
                       if (ir_pdege) 
                            begin
                               if (t9ms_ok)
                               begin
                                  cnt_en <= 1'b0;
                                  state <= LEADER_T4_5;
                                end
                                else
                                begin
                                  state <= IDEL;
                                end
                           end
                    else
                        begin
                           cnt_en <= 1'b1;
                            state <= LEADER_T9;
                       end
                       //
                    LEADER_T4_5:
                       if (ir_ndege) 
                         begin
                            if (t4_5ms_ok)
                            begin
                               cnt_en <= 1'b0;
                               state <= DATE_GET;
                            end
                             else
                               state <= IDEL;
                        end
                    else 
                      begin
                       cnt_en <= 1'b1;
                        state <= LEADER_T4_5;
                      end
           //��ʼdecode
                DATE_GET:  
                    if (ir_pdege && !t_56ms_ok )     //�ڵ�ƽ�����ر仯��ͬʱû�м�����56ms,��ʾ���ݽ���ʧ��
                        state <= IDEL;
                    else if (ir_ndege && ! t_56ms_ok || !t1_69ms_ok )             //��⵽ �½��ر�ʾ�ߵ�ƽ��ʱ�������
                         state <= IDEL;
                     else if (get_data_done)   //��ʼ����
                        begin
                            state <= IDEL;
                        end
                    else if (ir_pdege && t_56ms_ok )
                        begin
                            cnt_en <= 1'b0;
                        end
                    else if (ir_ndege && t_56ms_ok || t1_69ms_ok )
                        begin
                            cnt_en <= 1'b0;
                        end
                    else
                        cnt_en <= 1'b1;
                      
                  default : ;        
                endcase
            end
         else 
            begin
                cnt_en = 1'b0;
                state <= IDEL;
            end
    
    reg [5:0]data_cnt ;         //�������ٸ�����  �����㵽��33�������ص�ʱ�����ݽ���
   // ��ʼ�������ݵĴ������� 
     always@(posedge clk or negedge rst_n)
          if (!rst_n)
            begin
                data_tmp <= 32'd0;
                data_cnt <= 6'd0;
                get_data_done <= 1'b0;
            end
          else if (state == DATE_GET)       //�ڽ������ݵ�״̬�£�ÿ��һ�������ر�ʾ����һ������
            if (ir_pdege && data_cnt == 6'd33)
                begin
                    data_cnt <= 6'd0;
                    get_data_done <= 1'b1;
                end
           else
            begin
                data_cnt <= data_cnt + 1'b1;
                get_data_done <= 1'b0;
                if(ir_ndege && t_56ms_ok)
                    begin
                        data_tmp[data_cnt] <= 1'b0;
                    end
                else if (ir_ndege && t1_69ms_ok)
                    begin
                        data_tmp[data_cnt] <= 1'b1;
                    end
            end
    
    
    
    
    
endmodule













