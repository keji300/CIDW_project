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
*/
//////////////////////////////////////////////////////////////////////////////////


module HT6221_top(

    );
endmodule
