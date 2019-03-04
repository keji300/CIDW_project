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
// 红外时序：等待9ms低电平和4.5ms的高电平的起始信号
//然后识别32位的地址码，数据码，数据反码 最后解码结束
// Dependencies:  
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 状态机实现
/*  S0:IDEL 等待IR接收信号的下降沿
    S1: 识别9ms的低电平引导码，识别成功进入继续识别4.5ms的高电平引导码
    S2: 识别4.5ms的高电平引导码
    S3:  读吗状态，若读32个码字读完或者发生错误，返回IDEL
//////////////////////////////////////////////////////////////////////////////////
*/

module IR_decode(
    input clk,
    input rst_n,
    input iir,                                      //IR输入信号
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
    
    reg get_data_done;      //32位数据接收完成
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

                
    
    // 9ms 识别 （引导位1）
    always@(posedge clk or negedge rst_n)
        if (!rst_n)
                t9ms_ok <= 1'b0;
        else if (cnt > 'd425000 && cnt < 'd475000)      //cnt 落在8.5~9.5ms之间
            t9ms_ok <= 1'b1;
        else
            t9ms_ok <= 1'b0;
            
        //4.5ms   （引导位2）
       always@(posedge clk or negedge rst_n)
            if (!rst_n)
                    t4_5ms_ok <= 1'b0;
            else if (cnt > 'd212500 && cnt < 'd237500)      
                t4_5ms_ok <= 1'b1;
            else
                t4_5ms_ok <= 1'b0;
                
  //560us  逻辑0
  always@(posedge clk or negedge rst_n)
       if (!rst_n)
           t_56ms_ok <= 1'b0;
       else if (cnt > 'd25000 && cnt < 'd30000)      //500us~600us
           t_56ms_ok <= 1'b1;
       else
           t_56ms_ok <= 1'b0;
           
       //1.69ms       逻辑1
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
   assign ir_ndege = s_ir1_tmp && !s_ir0_tmp;       //下降沿的时候产生引导码
   
    
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
           //开始decode
                DATE_GET:  
                    if (ir_pdege && !t_56ms_ok )     //在电平上升沿变化的同时没有计数到56ms,表示数据解码失败
                        state <= IDEL;
                    else if (ir_ndege && ! t_56ms_ok || !t1_69ms_ok )             //检测到 下降沿表示高电平的时间结束了
                         state <= IDEL;
                     else if (get_data_done)   //开始解码
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
    
    reg [5:0]data_cnt ;         //计数多少个数据  当计算到第33个上升沿的时候数据结束
   // 开始接收数据的处理。。。 
     always@(posedge clk or negedge rst_n)
          if (!rst_n)
            begin
                data_tmp <= 32'd0;
                data_cnt <= 6'd0;
                get_data_done <= 1'b0;
            end
          else if (state == DATE_GET)       //在接收数据的状态下，每来一个上升沿表示来了一个数据
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













