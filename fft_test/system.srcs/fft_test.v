`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/03/08 09:28:39
// Design Name: 
// Module Name: fft_test
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


module fft_test(
    input aclk,
    input aresetn,
    
    input [11:0] input_data_ch1,
    output reg signed [23:0] fft_real,
    output reg signed [23:0] fft_imag,
    output reg [48:0] amp,
    output reg fft_out_valid

    );
    
    
    reg [11:0] input_data_ch1_reg;      //一级数据寄存器
    wire [7:0] s_axis_config_tdata;
    reg s_axis_config_tvalid;
    //wire s_axis_config_tready;
    wire s_axis_data_tready;
    reg [31:0] s_axis_data_tdata;
    reg s_axis_data_tvalid;
    reg s_axis_data_tlast;
    
    wire [47:0] m_axis_data_tdata;   //输入12位数据*12位旋转因子(e^-jwt) * (1+1)(实部加虚部)
    wire [15:0] m_axis_data_tuser;
    wire m_axis_data_tvalid;
    wire m_axis_data_tlast;
    reg [7:0] cfg_cnt;
    reg [13:0] sink_ctl_cnt;
    
    wire event_frame_started;
    wire event_tlast_unexpected;
    wire event_tlast_missing;
    wire event_status_channel_halt;
    wire event_data_in_channel_halt;
    wire event_data_out_channel_halt;
    
      xfft_0              xfft_0_inst(
            .aclk(aclk),
            .aresetn(aresetn),                                              
            .s_axis_config_tdata(s_axis_config_tdata),                  // 配置数据
            .s_axis_config_tvalid(s_axis_config_tvalid),                // 主机可以发送配置数据
            .s_axis_config_tready(),                // 可以接收配置数据
            .s_axis_data_tdata(s_axis_data_tdata),                      // input wire [95 : 0] s_axis_data_tdata 输入信号
            .s_axis_data_tvalid(s_axis_data_tvalid),                    // 输入信号有效
            .s_axis_data_tready(s_axis_data_tready),                    // output wire s_axis_data_tready 输出端可以接收信号
            .s_axis_data_tlast(s_axis_data_tlast),                      // input wire s_axis_data_tlast 
            .m_axis_data_tdata(m_axis_data_tdata),                      // output wire [95 : 0] m_axis_data_tdata 输出信号
            .m_axis_data_tvalid(m_axis_data_tvalid),                    // output wire m_axis_data_tvalid 输出有效
            .m_axis_data_tready(1'b1),                    // input wire m_axis_data_tready 外部设备已经准备好接收数据
            .m_axis_data_tlast(m_axis_data_tlast),                      // output wire m_axis_data_tlast 最后一个数据标志位
            .event_frame_started(event_frame_started),                  // output wire event_frame_started 新一帧数据开始标志
            .event_tlast_unexpected(event_tlast_unexpected),            // output wire event_tlast_unexpected 当s_axis_data_tlast = 1但是不是最后一个数据的时候拉高？
            .event_tlast_missing(event_tlast_missing),                  // output wire event_tlast_missing 当s_axis_data_tlast = 0 但是是最后一个数据的时候？
            .event_status_channel_halt(event_status_channel_halt),      // output wire event_status_channel_halt  当试图写入数据到status channel但是不允许写数据
            .event_data_in_channel_halt(event_data_in_channel_halt),    // output wire event_data_in_channel_halt  当向数据输入通道请求数据但是没有
            .event_data_out_channel_halt(event_data_out_channel_halt)  // output wire event_data_out_channel_halt 同上，data_channel
  
      
      
      );
      
    //------------------fft core config----------------------//
    always @ (posedge aclk or aresetn)
        begin
            if (!aresetn)
                cfg_cnt <= 8'd0;
            else
                begin
                    if (cfg_cnt <= 8'd200)
                        cfg_cnt <= cfg_cnt + 1'b1;
                    else
                        cfg_cnt <= cfg_cnt;
                end
              
        end
    
    always @ (posedge aclk or negedge aresetn)
        begin
            if (!aresetn)
                s_axis_config_tvalid <= 1'b0;
            else
                begin
                    if (cfg_cnt <= 8'd200)
                        s_axis_config_tvalid <= 1'b1;
                    else
                        s_axis_config_tvalid <= 1'b0;
                end
           
        end
    
    assign s_axis_config_tdata = 8'd1;          //1点fft？
    
    //----------------------fft core config---------------------------//
    
    //-----------------------fft sink_in ctrl--------------------------//
   always@(posedge aclk or negedge aresetn)
     begin
         if(!aresetn)
             s_axis_data_tdata <= 32'b0;
         else
             s_axis_data_tdata <= {20'd0,input_data_ch1};
     end
    
    always @ (posedge aclk or negedge aresetn)
        begin
            if (!aresetn)
                sink_ctl_cnt <= 'd8194;
            else if (s_axis_config_tvalid)
                sink_ctl_cnt <= 'd0;
            else if (sink_ctl_cnt == 'd8192)        
                sink_ctl_cnt <= 'd1;
            else
                sink_ctl_cnt <= sink_ctl_cnt + 1'b1; 
        end
    
    // s_axis_data_tvalid
    always @ (posedge aclk or negedge aresetn)
        begin
            if (!aresetn)
                s_axis_data_tvalid <= 1'b0;
            else if (sink_ctl_cnt < 14'd1)
                s_axis_data_tvalid <= 1'b0;
            else if (sink_ctl_cnt < 14'd2049)
                s_axis_data_tvalid <= 1'b1;
            else
                s_axis_data_tvalid <= 1'b0;
                 
        end
    
    // s_axis_data_tlast
        always @ (posedge aclk or negedge aresetn)
            begin
                if (!aresetn)
                    s_axis_data_tlast <= 1'b0;
                else
                    begin
                        if (sink_ctl_cnt == 14'd2048)
                            s_axis_data_tlast <= 1'b1;
                        else
                            s_axis_data_tlast <= 1'b0;
                    end
                    
            end
     //-----------------------fft sink_in ctrl--------------------------//
     
     always @ (posedge aclk)
        begin
            fft_real <= m_axis_data_tdata [23:0];
        end
        
    always @ (posedge aclk)
    begin
        fft_imag <= m_axis_data_tdata [47:24];
    end
     
     always @ (posedge aclk)
     begin
        fft_out_valid <= m_axis_data_tvalid;
     end
        
 //----------------------计算频谱（幅值信号）--------------------------------------//
 wire signed [47:0] xkre_square,skim_square;
 assign xkre_square = fft_real * fft_real;
 assign skim_square = fft_imag * fft_imag;
 
 always @ (posedge aclk)
    amp  <= xkre_square + skim_square;
 
 
 
 
    
    
endmodule




























