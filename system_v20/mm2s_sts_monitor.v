//////////////////////////             
////MM2S STS Monitor//////
//////////////////////////


module mm2s_sts_monitor
(
 input  wire       s_axi_clk ,
input  wire       s_axi_resetn ,

input  wire [7:0] s_axis_tdata ,
input  wire       s_axis_tvalid ,
input  wire       s_axis_tkeep,
input  wire       s_axis_tlast ,
output wire        m_axis_tready,
output reg        pass,
output reg        fail,

output reg  [3:0] tag,
input  wire      ack

);
  
assign m_axis_tready = 1'b1;       
      
always@(posedge s_axi_clk) 
 begin
  if(!s_axi_resetn)
   pass <= 1'b0;
  else if(s_axis_tlast)
   begin
    if(s_axis_tdata[7]&(|s_axis_tdata[6:4]))
     pass <= 1'b1;
    else 
     pass <= 1'b0;
   end
//  else
//     pass <= 1'b0; 
 end
 
 
always@(posedge s_axi_clk) 
 begin
  if(!s_axi_resetn)
   fail <= 1'b0;
  else if(ack)
      fail <= 1'b0;   
  else if(s_axis_tlast)
   begin
    if(s_axis_tdata[7]&(|s_axis_tdata[6:4]))
     fail <= 1'b0;
    else 
     fail <= 1'b1;
   end

 end 
   
  
always@(posedge s_axi_clk) 
 begin
  if(!s_axi_resetn)
   tag <= 4'b0;
  else if(s_axis_tlast)
   tag <= s_axis_tdata[3:0];
  else; 
 end


 endmodule
                                                                     