`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2018/11/30 16:45:33
// Design Name: 
// Module Name: wr_ps_ctrl
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


module wr_ps_ctrl(
	input			ps_clk,
	input			ps_rst,
	input			pl_clk,
	input			pl_rst,
	input			pl_ddr_rd_en,
	input	[31:0]	pl_ddr_rd_data,
	input           ps_busy,
	input				ps_ddr_wr_finish,
	output	reg 		ps_ddr_wr_start,
	output	reg [31:0]	ps_ddr_wr_addr,
	output	reg [31:0]	ps_ddr_wr_length,
	output	reg 		ps_ddr_wr_en,
	output	reg [31:0]	ps_ddr_wr_data,
	output  [1:0]  state_out,
	output  [31:0] rd_cont,
	output [79:0] fifo_state,
	output reg wt_finish
    );
	
	reg [31:0] cont0;
	reg one_plus;
	assign state_out = 2'b10;
	assign rd_cont = cont0;
	always @ (posedge ps_clk or negedge ps_rst)
	begin
		if (!ps_rst)
		begin
			cont0 <= 0;
			one_plus <= 0;
		end
		else
		begin
			one_plus <= cont0 >= 80 *10000 ;
			if (wt_finish)
			begin
				if (pl_ddr_rd_en)
					cont0 <= cont0 - 80 *10000+1;
				else
					cont0 <= cont0 - 80 *10000;
			end
			else if (pl_ddr_rd_en)
				cont0 <= cont0 + 1;
			
		end
	end
	parameter addr_shift1 = 'h3c00_0000;
	
	parameter addr_shift2 = 'h10000;
	parameter addr_shift3 = 'h40;
	reg flush_flag;
	reg [1:0]w_state;
	reg [6:0] w_cont80;
	wire [79:0] w_en_flag;
	reg we;
	reg [7:0] w_addr;
	reg [7:0] r_addr;
	wire [31:0] r_data;
	reg [31:0]w_data;
	reg [1:0] cont4;
	reg [31:0] shift_5M;
	reg [8:0] w_cont256;
	reg [7:0 ] fifo_cont_reg0,	fifo_cont_reg1,	fifo_cont_reg2,	fifo_cont_reg3,	fifo_cont_reg4,	fifo_cont_reg5,	fifo_cont_reg6,	fifo_cont_reg7,	fifo_cont_reg8,	fifo_cont_reg9,	fifo_cont_reg10,	fifo_cont_reg11,	fifo_cont_reg12,	fifo_cont_reg13,	fifo_cont_reg14,	fifo_cont_reg15,	fifo_cont_reg16,	fifo_cont_reg17,	fifo_cont_reg18,	fifo_cont_reg19,	fifo_cont_reg20,	fifo_cont_reg21,	fifo_cont_reg22,	fifo_cont_reg23,	fifo_cont_reg24,	fifo_cont_reg25,	fifo_cont_reg26,	fifo_cont_reg27,	fifo_cont_reg28,	fifo_cont_reg29,	fifo_cont_reg30,	fifo_cont_reg31,	fifo_cont_reg32,	fifo_cont_reg33,	fifo_cont_reg34,	fifo_cont_reg35,	fifo_cont_reg36,	fifo_cont_reg37,	fifo_cont_reg38,	fifo_cont_reg39,	fifo_cont_reg40,	fifo_cont_reg41,	fifo_cont_reg42,	fifo_cont_reg43,	fifo_cont_reg44,	fifo_cont_reg45,	fifo_cont_reg46,	fifo_cont_reg47,	fifo_cont_reg48,	fifo_cont_reg49,	fifo_cont_reg50,	fifo_cont_reg51,	fifo_cont_reg52,	fifo_cont_reg53,	fifo_cont_reg54,	fifo_cont_reg55,	fifo_cont_reg56,	fifo_cont_reg57,	fifo_cont_reg58,	fifo_cont_reg59,	fifo_cont_reg60,	fifo_cont_reg61,	fifo_cont_reg62,	fifo_cont_reg63,	fifo_cont_reg64,	fifo_cont_reg65,	fifo_cont_reg66,	fifo_cont_reg67,	fifo_cont_reg68,	fifo_cont_reg69,	fifo_cont_reg70,	fifo_cont_reg71,	fifo_cont_reg72,	fifo_cont_reg73,	fifo_cont_reg74,	fifo_cont_reg75,	fifo_cont_reg76,	fifo_cont_reg77,	fifo_cont_reg78,	fifo_cont_reg79;
	reg rd_en0,	rd_en1,	rd_en2,	rd_en3,	rd_en4,	rd_en5,	rd_en6,	rd_en7,	rd_en8,	rd_en9,	rd_en10,	rd_en11,	rd_en12,	rd_en13,	rd_en14,	rd_en15,	rd_en16,	rd_en17,	rd_en18,	rd_en19,	rd_en20,	rd_en21,	rd_en22,	rd_en23,	rd_en24,	rd_en25,	rd_en26,	rd_en27,	rd_en28,	rd_en29,	rd_en30,	rd_en31,	rd_en32,	rd_en33,	rd_en34,	rd_en35,	rd_en36,	rd_en37,	rd_en38,	rd_en39,	rd_en40,	rd_en41,	rd_en42,	rd_en43,	rd_en44,	rd_en45,	rd_en46,	rd_en47,	rd_en48,	rd_en49,	rd_en50,	rd_en51,	rd_en52,	rd_en53,	rd_en54,	rd_en55,	rd_en56,	rd_en57,	rd_en58,	rd_en59,	rd_en60,	rd_en61,	rd_en62,	rd_en63,	rd_en64,	rd_en65,	rd_en66,	rd_en67,	rd_en68,	rd_en69,	rd_en70,	rd_en71,	rd_en72,	rd_en73,	rd_en74,	rd_en75,	rd_en76,	rd_en77,	rd_en78,	rd_en79;
	wire [31:0] rd_data0,	rd_data1,	rd_data2,	rd_data3,	rd_data4,	rd_data5,	rd_data6,	rd_data7,	rd_data8,	rd_data9,	rd_data10,	rd_data11,	rd_data12,	rd_data13,	rd_data14,	rd_data15,	rd_data16,	rd_data17,	rd_data18,	rd_data19,	rd_data20,	rd_data21,	rd_data22,	rd_data23,	rd_data24,	rd_data25,	rd_data26,	rd_data27,	rd_data28,	rd_data29,	rd_data30,	rd_data31,	rd_data32,	rd_data33,	rd_data34,	rd_data35,	rd_data36,	rd_data37,	rd_data38,	rd_data39,	rd_data40,	rd_data41,	rd_data42,	rd_data43,	rd_data44,	rd_data45,	rd_data46,	rd_data47,	rd_data48,	rd_data49,	rd_data50,	rd_data51,	rd_data52,	rd_data53,	rd_data54,	rd_data55,	rd_data56,	rd_data57,	rd_data58,	rd_data59,	rd_data60,	rd_data61,	rd_data62,	rd_data63,	rd_data64,	rd_data65,	rd_data66,	rd_data67,	rd_data68,	rd_data69,	rd_data70,	rd_data71,	rd_data72,	rd_data73,	rd_data74,	rd_data75,	rd_data76,	rd_data77,	rd_data78,	rd_data79;
	wire [7:0] 	 fifo_cont0,	fifo_cont1,	fifo_cont2,	fifo_cont3,	fifo_cont4,	fifo_cont5,	fifo_cont6,	fifo_cont7,	fifo_cont8,	fifo_cont9,	fifo_cont10,	fifo_cont11,	fifo_cont12,	fifo_cont13,	fifo_cont14,	fifo_cont15,	fifo_cont16,	fifo_cont17,	fifo_cont18,	fifo_cont19,	fifo_cont20,	fifo_cont21,	fifo_cont22,	fifo_cont23,	fifo_cont24,	fifo_cont25,	fifo_cont26,	fifo_cont27,	fifo_cont28,	fifo_cont29,	fifo_cont30,	fifo_cont31,	fifo_cont32,	fifo_cont33,	fifo_cont34,	fifo_cont35,	fifo_cont36,	fifo_cont37,	fifo_cont38,	fifo_cont39,	fifo_cont40,	fifo_cont41,	fifo_cont42,	fifo_cont43,	fifo_cont44,	fifo_cont45,	fifo_cont46,	fifo_cont47,	fifo_cont48,	fifo_cont49,	fifo_cont50,	fifo_cont51,	fifo_cont52,	fifo_cont53,	fifo_cont54,	fifo_cont55,	fifo_cont56,	fifo_cont57,	fifo_cont58,	fifo_cont59,	fifo_cont60,	fifo_cont61,	fifo_cont62,	fifo_cont63,	fifo_cont64,	fifo_cont65,	fifo_cont66,	fifo_cont67,	fifo_cont68,	fifo_cont69,	fifo_cont70,	fifo_cont71,	fifo_cont72,	fifo_cont73,	fifo_cont74,	fifo_cont75,	fifo_cont76,	fifo_cont77,	fifo_cont78,	fifo_cont79;
	wire  prog_full0,	prog_full1,	prog_full2,	prog_full3,	prog_full4,	prog_full5,	prog_full6,	prog_full7,	prog_full8,	prog_full9,	prog_full10,	prog_full11,	prog_full12,	prog_full13,	prog_full14,	prog_full15,	prog_full16,	prog_full17,	prog_full18,	prog_full19,	prog_full20,	prog_full21,	prog_full22,	prog_full23,	prog_full24,	prog_full25,	prog_full26,	prog_full27,	prog_full28,	prog_full29,	prog_full30,	prog_full31,	prog_full32,	prog_full33,	prog_full34,	prog_full35,	prog_full36,	prog_full37,	prog_full38,	prog_full39,	prog_full40,	prog_full41,	prog_full42,	prog_full43,	prog_full44,	prog_full45,	prog_full46,	prog_full47,	prog_full48,	prog_full49,	prog_full50,	prog_full51,	prog_full52,	prog_full53,	prog_full54,	prog_full55,	prog_full56,	prog_full57,	prog_full58,	prog_full59,	prog_full60,	prog_full61,	prog_full62,	prog_full63,	prog_full64,	prog_full65,	prog_full66,	prog_full67,	prog_full68,	prog_full69,	prog_full70,	prog_full71,	prog_full72,	prog_full73,	prog_full74,	prog_full75,	prog_full76,	prog_full77,	prog_full78,	prog_full79;
	wire valid0,	valid1,	valid2,	valid3,	valid4,	valid5,	valid6,	valid7,	valid8,	valid9,	valid10,	valid11,	valid12,	valid13,	valid14,	valid15,	valid16,	valid17,	valid18,	valid19,	valid20,	valid21,	valid22,	valid23,	valid24,	valid25,	valid26,	valid27,	valid28,	valid29,	valid30,	valid31,	valid32,	valid33,	valid34,	valid35,	valid36,	valid37,	valid38,	valid39,	valid40,	valid41,	valid42,	valid43,	valid44,	valid45,	valid46,	valid47,	valid48,	valid49,	valid50,	valid51,	valid52,	valid53,	valid54,	valid55,	valid56,	valid57,	valid58,	valid59,	valid60,	valid61,	valid62,	valid63,	valid64,	valid65,	valid66,	valid67,	valid68,	valid69,	valid70,	valid71,	valid72,	valid73,	valid74,	valid75,	valid76,	valid77,	valid78,	valid79;
	always @ (*)
	begin
		case (cont4)
		0:
		shift_5M <= 0;
		1:
		shift_5M <= 'h500000;
		2:
		shift_5M <= 'ha00000;
		3:
		shift_5M <= 'hf00000;
		endcase
	end
	reg [79:0] flag_80;
	assign fifo_state =   flag_80;
	always @ (posedge ps_clk or negedge ps_rst)
	begin
		if (! ps_rst)
		begin
			flag_80 <= 0;
			w_cont80 <= 0;
		end
		else
		begin
			flag_80[0 ] <= flag_80[0 ] | prog_full0 ;
			flag_80[1 ] <= flag_80[1 ] | prog_full1 ;
			flag_80[2 ] <= flag_80[2 ] | prog_full2 ;
			flag_80[3 ] <= flag_80[3 ] | prog_full3 ;
			flag_80[4 ] <= flag_80[4 ] | prog_full4 ;
			flag_80[5 ] <= flag_80[5 ] | prog_full5 ;
			flag_80[6 ] <= flag_80[6 ] | prog_full6 ;
			flag_80[7 ] <= flag_80[7 ] | prog_full7 ;
			flag_80[8 ] <= flag_80[8 ] | prog_full8 ;
			flag_80[9 ] <= flag_80[9 ] | prog_full9 ;
			flag_80[10] <= flag_80[10] | prog_full10;
			flag_80[11] <= flag_80[11] | prog_full11;
			flag_80[12] <= flag_80[12] | prog_full12;
			flag_80[13] <= flag_80[13] | prog_full13;
			flag_80[14] <= flag_80[14] | prog_full14;
			flag_80[15] <= flag_80[15] | prog_full15;
			flag_80[16] <= flag_80[16] | prog_full16;
			flag_80[17] <= flag_80[17] | prog_full17;
			flag_80[18] <= flag_80[18] | prog_full18;
			flag_80[19] <= flag_80[19] | prog_full19;
			flag_80[20] <= flag_80[20] | prog_full20;
			flag_80[21] <= flag_80[21] | prog_full21;
			flag_80[22] <= flag_80[22] | prog_full22;
			flag_80[23] <= flag_80[23] | prog_full23;
			flag_80[24] <= flag_80[24] | prog_full24;
			flag_80[25] <= flag_80[25] | prog_full25;
			flag_80[26] <= flag_80[26] | prog_full26;
			flag_80[27] <= flag_80[27] | prog_full27;
			flag_80[28] <= flag_80[28] | prog_full28;
			flag_80[29] <= flag_80[29] | prog_full29;
			flag_80[30] <= flag_80[30] | prog_full30;
			flag_80[31] <= flag_80[31] | prog_full31;
			flag_80[32] <= flag_80[32] | prog_full32;
			flag_80[33] <= flag_80[33] | prog_full33;
			flag_80[34] <= flag_80[34] | prog_full34;
			flag_80[35] <= flag_80[35] | prog_full35;
			flag_80[36] <= flag_80[36] | prog_full36;
			flag_80[37] <= flag_80[37] | prog_full37;
			flag_80[38] <= flag_80[38] | prog_full38;
			flag_80[39] <= flag_80[39] | prog_full39;
			flag_80[40] <= flag_80[40] | prog_full40;
			flag_80[41] <= flag_80[41] | prog_full41;
			flag_80[42] <= flag_80[42] | prog_full42;
			flag_80[43] <= flag_80[43] | prog_full43;
			flag_80[44] <= flag_80[44] | prog_full44;
			flag_80[45] <= flag_80[45] | prog_full45;
			flag_80[46] <= flag_80[46] | prog_full46;
			flag_80[47] <= flag_80[47] | prog_full47;
			flag_80[48] <= flag_80[48] | prog_full48;
			flag_80[49] <= flag_80[49] | prog_full49;
			flag_80[50] <= flag_80[50] | prog_full50;
			flag_80[51] <= flag_80[51] | prog_full51;
			flag_80[52] <= flag_80[52] | prog_full52;
			flag_80[53] <= flag_80[53] | prog_full53;
			flag_80[54] <= flag_80[54] | prog_full54;
			flag_80[55] <= flag_80[55] | prog_full55;
			flag_80[56] <= flag_80[56] | prog_full56;
			flag_80[57] <= flag_80[57] | prog_full57;
			flag_80[58] <= flag_80[58] | prog_full58;
			flag_80[59] <= flag_80[59] | prog_full59;
			flag_80[60] <= flag_80[60] | prog_full60;
			flag_80[61] <= flag_80[61] | prog_full61;
			flag_80[62] <= flag_80[62] | prog_full62;
			flag_80[63] <= flag_80[63] | prog_full63;
			flag_80[64] <= flag_80[64] | prog_full64;
			flag_80[65] <= flag_80[65] | prog_full65;
			flag_80[66] <= flag_80[66] | prog_full66;
			flag_80[67] <= flag_80[67] | prog_full67;
			flag_80[68] <= flag_80[68] | prog_full68;
			flag_80[69] <= flag_80[69] | prog_full69;
			flag_80[70] <= flag_80[70] | prog_full70;
			flag_80[71] <= flag_80[71] | prog_full71;
			flag_80[72] <= flag_80[72] | prog_full72;
			flag_80[73] <= flag_80[73] | prog_full73;
			flag_80[74] <= flag_80[74] | prog_full74;
			flag_80[75] <= flag_80[75] | prog_full75;
			flag_80[76] <= flag_80[76] | prog_full76;
			flag_80[77] <= flag_80[77] | prog_full77;
			flag_80[78] <= flag_80[78] | prog_full78;
			flag_80[79] <= flag_80[79] | prog_full79;
			w_cont80 <= pl_ddr_rd_en ? (w_cont80 >= 79 ? 0 : w_cont80 + 1):w_cont80;
		end
	end
	
	decode7_80 my_decode7_80
	(
		.a(w_cont80),
		.b(w_en_flag)
	);
	wire flag_one;
	assign flag_one = one_plus ;
	reg [6:0] rd_fifo_cont;
	reg [6:0] w_addr_ram_cont;
	reg [7:0] rd_state,rd_state_r;
	reg [1:0] wt_compensator;
	always @ (posedge ps_clk or negedge ps_rst)
	begin
		if (! ps_rst)
		begin
			wt_finish <= 0;
			ps_ddr_wr_en <= 0;
			ps_ddr_wr_start <= 0;
			rd_state <= 0;
			rd_state_r <= 0;
			w_addr_ram_cont <= 0;
			cont4 <= 0;
			rd_en0  <=  0 ;
			rd_en1  <=  0 ;
			rd_en2  <=  0 ;
			rd_en3  <=  0 ;
			rd_en4  <=  0 ;
			rd_en5  <=  0 ;
			rd_en6  <=  0 ;
			rd_en7  <=  0 ;
			rd_en8  <=  0 ;
			rd_en9  <=  0 ;
			rd_en10 <=  0 ;
			rd_en11 <=  0 ;
			rd_en12 <=  0 ;
			rd_en13 <=  0 ;
			rd_en14 <=  0 ;
			rd_en15 <=  0 ;
			rd_en16 <=  0 ;
			rd_en17 <=  0 ;
			rd_en18 <=  0 ;
			rd_en19 <=  0 ;
			rd_en20 <=  0 ;
			rd_en21 <=  0 ;
			rd_en22 <=  0 ;
			rd_en23 <=  0 ;
			rd_en24 <=  0 ;
			rd_en25 <=  0 ;
			rd_en26 <=  0 ;
			rd_en27 <=  0 ;
			rd_en28 <=  0 ;
			rd_en29 <=  0 ;
			rd_en30 <=  0 ;
			rd_en31 <=  0 ;
			rd_en32 <=  0 ;
			rd_en33 <=  0 ;
			rd_en34 <=  0 ;
			rd_en35 <=  0 ;
			rd_en36 <=  0 ;
			rd_en37 <=  0 ;
			rd_en38 <=  0 ;
			rd_en39 <=  0 ;
			rd_en40 <=  0 ;
			rd_en41 <=  0 ;
			rd_en42 <=  0 ;
			rd_en43 <=  0 ;
			rd_en44 <=  0 ;
			rd_en45 <=  0 ;
			rd_en46 <=  0 ;
			rd_en47 <=  0 ;
			rd_en48 <=  0 ;
			rd_en49 <=  0 ;
			rd_en50 <=  0 ;
			rd_en51 <=  0 ;
			rd_en52 <=  0 ;
			rd_en53 <=  0 ;
			rd_en54 <=  0 ;
			rd_en55 <=  0 ;
			rd_en56 <=  0 ;
			rd_en57 <=  0 ;
			rd_en58 <=  0 ;
			rd_en59 <=  0 ;
			rd_en60 <=  0 ;
			rd_en61 <=  0 ;
			rd_en62 <=  0 ;
			rd_en63 <=  0 ;
			rd_en64 <=  0 ;
			rd_en65 <=  0 ;
			rd_en66 <=  0 ;
			rd_en67 <=  0 ;
			rd_en68 <=  0 ;
			rd_en69 <=  0 ;
			rd_en70 <=  0 ;
			rd_en71 <=  0 ;
			rd_en72 <=  0 ;
			rd_en73 <=  0 ;
			rd_en74 <=  0 ;
			rd_en75 <=  0 ;
			rd_en76 <=  0 ;
			rd_en77 <=  0 ;
			rd_en78 <=  0 ;
			rd_en79 <=  0 ;
		end
		else
		begin
		
			
			rd_state_r <= rd_state ;
			case (rd_state)
			0:
			begin
				rd_fifo_cont <= 0;
				wt_finish <= (rd_state_r == 241);
				ps_ddr_wr_en <= 0;
				ps_ddr_wr_start <= 0;
				rd_en0  <=  0 ;
				rd_en1  <=  0 ;
				rd_en2  <=  0 ;
				rd_en3  <=  0 ;
				rd_en4  <=  0 ;
				rd_en5  <=  0 ;
				rd_en6  <=  0 ;
				rd_en7  <=  0 ;
				rd_en8  <=  0 ;
				rd_en9  <=  0 ;
				rd_en10 <=  0 ;
				rd_en11 <=  0 ;
				rd_en12 <=  0 ;
				rd_en13 <=  0 ;
				rd_en14 <=  0 ;
				rd_en15 <=  0 ;
				rd_en16 <=  0 ;
				rd_en17 <=  0 ;
				rd_en18 <=  0 ;
				rd_en19 <=  0 ;
				rd_en20 <=  0 ;
				rd_en21 <=  0 ;
				rd_en22 <=  0 ;
				rd_en23 <=  0 ;
				rd_en24 <=  0 ;
				rd_en25 <=  0 ;
				rd_en26 <=  0 ;
				rd_en27 <=  0 ;
				rd_en28 <=  0 ;
				rd_en29 <=  0 ;
				rd_en30 <=  0 ;
				rd_en31 <=  0 ;
				rd_en32 <=  0 ;
				rd_en33 <=  0 ;
				rd_en34 <=  0 ;
				rd_en35 <=  0 ;
				rd_en36 <=  0 ;
				rd_en37 <=  0 ;
				rd_en38 <=  0 ;
				rd_en39 <=  0 ;
				rd_en40 <=  0 ;
				rd_en41 <=  0 ;
				rd_en42 <=  0 ;
				rd_en43 <=  0 ;
				rd_en44 <=  0 ;
				rd_en45 <=  0 ;
				rd_en46 <=  0 ;
				rd_en47 <=  0 ;
				rd_en48 <=  0 ;
				rd_en49 <=  0 ;
				rd_en50 <=  0 ;
				rd_en51 <=  0 ;
				rd_en52 <=  0 ;
				rd_en53 <=  0 ;
				rd_en54 <=  0 ;
				rd_en55 <=  0 ;
				rd_en56 <=  0 ;
				rd_en57 <=  0 ;
				rd_en58 <=  0 ;
				rd_en59 <=  0 ;
				rd_en60 <=  0 ;
				rd_en61 <=  0 ;
				rd_en62 <=  0 ;
				rd_en63 <=  0 ;
				rd_en64 <=  0 ;
				rd_en65 <=  0 ;
				rd_en66 <=  0 ;
				rd_en67 <=  0 ;
				rd_en68 <=  0 ;
				rd_en69 <=  0 ;
				rd_en70 <=  0 ;
				rd_en71 <=  0 ;
				rd_en72 <=  0 ;
				rd_en73 <=  0 ;
				rd_en74 <=  0 ;
				rd_en75 <=  0 ;
				rd_en76 <=  0 ;
				rd_en77 <=  0 ;
				rd_en78 <=  0 ;
				rd_en79 <=  0 ;
				r_addr <= 0;
				//初始化地址ram
				w_addr <= w_addr_ram_cont;
				we <= 1;
				w_addr_ram_cont <= w_addr_ram_cont + 1;
				// 初始化所有的地址
				case (w_addr_ram_cont)
				0:
				begin
					w_data <= 	addr_shift1 + addr_shift3 + shift_5M;
				end
				79:
				begin
					w_addr_ram_cont <= 0;
					w_data <= 	w_data + addr_shift2;
					rd_state <= 1;
					cont4 <= cont4 + 1 ;
				end
				default:
					w_data <= w_data + addr_shift2;
				endcase
			end
			1 : begin  we <= 0; ps_ddr_wr_addr <= r_data;r_addr <=1 ;case ({flag_one , prog_full0}) 	2'b10,2'b11:	begin	rd_state <= 161 ;	end	2'b01:	begin	rd_state <= 81 ;  rd_en0 <=  1 ; ps_ddr_wr_start <= 1 ;ps_ddr_wr_length <= 512 ;end	2'b00:				begin				rd_state <= 2  ;			end			endcase  end
			2 : begin  we <= 0; ps_ddr_wr_addr <= r_data;r_addr <=2 ;case ({flag_one , prog_full1}) 	2'b10,2'b11:	begin	rd_state <= 161 ;	end	2'b01:	begin	rd_state <= 82 ;  rd_en1 <=  1 ; ps_ddr_wr_start <= 1 ;ps_ddr_wr_length <= 512 ;end	2'b00:				begin				rd_state <= 3  ;			end			endcase  end
			3 : begin  we <= 0; ps_ddr_wr_addr <= r_data;r_addr <=3 ;case ({flag_one , prog_full2}) 	2'b10,2'b11:	begin	rd_state <= 161 ;	end	2'b01:	begin	rd_state <= 83 ;  rd_en2 <=  1 ; ps_ddr_wr_start <= 1 ;ps_ddr_wr_length <= 512 ;end	2'b00:				begin				rd_state <= 4  ;			end			endcase  end
			4 : begin  we <= 0; ps_ddr_wr_addr <= r_data;r_addr <=4 ;case ({flag_one , prog_full3}) 	2'b10,2'b11:	begin	rd_state <= 161 ;	end	2'b01:	begin	rd_state <= 84 ;  rd_en3 <=  1 ; ps_ddr_wr_start <= 1 ;ps_ddr_wr_length <= 512 ;end	2'b00:				begin				rd_state <= 5  ;			end			endcase  end
			5 : begin  we <= 0; ps_ddr_wr_addr <= r_data;r_addr <=5 ;case ({flag_one , prog_full4}) 	2'b10,2'b11:	begin	rd_state <= 161 ;	end	2'b01:	begin	rd_state <= 85 ;  rd_en4 <=  1 ; ps_ddr_wr_start <= 1 ;ps_ddr_wr_length <= 512 ;end	2'b00:				begin				rd_state <= 6  ;			end			endcase  end
			6 : begin  we <= 0; ps_ddr_wr_addr <= r_data;r_addr <=6 ;case ({flag_one , prog_full5}) 	2'b10,2'b11:	begin	rd_state <= 161 ;	end	2'b01:	begin	rd_state <= 86 ;  rd_en5 <=  1 ; ps_ddr_wr_start <= 1 ;ps_ddr_wr_length <= 512 ;end	2'b00:				begin				rd_state <= 7  ;			end			endcase  end
			7 : begin  we <= 0; ps_ddr_wr_addr <= r_data;r_addr <=7 ;case ({flag_one , prog_full6}) 	2'b10,2'b11:	begin	rd_state <= 161 ;	end	2'b01:	begin	rd_state <= 87 ;  rd_en6 <=  1 ; ps_ddr_wr_start <= 1 ;ps_ddr_wr_length <= 512 ;end	2'b00:				begin				rd_state <= 8  ;			end			endcase  end
			8 : begin  we <= 0; ps_ddr_wr_addr <= r_data;r_addr <=8 ;case ({flag_one , prog_full7}) 	2'b10,2'b11:	begin	rd_state <= 161 ;	end	2'b01:	begin	rd_state <= 88 ;  rd_en7 <=  1 ; ps_ddr_wr_start <= 1 ;ps_ddr_wr_length <= 512 ;end	2'b00:				begin				rd_state <= 9  ;			end			endcase  end
			9 : begin  we <= 0; ps_ddr_wr_addr <= r_data;r_addr <=9 ;case ({flag_one , prog_full8}) 	2'b10,2'b11:	begin	rd_state <= 161 ;	end	2'b01:	begin	rd_state <= 89 ;  rd_en8 <=  1 ; ps_ddr_wr_start <= 1 ;ps_ddr_wr_length <= 512 ;end	2'b00:				begin				rd_state <= 10 ;			end			endcase  end
			10: begin  we <= 0; ps_ddr_wr_addr <= r_data;r_addr <=10;case ({flag_one , prog_full9}) 	2'b10,2'b11:	begin	rd_state <= 161 ;	end	2'b01:	begin	rd_state <= 90 ;  rd_en9 <=  1 ; ps_ddr_wr_start <= 1 ;ps_ddr_wr_length <= 512 ;end	2'b00:				begin				rd_state <= 11 ;			end			endcase  end
			11: begin  we <= 0; ps_ddr_wr_addr <= r_data;r_addr <=11;case ({flag_one , prog_full10}) 	2'b10,2'b11:	begin	rd_state <= 161 ;	end	2'b01:	begin	rd_state <= 91 ;  rd_en10 <=  1 ;ps_ddr_wr_start <= 1 ;ps_ddr_wr_length <= 512 ;end	2'b00:				begin				rd_state <= 12 ;			end			endcase  end
			12: begin  we <= 0; ps_ddr_wr_addr <= r_data;r_addr <=12;case ({flag_one , prog_full11}) 	2'b10,2'b11:	begin	rd_state <= 161 ;	end	2'b01:	begin	rd_state <= 92 ;  rd_en11 <=  1 ;ps_ddr_wr_start <= 1 ;ps_ddr_wr_length <= 512 ;end	2'b00:				begin				rd_state <= 13 ;			end			endcase  end
			13: begin  we <= 0; ps_ddr_wr_addr <= r_data;r_addr <=13;case ({flag_one , prog_full12}) 	2'b10,2'b11:	begin	rd_state <= 161 ;	end	2'b01:	begin	rd_state <= 93 ;  rd_en12 <=  1 ;ps_ddr_wr_start <= 1 ;ps_ddr_wr_length <= 512 ;end	2'b00:				begin				rd_state <= 14 ;			end			endcase  end
			14: begin  we <= 0; ps_ddr_wr_addr <= r_data;r_addr <=14;case ({flag_one , prog_full13}) 	2'b10,2'b11:	begin	rd_state <= 161 ;	end	2'b01:	begin	rd_state <= 94 ;  rd_en13 <=  1 ;ps_ddr_wr_start <= 1 ;ps_ddr_wr_length <= 512 ;end	2'b00:				begin				rd_state <= 15 ;			end			endcase  end
			15: begin  we <= 0; ps_ddr_wr_addr <= r_data;r_addr <=15;case ({flag_one , prog_full14}) 	2'b10,2'b11:	begin	rd_state <= 161 ;	end	2'b01:	begin	rd_state <= 95 ;  rd_en14 <=  1 ;ps_ddr_wr_start <= 1 ;ps_ddr_wr_length <= 512 ;end	2'b00:				begin				rd_state <= 16 ;			end			endcase  end
			16: begin  we <= 0; ps_ddr_wr_addr <= r_data;r_addr <=16;case ({flag_one , prog_full15}) 	2'b10,2'b11:	begin	rd_state <= 161 ;	end	2'b01:	begin	rd_state <= 96 ;  rd_en15 <=  1 ;ps_ddr_wr_start <= 1 ;ps_ddr_wr_length <= 512 ;end	2'b00:				begin				rd_state <= 17 ;			end			endcase  end
			17: begin  we <= 0; ps_ddr_wr_addr <= r_data;r_addr <=17;case ({flag_one , prog_full16}) 	2'b10,2'b11:	begin	rd_state <= 161 ;	end	2'b01:	begin	rd_state <= 97 ;  rd_en16 <=  1 ;ps_ddr_wr_start <= 1 ;ps_ddr_wr_length <= 512 ;end	2'b00:				begin				rd_state <= 18 ;			end			endcase  end
			18: begin  we <= 0; ps_ddr_wr_addr <= r_data;r_addr <=18;case ({flag_one , prog_full17}) 	2'b10,2'b11:	begin	rd_state <= 161 ;	end	2'b01:	begin	rd_state <= 98 ;  rd_en17 <=  1 ;ps_ddr_wr_start <= 1 ;ps_ddr_wr_length <= 512 ;end	2'b00:				begin				rd_state <= 19 ;			end			endcase  end
			19: begin  we <= 0; ps_ddr_wr_addr <= r_data;r_addr <=19;case ({flag_one , prog_full18}) 	2'b10,2'b11:	begin	rd_state <= 161 ;	end	2'b01:	begin	rd_state <= 99 ;  rd_en18 <=  1 ;ps_ddr_wr_start <= 1 ;ps_ddr_wr_length <= 512 ;end	2'b00:				begin				rd_state <= 20 ;			end			endcase  end
			20: begin  we <= 0; ps_ddr_wr_addr <= r_data;r_addr <=20;case ({flag_one , prog_full19}) 	2'b10,2'b11:	begin	rd_state <= 161 ;	end	2'b01:	begin	rd_state <= 100 ; rd_en19 <=  1 ;ps_ddr_wr_start <= 1 ;ps_ddr_wr_length <= 512 ;end	2'b00:				begin				rd_state <= 21 ;			end			endcase  end
			21: begin  we <= 0; ps_ddr_wr_addr <= r_data;r_addr <=21;case ({flag_one , prog_full20}) 	2'b10,2'b11:	begin	rd_state <= 161 ;	end	2'b01:	begin	rd_state <= 101 ; rd_en20 <=  1 ;ps_ddr_wr_start <= 1 ;ps_ddr_wr_length <= 512 ;end	2'b00:				begin				rd_state <= 22 ;			end			endcase  end
			22: begin  we <= 0; ps_ddr_wr_addr <= r_data;r_addr <=22;case ({flag_one , prog_full21}) 	2'b10,2'b11:	begin	rd_state <= 161 ;	end	2'b01:	begin	rd_state <= 102 ; rd_en21 <=  1 ;ps_ddr_wr_start <= 1 ;ps_ddr_wr_length <= 512 ;end	2'b00:				begin				rd_state <= 23 ;			end			endcase  end
			23: begin  we <= 0; ps_ddr_wr_addr <= r_data;r_addr <=23;case ({flag_one , prog_full22}) 	2'b10,2'b11:	begin	rd_state <= 161 ;	end	2'b01:	begin	rd_state <= 103 ; rd_en22 <=  1 ;ps_ddr_wr_start <= 1 ;ps_ddr_wr_length <= 512 ;end	2'b00:				begin				rd_state <= 24 ;			end			endcase  end
			24: begin  we <= 0; ps_ddr_wr_addr <= r_data;r_addr <=24;case ({flag_one , prog_full23}) 	2'b10,2'b11:	begin	rd_state <= 161 ;	end	2'b01:	begin	rd_state <= 104 ; rd_en23 <=  1 ;ps_ddr_wr_start <= 1 ;ps_ddr_wr_length <= 512 ;end	2'b00:				begin				rd_state <= 25 ;			end			endcase  end
			25: begin  we <= 0; ps_ddr_wr_addr <= r_data;r_addr <=25;case ({flag_one , prog_full24}) 	2'b10,2'b11:	begin	rd_state <= 161 ;	end	2'b01:	begin	rd_state <= 105 ; rd_en24 <=  1 ;ps_ddr_wr_start <= 1 ;ps_ddr_wr_length <= 512 ;end	2'b00:				begin				rd_state <= 26 ;			end			endcase  end
			26: begin  we <= 0; ps_ddr_wr_addr <= r_data;r_addr <=26;case ({flag_one , prog_full25}) 	2'b10,2'b11:	begin	rd_state <= 161 ;	end	2'b01:	begin	rd_state <= 106 ; rd_en25 <=  1 ;ps_ddr_wr_start <= 1 ;ps_ddr_wr_length <= 512 ;end	2'b00:				begin				rd_state <= 27 ;			end			endcase  end
			27: begin  we <= 0; ps_ddr_wr_addr <= r_data;r_addr <=27;case ({flag_one , prog_full26}) 	2'b10,2'b11:	begin	rd_state <= 161 ;	end	2'b01:	begin	rd_state <= 107 ; rd_en26 <=  1 ;ps_ddr_wr_start <= 1 ;ps_ddr_wr_length <= 512 ;end	2'b00:				begin				rd_state <= 28 ;			end			endcase  end
			28: begin  we <= 0; ps_ddr_wr_addr <= r_data;r_addr <=28;case ({flag_one , prog_full27}) 	2'b10,2'b11:	begin	rd_state <= 161 ;	end	2'b01:	begin	rd_state <= 108 ; rd_en27 <=  1 ;ps_ddr_wr_start <= 1 ;ps_ddr_wr_length <= 512 ;end	2'b00:				begin				rd_state <= 29 ;			end			endcase  end
			29: begin  we <= 0; ps_ddr_wr_addr <= r_data;r_addr <=29;case ({flag_one , prog_full28}) 	2'b10,2'b11:	begin	rd_state <= 161 ;	end	2'b01:	begin	rd_state <= 109 ; rd_en28 <=  1 ;ps_ddr_wr_start <= 1 ;ps_ddr_wr_length <= 512 ;end	2'b00:				begin				rd_state <= 30 ;			end			endcase  end
			30: begin  we <= 0; ps_ddr_wr_addr <= r_data;r_addr <=30;case ({flag_one , prog_full29}) 	2'b10,2'b11:	begin	rd_state <= 161 ;	end	2'b01:	begin	rd_state <= 110 ; rd_en29 <=  1 ;ps_ddr_wr_start <= 1 ;ps_ddr_wr_length <= 512 ;end	2'b00:				begin				rd_state <= 31 ;			end			endcase  end
			31: begin  we <= 0; ps_ddr_wr_addr <= r_data;r_addr <=31;case ({flag_one , prog_full30}) 	2'b10,2'b11:	begin	rd_state <= 161 ;	end	2'b01:	begin	rd_state <= 111 ; rd_en30 <=  1 ;ps_ddr_wr_start <= 1 ;ps_ddr_wr_length <= 512 ;end	2'b00:				begin				rd_state <= 32 ;			end			endcase  end
			32: begin  we <= 0; ps_ddr_wr_addr <= r_data;r_addr <=32;case ({flag_one , prog_full31}) 	2'b10,2'b11:	begin	rd_state <= 161 ;	end	2'b01:	begin	rd_state <= 112 ; rd_en31 <=  1 ;ps_ddr_wr_start <= 1 ;ps_ddr_wr_length <= 512 ;end	2'b00:				begin				rd_state <= 33 ;			end			endcase  end
			33: begin  we <= 0; ps_ddr_wr_addr <= r_data;r_addr <=33;case ({flag_one , prog_full32}) 	2'b10,2'b11:	begin	rd_state <= 161 ;	end	2'b01:	begin	rd_state <= 113 ; rd_en32 <=  1 ;ps_ddr_wr_start <= 1 ;ps_ddr_wr_length <= 512 ;end	2'b00:				begin				rd_state <= 34 ;			end			endcase  end
			34: begin  we <= 0; ps_ddr_wr_addr <= r_data;r_addr <=34;case ({flag_one , prog_full33}) 	2'b10,2'b11:	begin	rd_state <= 161 ;	end	2'b01:	begin	rd_state <= 114 ; rd_en33 <=  1 ;ps_ddr_wr_start <= 1 ;ps_ddr_wr_length <= 512 ;end	2'b00:				begin				rd_state <= 35 ;			end			endcase  end
			35: begin  we <= 0; ps_ddr_wr_addr <= r_data;r_addr <=35;case ({flag_one , prog_full34}) 	2'b10,2'b11:	begin	rd_state <= 161 ;	end	2'b01:	begin	rd_state <= 115 ; rd_en34 <=  1 ;ps_ddr_wr_start <= 1 ;ps_ddr_wr_length <= 512 ;end	2'b00:				begin				rd_state <= 36 ;			end			endcase  end
			36: begin  we <= 0; ps_ddr_wr_addr <= r_data;r_addr <=36;case ({flag_one , prog_full35}) 	2'b10,2'b11:	begin	rd_state <= 161 ;	end	2'b01:	begin	rd_state <= 116 ; rd_en35 <=  1 ;ps_ddr_wr_start <= 1 ;ps_ddr_wr_length <= 512 ;end	2'b00:				begin				rd_state <= 37 ;			end			endcase  end
			37: begin  we <= 0; ps_ddr_wr_addr <= r_data;r_addr <=37;case ({flag_one , prog_full36}) 	2'b10,2'b11:	begin	rd_state <= 161 ;	end	2'b01:	begin	rd_state <= 117 ; rd_en36 <=  1 ;ps_ddr_wr_start <= 1 ;ps_ddr_wr_length <= 512 ;end	2'b00:				begin				rd_state <= 38 ;			end			endcase  end
			38: begin  we <= 0; ps_ddr_wr_addr <= r_data;r_addr <=38;case ({flag_one , prog_full37}) 	2'b10,2'b11:	begin	rd_state <= 161 ;	end	2'b01:	begin	rd_state <= 118 ; rd_en37 <=  1 ;ps_ddr_wr_start <= 1 ;ps_ddr_wr_length <= 512 ;end	2'b00:				begin				rd_state <= 39 ;			end			endcase  end
			39: begin  we <= 0; ps_ddr_wr_addr <= r_data;r_addr <=39;case ({flag_one , prog_full38}) 	2'b10,2'b11:	begin	rd_state <= 161 ;	end	2'b01:	begin	rd_state <= 119 ; rd_en38 <=  1 ;ps_ddr_wr_start <= 1 ;ps_ddr_wr_length <= 512 ;end	2'b00:				begin				rd_state <= 40 ;			end			endcase  end
			40: begin  we <= 0; ps_ddr_wr_addr <= r_data;r_addr <=40;case ({flag_one , prog_full39}) 	2'b10,2'b11:	begin	rd_state <= 161 ;	end	2'b01:	begin	rd_state <= 120 ; rd_en39 <=  1 ;ps_ddr_wr_start <= 1 ;ps_ddr_wr_length <= 512 ;end	2'b00:				begin				rd_state <= 41 ;			end			endcase  end
			41: begin  we <= 0; ps_ddr_wr_addr <= r_data;r_addr <=41;case ({flag_one , prog_full40}) 	2'b10,2'b11:	begin	rd_state <= 161 ;	end	2'b01:	begin	rd_state <= 121 ; rd_en40 <=  1 ;ps_ddr_wr_start <= 1 ;ps_ddr_wr_length <= 512 ;end	2'b00:				begin				rd_state <= 42 ;			end			endcase  end
			42: begin  we <= 0; ps_ddr_wr_addr <= r_data;r_addr <=42;case ({flag_one , prog_full41}) 	2'b10,2'b11:	begin	rd_state <= 161 ;	end	2'b01:	begin	rd_state <= 122 ; rd_en41 <=  1 ;ps_ddr_wr_start <= 1 ;ps_ddr_wr_length <= 512 ;end	2'b00:				begin				rd_state <= 43 ;			end			endcase  end
			43: begin  we <= 0; ps_ddr_wr_addr <= r_data;r_addr <=43;case ({flag_one , prog_full42}) 	2'b10,2'b11:	begin	rd_state <= 161 ;	end	2'b01:	begin	rd_state <= 123 ; rd_en42 <=  1 ;ps_ddr_wr_start <= 1 ;ps_ddr_wr_length <= 512 ;end	2'b00:				begin				rd_state <= 44 ;			end			endcase  end
			44: begin  we <= 0; ps_ddr_wr_addr <= r_data;r_addr <=44;case ({flag_one , prog_full43}) 	2'b10,2'b11:	begin	rd_state <= 161 ;	end	2'b01:	begin	rd_state <= 124 ; rd_en43 <=  1 ;ps_ddr_wr_start <= 1 ;ps_ddr_wr_length <= 512 ;end	2'b00:				begin				rd_state <= 45 ;			end			endcase  end
			45: begin  we <= 0; ps_ddr_wr_addr <= r_data;r_addr <=45;case ({flag_one , prog_full44}) 	2'b10,2'b11:	begin	rd_state <= 161 ;	end	2'b01:	begin	rd_state <= 125 ; rd_en44 <=  1 ;ps_ddr_wr_start <= 1 ;ps_ddr_wr_length <= 512 ;end	2'b00:				begin				rd_state <= 46 ;			end			endcase  end
			46: begin  we <= 0; ps_ddr_wr_addr <= r_data;r_addr <=46;case ({flag_one , prog_full45}) 	2'b10,2'b11:	begin	rd_state <= 161 ;	end	2'b01:	begin	rd_state <= 126 ; rd_en45 <=  1 ;ps_ddr_wr_start <= 1 ;ps_ddr_wr_length <= 512 ;end	2'b00:				begin				rd_state <= 47 ;			end			endcase  end
			47: begin  we <= 0; ps_ddr_wr_addr <= r_data;r_addr <=47;case ({flag_one , prog_full46}) 	2'b10,2'b11:	begin	rd_state <= 161 ;	end	2'b01:	begin	rd_state <= 127 ; rd_en46 <=  1 ;ps_ddr_wr_start <= 1 ;ps_ddr_wr_length <= 512 ;end	2'b00:				begin				rd_state <= 48 ;			end			endcase  end
			48: begin  we <= 0; ps_ddr_wr_addr <= r_data;r_addr <=48;case ({flag_one , prog_full47}) 	2'b10,2'b11:	begin	rd_state <= 161 ;	end	2'b01:	begin	rd_state <= 128 ; rd_en47 <=  1 ;ps_ddr_wr_start <= 1 ;ps_ddr_wr_length <= 512 ;end	2'b00:				begin				rd_state <= 49 ;			end			endcase  end
			49: begin  we <= 0; ps_ddr_wr_addr <= r_data;r_addr <=49;case ({flag_one , prog_full48}) 	2'b10,2'b11:	begin	rd_state <= 161 ;	end	2'b01:	begin	rd_state <= 129 ; rd_en48 <=  1 ;ps_ddr_wr_start <= 1 ;ps_ddr_wr_length <= 512 ;end	2'b00:				begin				rd_state <= 50 ;			end			endcase  end
			50: begin  we <= 0; ps_ddr_wr_addr <= r_data;r_addr <=50;case ({flag_one , prog_full49}) 	2'b10,2'b11:	begin	rd_state <= 161 ;	end	2'b01:	begin	rd_state <= 130 ; rd_en49 <=  1 ;ps_ddr_wr_start <= 1 ;ps_ddr_wr_length <= 512 ;end	2'b00:				begin				rd_state <= 51 ;			end			endcase  end
			51: begin  we <= 0; ps_ddr_wr_addr <= r_data;r_addr <=51;case ({flag_one , prog_full50}) 	2'b10,2'b11:	begin	rd_state <= 161 ;	end	2'b01:	begin	rd_state <= 131 ; rd_en50 <=  1 ;ps_ddr_wr_start <= 1 ;ps_ddr_wr_length <= 512 ;end	2'b00:				begin				rd_state <= 52 ;			end			endcase  end
			52: begin  we <= 0; ps_ddr_wr_addr <= r_data;r_addr <=52;case ({flag_one , prog_full51}) 	2'b10,2'b11:	begin	rd_state <= 161 ;	end	2'b01:	begin	rd_state <= 132 ; rd_en51 <=  1 ;ps_ddr_wr_start <= 1 ;ps_ddr_wr_length <= 512 ;end	2'b00:				begin				rd_state <= 53 ;			end			endcase  end
			53: begin  we <= 0; ps_ddr_wr_addr <= r_data;r_addr <=53;case ({flag_one , prog_full52}) 	2'b10,2'b11:	begin	rd_state <= 161 ;	end	2'b01:	begin	rd_state <= 133 ; rd_en52 <=  1 ;ps_ddr_wr_start <= 1 ;ps_ddr_wr_length <= 512 ;end	2'b00:				begin				rd_state <= 54 ;			end			endcase  end
			54: begin  we <= 0; ps_ddr_wr_addr <= r_data;r_addr <=54;case ({flag_one , prog_full53}) 	2'b10,2'b11:	begin	rd_state <= 161 ;	end	2'b01:	begin	rd_state <= 134 ; rd_en53 <=  1 ;ps_ddr_wr_start <= 1 ;ps_ddr_wr_length <= 512 ;end	2'b00:				begin				rd_state <= 55 ;			end			endcase  end
			55: begin  we <= 0; ps_ddr_wr_addr <= r_data;r_addr <=55;case ({flag_one , prog_full54}) 	2'b10,2'b11:	begin	rd_state <= 161 ;	end	2'b01:	begin	rd_state <= 135 ; rd_en54 <=  1 ;ps_ddr_wr_start <= 1 ;ps_ddr_wr_length <= 512 ;end	2'b00:				begin				rd_state <= 56 ;			end			endcase  end
			56: begin  we <= 0; ps_ddr_wr_addr <= r_data;r_addr <=56;case ({flag_one , prog_full55}) 	2'b10,2'b11:	begin	rd_state <= 161 ;	end	2'b01:	begin	rd_state <= 136 ; rd_en55 <=  1 ;ps_ddr_wr_start <= 1 ;ps_ddr_wr_length <= 512 ;end	2'b00:				begin				rd_state <= 57 ;			end			endcase  end
			57: begin  we <= 0; ps_ddr_wr_addr <= r_data;r_addr <=57;case ({flag_one , prog_full56}) 	2'b10,2'b11:	begin	rd_state <= 161 ;	end	2'b01:	begin	rd_state <= 137 ; rd_en56 <=  1 ;ps_ddr_wr_start <= 1 ;ps_ddr_wr_length <= 512 ;end	2'b00:				begin				rd_state <= 58 ;			end			endcase  end
			58: begin  we <= 0; ps_ddr_wr_addr <= r_data;r_addr <=58;case ({flag_one , prog_full57}) 	2'b10,2'b11:	begin	rd_state <= 161 ;	end	2'b01:	begin	rd_state <= 138 ; rd_en57 <=  1 ;ps_ddr_wr_start <= 1 ;ps_ddr_wr_length <= 512 ;end	2'b00:				begin				rd_state <= 59 ;			end			endcase  end
			59: begin  we <= 0; ps_ddr_wr_addr <= r_data;r_addr <=59;case ({flag_one , prog_full58}) 	2'b10,2'b11:	begin	rd_state <= 161 ;	end	2'b01:	begin	rd_state <= 139 ; rd_en58 <=  1 ;ps_ddr_wr_start <= 1 ;ps_ddr_wr_length <= 512 ;end	2'b00:				begin				rd_state <= 60 ;			end			endcase  end
			60: begin  we <= 0; ps_ddr_wr_addr <= r_data;r_addr <=60;case ({flag_one , prog_full59}) 	2'b10,2'b11:	begin	rd_state <= 161 ;	end	2'b01:	begin	rd_state <= 140 ; rd_en59 <=  1 ;ps_ddr_wr_start <= 1 ;ps_ddr_wr_length <= 512 ;end	2'b00:				begin				rd_state <= 61 ;			end			endcase  end
			61: begin  we <= 0; ps_ddr_wr_addr <= r_data;r_addr <=61;case ({flag_one , prog_full60}) 	2'b10,2'b11:	begin	rd_state <= 161 ;	end	2'b01:	begin	rd_state <= 141 ; rd_en60 <=  1 ;ps_ddr_wr_start <= 1 ;ps_ddr_wr_length <= 512 ;end	2'b00:				begin				rd_state <= 62 ;			end			endcase  end
			62: begin  we <= 0; ps_ddr_wr_addr <= r_data;r_addr <=62;case ({flag_one , prog_full61}) 	2'b10,2'b11:	begin	rd_state <= 161 ;	end	2'b01:	begin	rd_state <= 142 ; rd_en61 <=  1 ;ps_ddr_wr_start <= 1 ;ps_ddr_wr_length <= 512 ;end	2'b00:				begin				rd_state <= 63 ;			end			endcase  end
			63: begin  we <= 0; ps_ddr_wr_addr <= r_data;r_addr <=63;case ({flag_one , prog_full62}) 	2'b10,2'b11:	begin	rd_state <= 161 ;	end	2'b01:	begin	rd_state <= 143 ; rd_en62 <=  1 ;ps_ddr_wr_start <= 1 ;ps_ddr_wr_length <= 512 ;end	2'b00:				begin				rd_state <= 64 ;			end			endcase  end
			64: begin  we <= 0; ps_ddr_wr_addr <= r_data;r_addr <=64;case ({flag_one , prog_full63}) 	2'b10,2'b11:	begin	rd_state <= 161 ;	end	2'b01:	begin	rd_state <= 144 ; rd_en63 <=  1 ;ps_ddr_wr_start <= 1 ;ps_ddr_wr_length <= 512 ;end	2'b00:				begin				rd_state <= 65 ;			end			endcase  end
			65: begin  we <= 0; ps_ddr_wr_addr <= r_data;r_addr <=65;case ({flag_one , prog_full64}) 	2'b10,2'b11:	begin	rd_state <= 161 ;	end	2'b01:	begin	rd_state <= 145 ; rd_en64 <=  1 ;ps_ddr_wr_start <= 1 ;ps_ddr_wr_length <= 512 ;end	2'b00:				begin				rd_state <= 66 ;			end			endcase  end
			66: begin  we <= 0; ps_ddr_wr_addr <= r_data;r_addr <=66;case ({flag_one , prog_full65}) 	2'b10,2'b11:	begin	rd_state <= 161 ;	end	2'b01:	begin	rd_state <= 146 ; rd_en65 <=  1 ;ps_ddr_wr_start <= 1 ;ps_ddr_wr_length <= 512 ;end	2'b00:				begin				rd_state <= 67 ;			end			endcase  end
			67: begin  we <= 0; ps_ddr_wr_addr <= r_data;r_addr <=67;case ({flag_one , prog_full66}) 	2'b10,2'b11:	begin	rd_state <= 161 ;	end	2'b01:	begin	rd_state <= 147 ; rd_en66 <=  1 ;ps_ddr_wr_start <= 1 ;ps_ddr_wr_length <= 512 ;end	2'b00:				begin				rd_state <= 68 ;			end			endcase  end
			68: begin  we <= 0; ps_ddr_wr_addr <= r_data;r_addr <=68;case ({flag_one , prog_full67}) 	2'b10,2'b11:	begin	rd_state <= 161 ;	end	2'b01:	begin	rd_state <= 148 ; rd_en67 <=  1 ;ps_ddr_wr_start <= 1 ;ps_ddr_wr_length <= 512 ;end	2'b00:				begin				rd_state <= 69 ;			end			endcase  end
			69: begin  we <= 0; ps_ddr_wr_addr <= r_data;r_addr <=69;case ({flag_one , prog_full68}) 	2'b10,2'b11:	begin	rd_state <= 161 ;	end	2'b01:	begin	rd_state <= 149 ; rd_en68 <=  1 ;ps_ddr_wr_start <= 1 ;ps_ddr_wr_length <= 512 ;end	2'b00:				begin				rd_state <= 70 ;			end			endcase  end
			70: begin  we <= 0; ps_ddr_wr_addr <= r_data;r_addr <=70;case ({flag_one , prog_full69}) 	2'b10,2'b11:	begin	rd_state <= 161 ;	end	2'b01:	begin	rd_state <= 150 ; rd_en69 <=  1 ;ps_ddr_wr_start <= 1 ;ps_ddr_wr_length <= 512 ;end	2'b00:				begin				rd_state <= 71 ;			end			endcase  end
			71: begin  we <= 0; ps_ddr_wr_addr <= r_data;r_addr <=71;case ({flag_one , prog_full70}) 	2'b10,2'b11:	begin	rd_state <= 161 ;	end	2'b01:	begin	rd_state <= 151 ; rd_en70 <=  1 ;ps_ddr_wr_start <= 1 ;ps_ddr_wr_length <= 512 ;end	2'b00:				begin				rd_state <= 72 ;			end			endcase  end
			72: begin  we <= 0; ps_ddr_wr_addr <= r_data;r_addr <=72;case ({flag_one , prog_full71}) 	2'b10,2'b11:	begin	rd_state <= 161 ;	end	2'b01:	begin	rd_state <= 152 ; rd_en71 <=  1 ;ps_ddr_wr_start <= 1 ;ps_ddr_wr_length <= 512 ;end	2'b00:				begin				rd_state <= 73 ;			end			endcase  end
			73: begin  we <= 0; ps_ddr_wr_addr <= r_data;r_addr <=73;case ({flag_one , prog_full72}) 	2'b10,2'b11:	begin	rd_state <= 161 ;	end	2'b01:	begin	rd_state <= 153 ; rd_en72 <=  1 ;ps_ddr_wr_start <= 1 ;ps_ddr_wr_length <= 512 ;end	2'b00:				begin				rd_state <= 74 ;			end			endcase  end
			74: begin  we <= 0; ps_ddr_wr_addr <= r_data;r_addr <=74;case ({flag_one , prog_full73}) 	2'b10,2'b11:	begin	rd_state <= 161 ;	end	2'b01:	begin	rd_state <= 154 ; rd_en73 <=  1 ;ps_ddr_wr_start <= 1 ;ps_ddr_wr_length <= 512 ;end	2'b00:				begin				rd_state <= 75 ;			end			endcase  end
			75: begin  we <= 0; ps_ddr_wr_addr <= r_data;r_addr <=75;case ({flag_one , prog_full74}) 	2'b10,2'b11:	begin	rd_state <= 161 ;	end	2'b01:	begin	rd_state <= 155 ; rd_en74 <=  1 ;ps_ddr_wr_start <= 1 ;ps_ddr_wr_length <= 512 ;end	2'b00:				begin				rd_state <= 76 ;			end			endcase  end
			76: begin  we <= 0; ps_ddr_wr_addr <= r_data;r_addr <=76;case ({flag_one , prog_full75}) 	2'b10,2'b11:	begin	rd_state <= 161 ;	end	2'b01:	begin	rd_state <= 156 ; rd_en75 <=  1 ;ps_ddr_wr_start <= 1 ;ps_ddr_wr_length <= 512 ;end	2'b00:				begin				rd_state <= 77 ;			end			endcase  end
			77: begin  we <= 0; ps_ddr_wr_addr <= r_data;r_addr <=77;case ({flag_one , prog_full76}) 	2'b10,2'b11:	begin	rd_state <= 161 ;	end	2'b01:	begin	rd_state <= 157 ; rd_en76 <=  1 ;ps_ddr_wr_start <= 1 ;ps_ddr_wr_length <= 512 ;end	2'b00:				begin				rd_state <= 78 ;			end			endcase  end
			78: begin  we <= 0; ps_ddr_wr_addr <= r_data;r_addr <=78;case ({flag_one , prog_full77}) 	2'b10,2'b11:	begin	rd_state <= 161 ;	end	2'b01:	begin	rd_state <= 158 ; rd_en77 <=  1 ;ps_ddr_wr_start <= 1 ;ps_ddr_wr_length <= 512 ;end	2'b00:				begin				rd_state <= 79 ;			end			endcase  end
			79: begin  we <= 0; ps_ddr_wr_addr <= r_data;r_addr <=79;case ({flag_one , prog_full78}) 	2'b10,2'b11:	begin	rd_state <= 161 ;	end	2'b01:	begin	rd_state <= 159 ; rd_en78 <=  1 ;ps_ddr_wr_start <= 1 ;ps_ddr_wr_length <= 512 ;end	2'b00:				begin				rd_state <= 80 ;			end			endcase  end
			80: begin  we <= 0; ps_ddr_wr_addr <= r_data;r_addr <= 0;case ({flag_one , prog_full79}) 	2'b10,2'b11:	begin	rd_state <= 161 ;	end	2'b01:	begin	rd_state <= 160 ; rd_en79 <=  1 ;ps_ddr_wr_start <= 1 ;ps_ddr_wr_length <= 512 ;end	2'b00:				begin				rd_state <= 1 ;			    end			endcase  end
			81 : begin  r_addr <= 1;ps_ddr_wr_en   <=    valid0  ;ps_ddr_wr_data <=    rd_data0  ;ps_ddr_wr_start <= 0;case ({ps_ddr_wr_finish,&rd_fifo_cont}) 2'b11,2'b10: begin		   we <= 1;w_addr <= 0 ;w_data <= ps_ddr_wr_addr + 512 ;rd_state <= 2 ;rd_en0  <= 0;rd_fifo_cont <= 0;end 2'b01:begin rd_en0  <= 0;end 2'b00:begin rd_en0  <= 1;rd_fifo_cont <= rd_fifo_cont + 1 ;end endcase end
			82 : begin  r_addr <= 2;ps_ddr_wr_en   <=    valid1  ;ps_ddr_wr_data <=    rd_data1  ;ps_ddr_wr_start <= 0;case ({ps_ddr_wr_finish,&rd_fifo_cont}) 2'b11,2'b10: begin		   we <= 1;w_addr <= 1 ;w_data <= ps_ddr_wr_addr + 512 ;rd_state <= 3 ;rd_en1  <= 0;rd_fifo_cont <= 0;end 2'b01:begin rd_en1  <= 0;end 2'b00:begin rd_en1  <= 1;rd_fifo_cont <= rd_fifo_cont + 1 ;end endcase end
			83 : begin  r_addr <= 3;ps_ddr_wr_en   <=    valid2  ;ps_ddr_wr_data <=    rd_data2  ;ps_ddr_wr_start <= 0;case ({ps_ddr_wr_finish,&rd_fifo_cont}) 2'b11,2'b10: begin		   we <= 1;w_addr <= 2 ;w_data <= ps_ddr_wr_addr + 512 ;rd_state <= 4 ;rd_en2  <= 0;rd_fifo_cont <= 0;end 2'b01:begin rd_en2  <= 0;end 2'b00:begin rd_en2  <= 1;rd_fifo_cont <= rd_fifo_cont + 1 ;end endcase end
			84 : begin  r_addr <= 4;ps_ddr_wr_en   <=    valid3  ;ps_ddr_wr_data <=    rd_data3  ;ps_ddr_wr_start <= 0;case ({ps_ddr_wr_finish,&rd_fifo_cont}) 2'b11,2'b10: begin		   we <= 1;w_addr <= 3 ;w_data <= ps_ddr_wr_addr + 512 ;rd_state <= 5 ;rd_en3  <= 0;rd_fifo_cont <= 0;end 2'b01:begin rd_en3  <= 0;end 2'b00:begin rd_en3  <= 1;rd_fifo_cont <= rd_fifo_cont + 1 ;end endcase end
			85 : begin  r_addr <= 5;ps_ddr_wr_en   <=    valid4  ;ps_ddr_wr_data <=    rd_data4  ;ps_ddr_wr_start <= 0;case ({ps_ddr_wr_finish,&rd_fifo_cont}) 2'b11,2'b10: begin		   we <= 1;w_addr <= 4 ;w_data <= ps_ddr_wr_addr + 512 ;rd_state <= 6 ;rd_en4  <= 0;rd_fifo_cont <= 0;end 2'b01:begin rd_en4  <= 0;end 2'b00:begin rd_en4  <= 1;rd_fifo_cont <= rd_fifo_cont + 1 ;end endcase end
			86 : begin  r_addr <= 6;ps_ddr_wr_en   <=    valid5  ;ps_ddr_wr_data <=    rd_data5  ;ps_ddr_wr_start <= 0;case ({ps_ddr_wr_finish,&rd_fifo_cont}) 2'b11,2'b10: begin		   we <= 1;w_addr <= 5 ;w_data <= ps_ddr_wr_addr + 512 ;rd_state <= 7 ;rd_en5  <= 0;rd_fifo_cont <= 0;end 2'b01:begin rd_en5  <= 0;end 2'b00:begin rd_en5  <= 1;rd_fifo_cont <= rd_fifo_cont + 1 ;end endcase end
			87 : begin  r_addr <= 7;ps_ddr_wr_en   <=    valid6  ;ps_ddr_wr_data <=    rd_data6  ;ps_ddr_wr_start <= 0;case ({ps_ddr_wr_finish,&rd_fifo_cont}) 2'b11,2'b10: begin		   we <= 1;w_addr <= 6 ;w_data <= ps_ddr_wr_addr + 512 ;rd_state <= 8 ;rd_en6  <= 0;rd_fifo_cont <= 0;end 2'b01:begin rd_en6  <= 0;end 2'b00:begin rd_en6  <= 1;rd_fifo_cont <= rd_fifo_cont + 1 ;end endcase end
			88 : begin  r_addr <= 8;ps_ddr_wr_en   <=    valid7  ;ps_ddr_wr_data <=    rd_data7  ;ps_ddr_wr_start <= 0;case ({ps_ddr_wr_finish,&rd_fifo_cont}) 2'b11,2'b10: begin		   we <= 1;w_addr <= 7 ;w_data <= ps_ddr_wr_addr + 512 ;rd_state <= 9 ;rd_en7  <= 0;rd_fifo_cont <= 0;end 2'b01:begin rd_en7  <= 0;end 2'b00:begin rd_en7  <= 1;rd_fifo_cont <= rd_fifo_cont + 1 ;end endcase end
			89 : begin  r_addr <= 9;ps_ddr_wr_en   <=    valid8  ;ps_ddr_wr_data <=    rd_data8  ;ps_ddr_wr_start <= 0;case ({ps_ddr_wr_finish,&rd_fifo_cont}) 2'b11,2'b10: begin		   we <= 1;w_addr <= 8 ;w_data <= ps_ddr_wr_addr + 512 ;rd_state <= 10;rd_en8  <= 0;rd_fifo_cont <= 0;end 2'b01:begin rd_en8  <= 0;end 2'b00:begin rd_en8  <= 1;rd_fifo_cont <= rd_fifo_cont + 1 ;end endcase end
			90 : begin  r_addr <=10;ps_ddr_wr_en   <=    valid9  ;ps_ddr_wr_data <=    rd_data9  ;ps_ddr_wr_start <= 0;case ({ps_ddr_wr_finish,&rd_fifo_cont}) 2'b11,2'b10: begin		   we <= 1;w_addr <= 9 ;w_data <= ps_ddr_wr_addr + 512 ;rd_state <= 11;rd_en9  <= 0;rd_fifo_cont <= 0;end 2'b01:begin rd_en9  <= 0;end 2'b00:begin rd_en9  <= 1;rd_fifo_cont <= rd_fifo_cont + 1 ;end endcase end
			91 : begin  r_addr <=11;ps_ddr_wr_en   <=    valid10 ;ps_ddr_wr_data <=    rd_data10 ;ps_ddr_wr_start <= 0;case ({ps_ddr_wr_finish,&rd_fifo_cont}) 2'b11,2'b10: begin		   we <= 1;w_addr <= 10;w_data <= ps_ddr_wr_addr + 512 ;rd_state <= 12;rd_en10 <= 0;rd_fifo_cont <= 0;end 2'b01:begin rd_en10 <= 0;end 2'b00:begin rd_en10 <= 1;rd_fifo_cont <= rd_fifo_cont + 1 ;end endcase end
			92 : begin  r_addr <=12;ps_ddr_wr_en   <=    valid11 ;ps_ddr_wr_data <=    rd_data11 ;ps_ddr_wr_start <= 0;case ({ps_ddr_wr_finish,&rd_fifo_cont}) 2'b11,2'b10: begin		   we <= 1;w_addr <= 11;w_data <= ps_ddr_wr_addr + 512 ;rd_state <= 13;rd_en11 <= 0;rd_fifo_cont <= 0;end 2'b01:begin rd_en11 <= 0;end 2'b00:begin rd_en11 <= 1;rd_fifo_cont <= rd_fifo_cont + 1 ;end endcase end
			93 : begin  r_addr <=13;ps_ddr_wr_en   <=    valid12 ;ps_ddr_wr_data <=    rd_data12 ;ps_ddr_wr_start <= 0;case ({ps_ddr_wr_finish,&rd_fifo_cont}) 2'b11,2'b10: begin		   we <= 1;w_addr <= 12;w_data <= ps_ddr_wr_addr + 512 ;rd_state <= 14;rd_en12 <= 0;rd_fifo_cont <= 0;end 2'b01:begin rd_en12 <= 0;end 2'b00:begin rd_en12 <= 1;rd_fifo_cont <= rd_fifo_cont + 1 ;end endcase end
			94 : begin  r_addr <=14;ps_ddr_wr_en   <=    valid13 ;ps_ddr_wr_data <=    rd_data13 ;ps_ddr_wr_start <= 0;case ({ps_ddr_wr_finish,&rd_fifo_cont}) 2'b11,2'b10: begin		   we <= 1;w_addr <= 13;w_data <= ps_ddr_wr_addr + 512 ;rd_state <= 15;rd_en13 <= 0;rd_fifo_cont <= 0;end 2'b01:begin rd_en13 <= 0;end 2'b00:begin rd_en13 <= 1;rd_fifo_cont <= rd_fifo_cont + 1 ;end endcase end
			95 : begin  r_addr <=15;ps_ddr_wr_en   <=    valid14 ;ps_ddr_wr_data <=    rd_data14 ;ps_ddr_wr_start <= 0;case ({ps_ddr_wr_finish,&rd_fifo_cont}) 2'b11,2'b10: begin		   we <= 1;w_addr <= 14;w_data <= ps_ddr_wr_addr + 512 ;rd_state <= 16;rd_en14 <= 0;rd_fifo_cont <= 0;end 2'b01:begin rd_en14 <= 0;end 2'b00:begin rd_en14 <= 1;rd_fifo_cont <= rd_fifo_cont + 1 ;end endcase end
			96 : begin  r_addr <=16;ps_ddr_wr_en   <=    valid15 ;ps_ddr_wr_data <=    rd_data15 ;ps_ddr_wr_start <= 0;case ({ps_ddr_wr_finish,&rd_fifo_cont}) 2'b11,2'b10: begin		   we <= 1;w_addr <= 15;w_data <= ps_ddr_wr_addr + 512 ;rd_state <= 17;rd_en15 <= 0;rd_fifo_cont <= 0;end 2'b01:begin rd_en15 <= 0;end 2'b00:begin rd_en15 <= 1;rd_fifo_cont <= rd_fifo_cont + 1 ;end endcase end
			97 : begin  r_addr <=17;ps_ddr_wr_en   <=    valid16 ;ps_ddr_wr_data <=    rd_data16 ;ps_ddr_wr_start <= 0;case ({ps_ddr_wr_finish,&rd_fifo_cont}) 2'b11,2'b10: begin		   we <= 1;w_addr <= 16;w_data <= ps_ddr_wr_addr + 512 ;rd_state <= 18;rd_en16 <= 0;rd_fifo_cont <= 0;end 2'b01:begin rd_en16 <= 0;end 2'b00:begin rd_en16 <= 1;rd_fifo_cont <= rd_fifo_cont + 1 ;end endcase end
			98 : begin  r_addr <=18;ps_ddr_wr_en   <=    valid17 ;ps_ddr_wr_data <=    rd_data17 ;ps_ddr_wr_start <= 0;case ({ps_ddr_wr_finish,&rd_fifo_cont}) 2'b11,2'b10: begin		   we <= 1;w_addr <= 17;w_data <= ps_ddr_wr_addr + 512 ;rd_state <= 19;rd_en17 <= 0;rd_fifo_cont <= 0;end 2'b01:begin rd_en17 <= 0;end 2'b00:begin rd_en17 <= 1;rd_fifo_cont <= rd_fifo_cont + 1 ;end endcase end
			99 : begin  r_addr <=19;ps_ddr_wr_en   <=    valid18 ;ps_ddr_wr_data <=    rd_data18 ;ps_ddr_wr_start <= 0;case ({ps_ddr_wr_finish,&rd_fifo_cont}) 2'b11,2'b10: begin		   we <= 1;w_addr <= 18;w_data <= ps_ddr_wr_addr + 512 ;rd_state <= 20;rd_en18 <= 0;rd_fifo_cont <= 0;end 2'b01:begin rd_en18 <= 0;end 2'b00:begin rd_en18 <= 1;rd_fifo_cont <= rd_fifo_cont + 1 ;end endcase end
			100: begin  r_addr <=20;ps_ddr_wr_en   <=    valid19 ;ps_ddr_wr_data <=    rd_data19 ;ps_ddr_wr_start <= 0;case ({ps_ddr_wr_finish,&rd_fifo_cont}) 2'b11,2'b10: begin		   we <= 1;w_addr <= 19;w_data <= ps_ddr_wr_addr + 512 ;rd_state <= 21;rd_en19 <= 0;rd_fifo_cont <= 0;end 2'b01:begin rd_en19 <= 0;end 2'b00:begin rd_en19 <= 1;rd_fifo_cont <= rd_fifo_cont + 1 ;end endcase end
			101: begin  r_addr <=21;ps_ddr_wr_en   <=    valid20 ;ps_ddr_wr_data <=    rd_data20 ;ps_ddr_wr_start <= 0;case ({ps_ddr_wr_finish,&rd_fifo_cont}) 2'b11,2'b10: begin		   we <= 1;w_addr <= 20;w_data <= ps_ddr_wr_addr + 512 ;rd_state <= 22;rd_en20 <= 0;rd_fifo_cont <= 0;end 2'b01:begin rd_en20 <= 0;end 2'b00:begin rd_en20 <= 1;rd_fifo_cont <= rd_fifo_cont + 1 ;end endcase end
			102: begin  r_addr <=22;ps_ddr_wr_en   <=    valid21 ;ps_ddr_wr_data <=    rd_data21 ;ps_ddr_wr_start <= 0;case ({ps_ddr_wr_finish,&rd_fifo_cont}) 2'b11,2'b10: begin		   we <= 1;w_addr <= 21;w_data <= ps_ddr_wr_addr + 512 ;rd_state <= 23;rd_en21 <= 0;rd_fifo_cont <= 0;end 2'b01:begin rd_en21 <= 0;end 2'b00:begin rd_en21 <= 1;rd_fifo_cont <= rd_fifo_cont + 1 ;end endcase end
			103: begin  r_addr <=23;ps_ddr_wr_en   <=    valid22 ;ps_ddr_wr_data <=    rd_data22 ;ps_ddr_wr_start <= 0;case ({ps_ddr_wr_finish,&rd_fifo_cont}) 2'b11,2'b10: begin		   we <= 1;w_addr <= 22;w_data <= ps_ddr_wr_addr + 512 ;rd_state <= 24;rd_en22 <= 0;rd_fifo_cont <= 0;end 2'b01:begin rd_en22 <= 0;end 2'b00:begin rd_en22 <= 1;rd_fifo_cont <= rd_fifo_cont + 1 ;end endcase end
			104: begin  r_addr <=24;ps_ddr_wr_en   <=    valid23 ;ps_ddr_wr_data <=    rd_data23 ;ps_ddr_wr_start <= 0;case ({ps_ddr_wr_finish,&rd_fifo_cont}) 2'b11,2'b10: begin		   we <= 1;w_addr <= 23;w_data <= ps_ddr_wr_addr + 512 ;rd_state <= 25;rd_en23 <= 0;rd_fifo_cont <= 0;end 2'b01:begin rd_en23 <= 0;end 2'b00:begin rd_en23 <= 1;rd_fifo_cont <= rd_fifo_cont + 1 ;end endcase end
			105: begin  r_addr <=25;ps_ddr_wr_en   <=    valid24 ;ps_ddr_wr_data <=    rd_data24 ;ps_ddr_wr_start <= 0;case ({ps_ddr_wr_finish,&rd_fifo_cont}) 2'b11,2'b10: begin		   we <= 1;w_addr <= 24;w_data <= ps_ddr_wr_addr + 512 ;rd_state <= 26;rd_en24 <= 0;rd_fifo_cont <= 0;end 2'b01:begin rd_en24 <= 0;end 2'b00:begin rd_en24 <= 1;rd_fifo_cont <= rd_fifo_cont + 1 ;end endcase end
			106: begin  r_addr <=26;ps_ddr_wr_en   <=    valid25 ;ps_ddr_wr_data <=    rd_data25 ;ps_ddr_wr_start <= 0;case ({ps_ddr_wr_finish,&rd_fifo_cont}) 2'b11,2'b10: begin		   we <= 1;w_addr <= 25;w_data <= ps_ddr_wr_addr + 512 ;rd_state <= 27;rd_en25 <= 0;rd_fifo_cont <= 0;end 2'b01:begin rd_en25 <= 0;end 2'b00:begin rd_en25 <= 1;rd_fifo_cont <= rd_fifo_cont + 1 ;end endcase end
			107: begin  r_addr <=27;ps_ddr_wr_en   <=    valid26 ;ps_ddr_wr_data <=    rd_data26 ;ps_ddr_wr_start <= 0;case ({ps_ddr_wr_finish,&rd_fifo_cont}) 2'b11,2'b10: begin		   we <= 1;w_addr <= 26;w_data <= ps_ddr_wr_addr + 512 ;rd_state <= 28;rd_en26 <= 0;rd_fifo_cont <= 0;end 2'b01:begin rd_en26 <= 0;end 2'b00:begin rd_en26 <= 1;rd_fifo_cont <= rd_fifo_cont + 1 ;end endcase end
			108: begin  r_addr <=28;ps_ddr_wr_en   <=    valid27 ;ps_ddr_wr_data <=    rd_data27 ;ps_ddr_wr_start <= 0;case ({ps_ddr_wr_finish,&rd_fifo_cont}) 2'b11,2'b10: begin		   we <= 1;w_addr <= 27;w_data <= ps_ddr_wr_addr + 512 ;rd_state <= 29;rd_en27 <= 0;rd_fifo_cont <= 0;end 2'b01:begin rd_en27 <= 0;end 2'b00:begin rd_en27 <= 1;rd_fifo_cont <= rd_fifo_cont + 1 ;end endcase end
			109: begin  r_addr <=29;ps_ddr_wr_en   <=    valid28 ;ps_ddr_wr_data <=    rd_data28 ;ps_ddr_wr_start <= 0;case ({ps_ddr_wr_finish,&rd_fifo_cont}) 2'b11,2'b10: begin		   we <= 1;w_addr <= 28;w_data <= ps_ddr_wr_addr + 512 ;rd_state <= 30;rd_en28 <= 0;rd_fifo_cont <= 0;end 2'b01:begin rd_en28 <= 0;end 2'b00:begin rd_en28 <= 1;rd_fifo_cont <= rd_fifo_cont + 1 ;end endcase end
			110: begin  r_addr <=30;ps_ddr_wr_en   <=    valid29 ;ps_ddr_wr_data <=    rd_data29 ;ps_ddr_wr_start <= 0;case ({ps_ddr_wr_finish,&rd_fifo_cont}) 2'b11,2'b10: begin		   we <= 1;w_addr <= 29;w_data <= ps_ddr_wr_addr + 512 ;rd_state <= 31;rd_en29 <= 0;rd_fifo_cont <= 0;end 2'b01:begin rd_en29 <= 0;end 2'b00:begin rd_en29 <= 1;rd_fifo_cont <= rd_fifo_cont + 1 ;end endcase end
			111: begin  r_addr <=31;ps_ddr_wr_en   <=    valid30 ;ps_ddr_wr_data <=    rd_data30 ;ps_ddr_wr_start <= 0;case ({ps_ddr_wr_finish,&rd_fifo_cont}) 2'b11,2'b10: begin		   we <= 1;w_addr <= 30;w_data <= ps_ddr_wr_addr + 512 ;rd_state <= 32;rd_en30 <= 0;rd_fifo_cont <= 0;end 2'b01:begin rd_en30 <= 0;end 2'b00:begin rd_en30 <= 1;rd_fifo_cont <= rd_fifo_cont + 1 ;end endcase end
			112: begin  r_addr <=32;ps_ddr_wr_en   <=    valid31 ;ps_ddr_wr_data <=    rd_data31 ;ps_ddr_wr_start <= 0;case ({ps_ddr_wr_finish,&rd_fifo_cont}) 2'b11,2'b10: begin		   we <= 1;w_addr <= 31;w_data <= ps_ddr_wr_addr + 512 ;rd_state <= 33;rd_en31 <= 0;rd_fifo_cont <= 0;end 2'b01:begin rd_en31 <= 0;end 2'b00:begin rd_en31 <= 1;rd_fifo_cont <= rd_fifo_cont + 1 ;end endcase end
			113: begin  r_addr <=33;ps_ddr_wr_en   <=    valid32 ;ps_ddr_wr_data <=    rd_data32 ;ps_ddr_wr_start <= 0;case ({ps_ddr_wr_finish,&rd_fifo_cont}) 2'b11,2'b10: begin		   we <= 1;w_addr <= 32;w_data <= ps_ddr_wr_addr + 512 ;rd_state <= 34;rd_en32 <= 0;rd_fifo_cont <= 0;end 2'b01:begin rd_en32 <= 0;end 2'b00:begin rd_en32 <= 1;rd_fifo_cont <= rd_fifo_cont + 1 ;end endcase end
			114: begin  r_addr <=34;ps_ddr_wr_en   <=    valid33 ;ps_ddr_wr_data <=    rd_data33 ;ps_ddr_wr_start <= 0;case ({ps_ddr_wr_finish,&rd_fifo_cont}) 2'b11,2'b10: begin		   we <= 1;w_addr <= 33;w_data <= ps_ddr_wr_addr + 512 ;rd_state <= 35;rd_en33 <= 0;rd_fifo_cont <= 0;end 2'b01:begin rd_en33 <= 0;end 2'b00:begin rd_en33 <= 1;rd_fifo_cont <= rd_fifo_cont + 1 ;end endcase end
			115: begin  r_addr <=35;ps_ddr_wr_en   <=    valid34 ;ps_ddr_wr_data <=    rd_data34 ;ps_ddr_wr_start <= 0;case ({ps_ddr_wr_finish,&rd_fifo_cont}) 2'b11,2'b10: begin		   we <= 1;w_addr <= 34;w_data <= ps_ddr_wr_addr + 512 ;rd_state <= 36;rd_en34 <= 0;rd_fifo_cont <= 0;end 2'b01:begin rd_en34 <= 0;end 2'b00:begin rd_en34 <= 1;rd_fifo_cont <= rd_fifo_cont + 1 ;end endcase end
			116: begin  r_addr <=36;ps_ddr_wr_en   <=    valid35 ;ps_ddr_wr_data <=    rd_data35 ;ps_ddr_wr_start <= 0;case ({ps_ddr_wr_finish,&rd_fifo_cont}) 2'b11,2'b10: begin		   we <= 1;w_addr <= 35;w_data <= ps_ddr_wr_addr + 512 ;rd_state <= 37;rd_en35 <= 0;rd_fifo_cont <= 0;end 2'b01:begin rd_en35 <= 0;end 2'b00:begin rd_en35 <= 1;rd_fifo_cont <= rd_fifo_cont + 1 ;end endcase end
			117: begin  r_addr <=37;ps_ddr_wr_en   <=    valid36 ;ps_ddr_wr_data <=    rd_data36 ;ps_ddr_wr_start <= 0;case ({ps_ddr_wr_finish,&rd_fifo_cont}) 2'b11,2'b10: begin		   we <= 1;w_addr <= 36;w_data <= ps_ddr_wr_addr + 512 ;rd_state <= 38;rd_en36 <= 0;rd_fifo_cont <= 0;end 2'b01:begin rd_en36 <= 0;end 2'b00:begin rd_en36 <= 1;rd_fifo_cont <= rd_fifo_cont + 1 ;end endcase end
			118: begin  r_addr <=38;ps_ddr_wr_en   <=    valid37 ;ps_ddr_wr_data <=    rd_data37 ;ps_ddr_wr_start <= 0;case ({ps_ddr_wr_finish,&rd_fifo_cont}) 2'b11,2'b10: begin		   we <= 1;w_addr <= 37;w_data <= ps_ddr_wr_addr + 512 ;rd_state <= 39;rd_en37 <= 0;rd_fifo_cont <= 0;end 2'b01:begin rd_en37 <= 0;end 2'b00:begin rd_en37 <= 1;rd_fifo_cont <= rd_fifo_cont + 1 ;end endcase end
			119: begin  r_addr <=39;ps_ddr_wr_en   <=    valid38 ;ps_ddr_wr_data <=    rd_data38 ;ps_ddr_wr_start <= 0;case ({ps_ddr_wr_finish,&rd_fifo_cont}) 2'b11,2'b10: begin		   we <= 1;w_addr <= 38;w_data <= ps_ddr_wr_addr + 512 ;rd_state <= 40;rd_en38 <= 0;rd_fifo_cont <= 0;end 2'b01:begin rd_en38 <= 0;end 2'b00:begin rd_en38 <= 1;rd_fifo_cont <= rd_fifo_cont + 1 ;end endcase end
			120: begin  r_addr <=40;ps_ddr_wr_en   <=    valid39 ;ps_ddr_wr_data <=    rd_data39 ;ps_ddr_wr_start <= 0;case ({ps_ddr_wr_finish,&rd_fifo_cont}) 2'b11,2'b10: begin		   we <= 1;w_addr <= 39;w_data <= ps_ddr_wr_addr + 512 ;rd_state <= 41;rd_en39 <= 0;rd_fifo_cont <= 0;end 2'b01:begin rd_en39 <= 0;end 2'b00:begin rd_en39 <= 1;rd_fifo_cont <= rd_fifo_cont + 1 ;end endcase end
			121: begin  r_addr <=41;ps_ddr_wr_en   <=    valid40 ;ps_ddr_wr_data <=    rd_data40 ;ps_ddr_wr_start <= 0;case ({ps_ddr_wr_finish,&rd_fifo_cont}) 2'b11,2'b10: begin		   we <= 1;w_addr <= 40;w_data <= ps_ddr_wr_addr + 512 ;rd_state <= 42;rd_en40 <= 0;rd_fifo_cont <= 0;end 2'b01:begin rd_en40 <= 0;end 2'b00:begin rd_en40 <= 1;rd_fifo_cont <= rd_fifo_cont + 1 ;end endcase end
			122: begin  r_addr <=42;ps_ddr_wr_en   <=    valid41 ;ps_ddr_wr_data <=    rd_data41 ;ps_ddr_wr_start <= 0;case ({ps_ddr_wr_finish,&rd_fifo_cont}) 2'b11,2'b10: begin		   we <= 1;w_addr <= 41;w_data <= ps_ddr_wr_addr + 512 ;rd_state <= 43;rd_en41 <= 0;rd_fifo_cont <= 0;end 2'b01:begin rd_en41 <= 0;end 2'b00:begin rd_en41 <= 1;rd_fifo_cont <= rd_fifo_cont + 1 ;end endcase end
			123: begin  r_addr <=43;ps_ddr_wr_en   <=    valid42 ;ps_ddr_wr_data <=    rd_data42 ;ps_ddr_wr_start <= 0;case ({ps_ddr_wr_finish,&rd_fifo_cont}) 2'b11,2'b10: begin		   we <= 1;w_addr <= 42;w_data <= ps_ddr_wr_addr + 512 ;rd_state <= 44;rd_en42 <= 0;rd_fifo_cont <= 0;end 2'b01:begin rd_en42 <= 0;end 2'b00:begin rd_en42 <= 1;rd_fifo_cont <= rd_fifo_cont + 1 ;end endcase end
			124: begin  r_addr <=44;ps_ddr_wr_en   <=    valid43 ;ps_ddr_wr_data <=    rd_data43 ;ps_ddr_wr_start <= 0;case ({ps_ddr_wr_finish,&rd_fifo_cont}) 2'b11,2'b10: begin		   we <= 1;w_addr <= 43;w_data <= ps_ddr_wr_addr + 512 ;rd_state <= 45;rd_en43 <= 0;rd_fifo_cont <= 0;end 2'b01:begin rd_en43 <= 0;end 2'b00:begin rd_en43 <= 1;rd_fifo_cont <= rd_fifo_cont + 1 ;end endcase end
			125: begin  r_addr <=45;ps_ddr_wr_en   <=    valid44 ;ps_ddr_wr_data <=    rd_data44 ;ps_ddr_wr_start <= 0;case ({ps_ddr_wr_finish,&rd_fifo_cont}) 2'b11,2'b10: begin		   we <= 1;w_addr <= 44;w_data <= ps_ddr_wr_addr + 512 ;rd_state <= 46;rd_en44 <= 0;rd_fifo_cont <= 0;end 2'b01:begin rd_en44 <= 0;end 2'b00:begin rd_en44 <= 1;rd_fifo_cont <= rd_fifo_cont + 1 ;end endcase end
			126: begin  r_addr <=46;ps_ddr_wr_en   <=    valid45 ;ps_ddr_wr_data <=    rd_data45 ;ps_ddr_wr_start <= 0;case ({ps_ddr_wr_finish,&rd_fifo_cont}) 2'b11,2'b10: begin		   we <= 1;w_addr <= 45;w_data <= ps_ddr_wr_addr + 512 ;rd_state <= 47;rd_en45 <= 0;rd_fifo_cont <= 0;end 2'b01:begin rd_en45 <= 0;end 2'b00:begin rd_en45 <= 1;rd_fifo_cont <= rd_fifo_cont + 1 ;end endcase end
			127: begin  r_addr <=47;ps_ddr_wr_en   <=    valid46 ;ps_ddr_wr_data <=    rd_data46 ;ps_ddr_wr_start <= 0;case ({ps_ddr_wr_finish,&rd_fifo_cont}) 2'b11,2'b10: begin		   we <= 1;w_addr <= 46;w_data <= ps_ddr_wr_addr + 512 ;rd_state <= 48;rd_en46 <= 0;rd_fifo_cont <= 0;end 2'b01:begin rd_en46 <= 0;end 2'b00:begin rd_en46 <= 1;rd_fifo_cont <= rd_fifo_cont + 1 ;end endcase end
			128: begin  r_addr <=48;ps_ddr_wr_en   <=    valid47 ;ps_ddr_wr_data <=    rd_data47 ;ps_ddr_wr_start <= 0;case ({ps_ddr_wr_finish,&rd_fifo_cont}) 2'b11,2'b10: begin		   we <= 1;w_addr <= 47;w_data <= ps_ddr_wr_addr + 512 ;rd_state <= 49;rd_en47 <= 0;rd_fifo_cont <= 0;end 2'b01:begin rd_en47 <= 0;end 2'b00:begin rd_en47 <= 1;rd_fifo_cont <= rd_fifo_cont + 1 ;end endcase end
			129: begin  r_addr <=49;ps_ddr_wr_en   <=    valid48 ;ps_ddr_wr_data <=    rd_data48 ;ps_ddr_wr_start <= 0;case ({ps_ddr_wr_finish,&rd_fifo_cont}) 2'b11,2'b10: begin		   we <= 1;w_addr <= 48;w_data <= ps_ddr_wr_addr + 512 ;rd_state <= 50;rd_en48 <= 0;rd_fifo_cont <= 0;end 2'b01:begin rd_en48 <= 0;end 2'b00:begin rd_en48 <= 1;rd_fifo_cont <= rd_fifo_cont + 1 ;end endcase end
			130: begin  r_addr <=50;ps_ddr_wr_en   <=    valid49 ;ps_ddr_wr_data <=    rd_data49 ;ps_ddr_wr_start <= 0;case ({ps_ddr_wr_finish,&rd_fifo_cont}) 2'b11,2'b10: begin		   we <= 1;w_addr <= 49;w_data <= ps_ddr_wr_addr + 512 ;rd_state <= 51;rd_en49 <= 0;rd_fifo_cont <= 0;end 2'b01:begin rd_en49 <= 0;end 2'b00:begin rd_en49 <= 1;rd_fifo_cont <= rd_fifo_cont + 1 ;end endcase end
			131: begin  r_addr <=51;ps_ddr_wr_en   <=    valid50 ;ps_ddr_wr_data <=    rd_data50 ;ps_ddr_wr_start <= 0;case ({ps_ddr_wr_finish,&rd_fifo_cont}) 2'b11,2'b10: begin		   we <= 1;w_addr <= 50;w_data <= ps_ddr_wr_addr + 512 ;rd_state <= 52;rd_en50 <= 0;rd_fifo_cont <= 0;end 2'b01:begin rd_en50 <= 0;end 2'b00:begin rd_en50 <= 1;rd_fifo_cont <= rd_fifo_cont + 1 ;end endcase end
			132: begin  r_addr <=52;ps_ddr_wr_en   <=    valid51 ;ps_ddr_wr_data <=    rd_data51 ;ps_ddr_wr_start <= 0;case ({ps_ddr_wr_finish,&rd_fifo_cont}) 2'b11,2'b10: begin		   we <= 1;w_addr <= 51;w_data <= ps_ddr_wr_addr + 512 ;rd_state <= 53;rd_en51 <= 0;rd_fifo_cont <= 0;end 2'b01:begin rd_en51 <= 0;end 2'b00:begin rd_en51 <= 1;rd_fifo_cont <= rd_fifo_cont + 1 ;end endcase end
			133: begin  r_addr <=53;ps_ddr_wr_en   <=    valid52 ;ps_ddr_wr_data <=    rd_data52 ;ps_ddr_wr_start <= 0;case ({ps_ddr_wr_finish,&rd_fifo_cont}) 2'b11,2'b10: begin		   we <= 1;w_addr <= 52;w_data <= ps_ddr_wr_addr + 512 ;rd_state <= 54;rd_en52 <= 0;rd_fifo_cont <= 0;end 2'b01:begin rd_en52 <= 0;end 2'b00:begin rd_en52 <= 1;rd_fifo_cont <= rd_fifo_cont + 1 ;end endcase end
			134: begin  r_addr <=54;ps_ddr_wr_en   <=    valid53 ;ps_ddr_wr_data <=    rd_data53 ;ps_ddr_wr_start <= 0;case ({ps_ddr_wr_finish,&rd_fifo_cont}) 2'b11,2'b10: begin		   we <= 1;w_addr <= 53;w_data <= ps_ddr_wr_addr + 512 ;rd_state <= 55;rd_en53 <= 0;rd_fifo_cont <= 0;end 2'b01:begin rd_en53 <= 0;end 2'b00:begin rd_en53 <= 1;rd_fifo_cont <= rd_fifo_cont + 1 ;end endcase end
			135: begin  r_addr <=55;ps_ddr_wr_en   <=    valid54 ;ps_ddr_wr_data <=    rd_data54 ;ps_ddr_wr_start <= 0;case ({ps_ddr_wr_finish,&rd_fifo_cont}) 2'b11,2'b10: begin		   we <= 1;w_addr <= 54;w_data <= ps_ddr_wr_addr + 512 ;rd_state <= 56;rd_en54 <= 0;rd_fifo_cont <= 0;end 2'b01:begin rd_en54 <= 0;end 2'b00:begin rd_en54 <= 1;rd_fifo_cont <= rd_fifo_cont + 1 ;end endcase end
			136: begin  r_addr <=56;ps_ddr_wr_en   <=    valid55 ;ps_ddr_wr_data <=    rd_data55 ;ps_ddr_wr_start <= 0;case ({ps_ddr_wr_finish,&rd_fifo_cont}) 2'b11,2'b10: begin		   we <= 1;w_addr <= 55;w_data <= ps_ddr_wr_addr + 512 ;rd_state <= 57;rd_en55 <= 0;rd_fifo_cont <= 0;end 2'b01:begin rd_en55 <= 0;end 2'b00:begin rd_en55 <= 1;rd_fifo_cont <= rd_fifo_cont + 1 ;end endcase end
			137: begin  r_addr <=57;ps_ddr_wr_en   <=    valid56 ;ps_ddr_wr_data <=    rd_data56 ;ps_ddr_wr_start <= 0;case ({ps_ddr_wr_finish,&rd_fifo_cont}) 2'b11,2'b10: begin		   we <= 1;w_addr <= 56;w_data <= ps_ddr_wr_addr + 512 ;rd_state <= 58;rd_en56 <= 0;rd_fifo_cont <= 0;end 2'b01:begin rd_en56 <= 0;end 2'b00:begin rd_en56 <= 1;rd_fifo_cont <= rd_fifo_cont + 1 ;end endcase end
			138: begin  r_addr <=58;ps_ddr_wr_en   <=    valid57 ;ps_ddr_wr_data <=    rd_data57 ;ps_ddr_wr_start <= 0;case ({ps_ddr_wr_finish,&rd_fifo_cont}) 2'b11,2'b10: begin		   we <= 1;w_addr <= 57;w_data <= ps_ddr_wr_addr + 512 ;rd_state <= 59;rd_en57 <= 0;rd_fifo_cont <= 0;end 2'b01:begin rd_en57 <= 0;end 2'b00:begin rd_en57 <= 1;rd_fifo_cont <= rd_fifo_cont + 1 ;end endcase end
			139: begin  r_addr <=59;ps_ddr_wr_en   <=    valid58 ;ps_ddr_wr_data <=    rd_data58 ;ps_ddr_wr_start <= 0;case ({ps_ddr_wr_finish,&rd_fifo_cont}) 2'b11,2'b10: begin		   we <= 1;w_addr <= 58;w_data <= ps_ddr_wr_addr + 512 ;rd_state <= 60;rd_en58 <= 0;rd_fifo_cont <= 0;end 2'b01:begin rd_en58 <= 0;end 2'b00:begin rd_en58 <= 1;rd_fifo_cont <= rd_fifo_cont + 1 ;end endcase end
			140: begin  r_addr <=60;ps_ddr_wr_en   <=    valid59 ;ps_ddr_wr_data <=    rd_data59 ;ps_ddr_wr_start <= 0;case ({ps_ddr_wr_finish,&rd_fifo_cont}) 2'b11,2'b10: begin		   we <= 1;w_addr <= 59;w_data <= ps_ddr_wr_addr + 512 ;rd_state <= 61;rd_en59 <= 0;rd_fifo_cont <= 0;end 2'b01:begin rd_en59 <= 0;end 2'b00:begin rd_en59 <= 1;rd_fifo_cont <= rd_fifo_cont + 1 ;end endcase end
			141: begin  r_addr <=61;ps_ddr_wr_en   <=    valid60 ;ps_ddr_wr_data <=    rd_data60 ;ps_ddr_wr_start <= 0;case ({ps_ddr_wr_finish,&rd_fifo_cont}) 2'b11,2'b10: begin		   we <= 1;w_addr <= 60;w_data <= ps_ddr_wr_addr + 512 ;rd_state <= 62;rd_en60 <= 0;rd_fifo_cont <= 0;end 2'b01:begin rd_en60 <= 0;end 2'b00:begin rd_en60 <= 1;rd_fifo_cont <= rd_fifo_cont + 1 ;end endcase end
			142: begin  r_addr <=62;ps_ddr_wr_en   <=    valid61 ;ps_ddr_wr_data <=    rd_data61 ;ps_ddr_wr_start <= 0;case ({ps_ddr_wr_finish,&rd_fifo_cont}) 2'b11,2'b10: begin		   we <= 1;w_addr <= 61;w_data <= ps_ddr_wr_addr + 512 ;rd_state <= 63;rd_en61 <= 0;rd_fifo_cont <= 0;end 2'b01:begin rd_en61 <= 0;end 2'b00:begin rd_en61 <= 1;rd_fifo_cont <= rd_fifo_cont + 1 ;end endcase end
			143: begin  r_addr <=63;ps_ddr_wr_en   <=    valid62 ;ps_ddr_wr_data <=    rd_data62 ;ps_ddr_wr_start <= 0;case ({ps_ddr_wr_finish,&rd_fifo_cont}) 2'b11,2'b10: begin		   we <= 1;w_addr <= 62;w_data <= ps_ddr_wr_addr + 512 ;rd_state <= 64;rd_en62 <= 0;rd_fifo_cont <= 0;end 2'b01:begin rd_en62 <= 0;end 2'b00:begin rd_en62 <= 1;rd_fifo_cont <= rd_fifo_cont + 1 ;end endcase end
			144: begin  r_addr <=64;ps_ddr_wr_en   <=    valid63 ;ps_ddr_wr_data <=    rd_data63 ;ps_ddr_wr_start <= 0;case ({ps_ddr_wr_finish,&rd_fifo_cont}) 2'b11,2'b10: begin		   we <= 1;w_addr <= 63;w_data <= ps_ddr_wr_addr + 512 ;rd_state <= 65;rd_en63 <= 0;rd_fifo_cont <= 0;end 2'b01:begin rd_en63 <= 0;end 2'b00:begin rd_en63 <= 1;rd_fifo_cont <= rd_fifo_cont + 1 ;end endcase end
			145: begin  r_addr <=65;ps_ddr_wr_en   <=    valid64 ;ps_ddr_wr_data <=    rd_data64 ;ps_ddr_wr_start <= 0;case ({ps_ddr_wr_finish,&rd_fifo_cont}) 2'b11,2'b10: begin		   we <= 1;w_addr <= 64;w_data <= ps_ddr_wr_addr + 512 ;rd_state <= 66;rd_en64 <= 0;rd_fifo_cont <= 0;end 2'b01:begin rd_en64 <= 0;end 2'b00:begin rd_en64 <= 1;rd_fifo_cont <= rd_fifo_cont + 1 ;end endcase end
			146: begin  r_addr <=66;ps_ddr_wr_en   <=    valid65 ;ps_ddr_wr_data <=    rd_data65 ;ps_ddr_wr_start <= 0;case ({ps_ddr_wr_finish,&rd_fifo_cont}) 2'b11,2'b10: begin		   we <= 1;w_addr <= 65;w_data <= ps_ddr_wr_addr + 512 ;rd_state <= 67;rd_en65 <= 0;rd_fifo_cont <= 0;end 2'b01:begin rd_en65 <= 0;end 2'b00:begin rd_en65 <= 1;rd_fifo_cont <= rd_fifo_cont + 1 ;end endcase end
			147: begin  r_addr <=67;ps_ddr_wr_en   <=    valid66 ;ps_ddr_wr_data <=    rd_data66 ;ps_ddr_wr_start <= 0;case ({ps_ddr_wr_finish,&rd_fifo_cont}) 2'b11,2'b10: begin		   we <= 1;w_addr <= 66;w_data <= ps_ddr_wr_addr + 512 ;rd_state <= 68;rd_en66 <= 0;rd_fifo_cont <= 0;end 2'b01:begin rd_en66 <= 0;end 2'b00:begin rd_en66 <= 1;rd_fifo_cont <= rd_fifo_cont + 1 ;end endcase end
			148: begin  r_addr <=68;ps_ddr_wr_en   <=    valid67 ;ps_ddr_wr_data <=    rd_data67 ;ps_ddr_wr_start <= 0;case ({ps_ddr_wr_finish,&rd_fifo_cont}) 2'b11,2'b10: begin		   we <= 1;w_addr <= 67;w_data <= ps_ddr_wr_addr + 512 ;rd_state <= 69;rd_en67 <= 0;rd_fifo_cont <= 0;end 2'b01:begin rd_en67 <= 0;end 2'b00:begin rd_en67 <= 1;rd_fifo_cont <= rd_fifo_cont + 1 ;end endcase end
			149: begin  r_addr <=69;ps_ddr_wr_en   <=    valid68 ;ps_ddr_wr_data <=    rd_data68 ;ps_ddr_wr_start <= 0;case ({ps_ddr_wr_finish,&rd_fifo_cont}) 2'b11,2'b10: begin		   we <= 1;w_addr <= 68;w_data <= ps_ddr_wr_addr + 512 ;rd_state <= 70;rd_en68 <= 0;rd_fifo_cont <= 0;end 2'b01:begin rd_en68 <= 0;end 2'b00:begin rd_en68 <= 1;rd_fifo_cont <= rd_fifo_cont + 1 ;end endcase end
			150: begin  r_addr <=70;ps_ddr_wr_en   <=    valid69 ;ps_ddr_wr_data <=    rd_data69 ;ps_ddr_wr_start <= 0;case ({ps_ddr_wr_finish,&rd_fifo_cont}) 2'b11,2'b10: begin		   we <= 1;w_addr <= 69;w_data <= ps_ddr_wr_addr + 512 ;rd_state <= 71;rd_en69 <= 0;rd_fifo_cont <= 0;end 2'b01:begin rd_en69 <= 0;end 2'b00:begin rd_en69 <= 1;rd_fifo_cont <= rd_fifo_cont + 1 ;end endcase end
			151: begin  r_addr <=71;ps_ddr_wr_en   <=    valid70 ;ps_ddr_wr_data <=    rd_data70 ;ps_ddr_wr_start <= 0;case ({ps_ddr_wr_finish,&rd_fifo_cont}) 2'b11,2'b10: begin		   we <= 1;w_addr <= 70;w_data <= ps_ddr_wr_addr + 512 ;rd_state <= 72;rd_en70 <= 0;rd_fifo_cont <= 0;end 2'b01:begin rd_en70 <= 0;end 2'b00:begin rd_en70 <= 1;rd_fifo_cont <= rd_fifo_cont + 1 ;end endcase end
			152: begin  r_addr <=72;ps_ddr_wr_en   <=    valid71 ;ps_ddr_wr_data <=    rd_data71 ;ps_ddr_wr_start <= 0;case ({ps_ddr_wr_finish,&rd_fifo_cont}) 2'b11,2'b10: begin		   we <= 1;w_addr <= 71;w_data <= ps_ddr_wr_addr + 512 ;rd_state <= 73;rd_en71 <= 0;rd_fifo_cont <= 0;end 2'b01:begin rd_en71 <= 0;end 2'b00:begin rd_en71 <= 1;rd_fifo_cont <= rd_fifo_cont + 1 ;end endcase end
			153: begin  r_addr <=73;ps_ddr_wr_en   <=    valid72 ;ps_ddr_wr_data <=    rd_data72 ;ps_ddr_wr_start <= 0;case ({ps_ddr_wr_finish,&rd_fifo_cont}) 2'b11,2'b10: begin		   we <= 1;w_addr <= 72;w_data <= ps_ddr_wr_addr + 512 ;rd_state <= 74;rd_en72 <= 0;rd_fifo_cont <= 0;end 2'b01:begin rd_en72 <= 0;end 2'b00:begin rd_en72 <= 1;rd_fifo_cont <= rd_fifo_cont + 1 ;end endcase end
			154: begin  r_addr <=74;ps_ddr_wr_en   <=    valid73 ;ps_ddr_wr_data <=    rd_data73 ;ps_ddr_wr_start <= 0;case ({ps_ddr_wr_finish,&rd_fifo_cont}) 2'b11,2'b10: begin		   we <= 1;w_addr <= 73;w_data <= ps_ddr_wr_addr + 512 ;rd_state <= 75;rd_en73 <= 0;rd_fifo_cont <= 0;end 2'b01:begin rd_en73 <= 0;end 2'b00:begin rd_en73 <= 1;rd_fifo_cont <= rd_fifo_cont + 1 ;end endcase end
			155: begin  r_addr <=75;ps_ddr_wr_en   <=    valid74 ;ps_ddr_wr_data <=    rd_data74 ;ps_ddr_wr_start <= 0;case ({ps_ddr_wr_finish,&rd_fifo_cont}) 2'b11,2'b10: begin		   we <= 1;w_addr <= 74;w_data <= ps_ddr_wr_addr + 512 ;rd_state <= 76;rd_en74 <= 0;rd_fifo_cont <= 0;end 2'b01:begin rd_en74 <= 0;end 2'b00:begin rd_en74 <= 1;rd_fifo_cont <= rd_fifo_cont + 1 ;end endcase end
			156: begin  r_addr <=76;ps_ddr_wr_en   <=    valid75 ;ps_ddr_wr_data <=    rd_data75 ;ps_ddr_wr_start <= 0;case ({ps_ddr_wr_finish,&rd_fifo_cont}) 2'b11,2'b10: begin		   we <= 1;w_addr <= 75;w_data <= ps_ddr_wr_addr + 512 ;rd_state <= 77;rd_en75 <= 0;rd_fifo_cont <= 0;end 2'b01:begin rd_en75 <= 0;end 2'b00:begin rd_en75 <= 1;rd_fifo_cont <= rd_fifo_cont + 1 ;end endcase end
			157: begin  r_addr <=77;ps_ddr_wr_en   <=    valid76 ;ps_ddr_wr_data <=    rd_data76 ;ps_ddr_wr_start <= 0;case ({ps_ddr_wr_finish,&rd_fifo_cont}) 2'b11,2'b10: begin		   we <= 1;w_addr <= 76;w_data <= ps_ddr_wr_addr + 512 ;rd_state <= 78;rd_en76 <= 0;rd_fifo_cont <= 0;end 2'b01:begin rd_en76 <= 0;end 2'b00:begin rd_en76 <= 1;rd_fifo_cont <= rd_fifo_cont + 1 ;end endcase end
			158: begin  r_addr <=78;ps_ddr_wr_en   <=    valid77 ;ps_ddr_wr_data <=    rd_data77 ;ps_ddr_wr_start <= 0;case ({ps_ddr_wr_finish,&rd_fifo_cont}) 2'b11,2'b10: begin		   we <= 1;w_addr <= 77;w_data <= ps_ddr_wr_addr + 512 ;rd_state <= 79;rd_en77 <= 0;rd_fifo_cont <= 0;end 2'b01:begin rd_en77 <= 0;end 2'b00:begin rd_en77 <= 1;rd_fifo_cont <= rd_fifo_cont + 1 ;end endcase end
			159: begin  r_addr <=79;ps_ddr_wr_en   <=    valid78 ;ps_ddr_wr_data <=    rd_data78 ;ps_ddr_wr_start <= 0;case ({ps_ddr_wr_finish,&rd_fifo_cont}) 2'b11,2'b10: begin		   we <= 1;w_addr <= 78;w_data <= ps_ddr_wr_addr + 512 ;rd_state <= 80;rd_en78 <= 0;rd_fifo_cont <= 0;end 2'b01:begin rd_en78 <= 0;end 2'b00:begin rd_en78 <= 1;rd_fifo_cont <= rd_fifo_cont + 1 ;end endcase end
			160: begin  r_addr <= 0;ps_ddr_wr_en   <=    valid79 ;ps_ddr_wr_data <=    rd_data79 ;ps_ddr_wr_start <= 0;case ({ps_ddr_wr_finish,&rd_fifo_cont}) 2'b11,2'b10: begin		   we <= 1;w_addr <= 79;w_data <= ps_ddr_wr_addr + 512 ;rd_state <= 1 ;rd_en79 <= 0;rd_fifo_cont <= 0;end 2'b01:begin rd_en79 <= 0;end 2'b00:begin rd_en79 <= 1;rd_fifo_cont <= rd_fifo_cont + 1 ;end endcase end
			161:
			begin
				r_addr <= 0;
				{fifo_cont_reg0,	fifo_cont_reg1,	fifo_cont_reg2,	fifo_cont_reg3,	fifo_cont_reg4,	fifo_cont_reg5,	fifo_cont_reg6,	fifo_cont_reg7,	fifo_cont_reg8,	fifo_cont_reg9,	fifo_cont_reg10,	fifo_cont_reg11,	fifo_cont_reg12,	fifo_cont_reg13,	fifo_cont_reg14,	fifo_cont_reg15,	fifo_cont_reg16,	fifo_cont_reg17,	fifo_cont_reg18,	fifo_cont_reg19,	fifo_cont_reg20,	fifo_cont_reg21,	fifo_cont_reg22,	fifo_cont_reg23,	fifo_cont_reg24,	fifo_cont_reg25,	fifo_cont_reg26,	fifo_cont_reg27,	fifo_cont_reg28,	fifo_cont_reg29,	fifo_cont_reg30,	fifo_cont_reg31,	fifo_cont_reg32,	fifo_cont_reg33,	fifo_cont_reg34,	fifo_cont_reg35,	fifo_cont_reg36,	fifo_cont_reg37,	fifo_cont_reg38,	fifo_cont_reg39,	fifo_cont_reg40,	fifo_cont_reg41,	fifo_cont_reg42,	fifo_cont_reg43,	fifo_cont_reg44,	fifo_cont_reg45,	fifo_cont_reg46,	fifo_cont_reg47,	fifo_cont_reg48,	fifo_cont_reg49,	fifo_cont_reg50,	fifo_cont_reg51,	fifo_cont_reg52,	fifo_cont_reg53,	fifo_cont_reg54,	fifo_cont_reg55,	fifo_cont_reg56,	fifo_cont_reg57,	fifo_cont_reg58,	fifo_cont_reg59,	fifo_cont_reg60,	fifo_cont_reg61,	fifo_cont_reg62,	fifo_cont_reg63,	fifo_cont_reg64,	fifo_cont_reg65,	fifo_cont_reg66,	fifo_cont_reg67,	fifo_cont_reg68,	fifo_cont_reg69,	fifo_cont_reg70,	fifo_cont_reg71,	fifo_cont_reg72,	fifo_cont_reg73,	fifo_cont_reg74,	fifo_cont_reg75,	fifo_cont_reg76,	fifo_cont_reg77,	fifo_cont_reg78,	fifo_cont_reg79} <= 	{fifo_cont0,	fifo_cont1,	fifo_cont2,	fifo_cont3,	fifo_cont4,	fifo_cont5,	fifo_cont6,	fifo_cont7,	fifo_cont8,	fifo_cont9,	fifo_cont10,	fifo_cont11,	fifo_cont12,	fifo_cont13,	fifo_cont14,	fifo_cont15,	fifo_cont16,	fifo_cont17,	fifo_cont18,	fifo_cont19,	fifo_cont20,	fifo_cont21,	fifo_cont22,	fifo_cont23,	fifo_cont24,	fifo_cont25,	fifo_cont26,	fifo_cont27,	fifo_cont28,	fifo_cont29,	fifo_cont30,	fifo_cont31,	fifo_cont32,	fifo_cont33,	fifo_cont34,	fifo_cont35,	fifo_cont36,	fifo_cont37,	fifo_cont38,	fifo_cont39,	fifo_cont40,	fifo_cont41,	fifo_cont42,	fifo_cont43,	fifo_cont44,	fifo_cont45,	fifo_cont46,	fifo_cont47,	fifo_cont48,	fifo_cont49,	fifo_cont50,	fifo_cont51,	fifo_cont52,	fifo_cont53,	fifo_cont54,	fifo_cont55,	fifo_cont56,	fifo_cont57,	fifo_cont58,	fifo_cont59,	fifo_cont60,	fifo_cont61,	fifo_cont62,	fifo_cont63,	fifo_cont64,	fifo_cont65,	fifo_cont66,	fifo_cont67,	fifo_cont68,	fifo_cont69,	fifo_cont70,	fifo_cont71,	fifo_cont72,	fifo_cont73,	fifo_cont74,	fifo_cont75,	fifo_cont76,	fifo_cont77,	fifo_cont78,	fifo_cont79};
				rd_state <= 162 ;
				w_cont256 <= 0;
			end
			162:	begin if (rd_state_r !=rd_state ) begin wt_compensator <= 4 - fifo_cont_reg0 [1:0] ;ps_ddr_wr_addr <= r_data ;if (|fifo_cont_reg0 ) begin w_cont256 <= 1;rd_en0  <=1;ps_ddr_wr_start <= 1; if (|fifo_cont_reg0 [1:0]) begin ps_ddr_wr_length <= {fifo_cont_reg0 [7:2],4'b0} + 16; end else begin ps_ddr_wr_length <= {fifo_cont_reg0 [7:2],4'b0} ;end	end	end	else	begin	r_addr <= 1 ;ps_ddr_wr_start <= 0;ps_ddr_wr_en <= valid0  | (! ps_ddr_wr_finish)  ;ps_ddr_wr_data <=    rd_data0   ;if (ps_ddr_wr_finish)	begin rd_state <= rd_state + 1;w_cont256 <= 0;rd_en0 <=  0;end else if (w_cont256 < fifo_cont_reg0 ) begin	w_cont256 <= w_cont256 + 1;rd_en0  <=1;end else	rd_en0  <= 0;	end	end
			163:	begin if (rd_state_r !=rd_state ) begin wt_compensator <= 4 - fifo_cont_reg1 [1:0] ;ps_ddr_wr_addr <= r_data ;if (|fifo_cont_reg1 ) begin w_cont256 <= 1;rd_en1  <=1;ps_ddr_wr_start <= 1; if (|fifo_cont_reg1 [1:0]) begin ps_ddr_wr_length <= {fifo_cont_reg1 [7:2],4'b0} + 16; end else begin ps_ddr_wr_length <= {fifo_cont_reg1 [7:2],4'b0} ;end	end	end	else	begin	r_addr <= 2 ;ps_ddr_wr_start <= 0;ps_ddr_wr_en <= valid1  | (! ps_ddr_wr_finish)  ;ps_ddr_wr_data <=    rd_data1   ;if (ps_ddr_wr_finish)	begin rd_state <= rd_state + 1;w_cont256 <= 0;rd_en1 <=  0;end else if (w_cont256 < fifo_cont_reg1 ) begin	w_cont256 <= w_cont256 + 1;rd_en0  <=1;end else	rd_en1  <= 0;	end	end
			164:	begin if (rd_state_r !=rd_state ) begin wt_compensator <= 4 - fifo_cont_reg2 [1:0] ;ps_ddr_wr_addr <= r_data ;if (|fifo_cont_reg2 ) begin w_cont256 <= 1;rd_en2  <=1;ps_ddr_wr_start <= 1; if (|fifo_cont_reg2 [1:0]) begin ps_ddr_wr_length <= {fifo_cont_reg2 [7:2],4'b0} + 16; end else begin ps_ddr_wr_length <= {fifo_cont_reg2 [7:2],4'b0} ;end	end	end	else	begin	r_addr <= 3 ;ps_ddr_wr_start <= 0;ps_ddr_wr_en <= valid2  | (! ps_ddr_wr_finish)  ;ps_ddr_wr_data <=    rd_data2   ;if (ps_ddr_wr_finish)	begin rd_state <= rd_state + 1;w_cont256 <= 0;rd_en2 <=  0;end else if (w_cont256 < fifo_cont_reg2 ) begin	w_cont256 <= w_cont256 + 1;rd_en0  <=1;end else	rd_en2  <= 0;	end	end
			165:	begin if (rd_state_r !=rd_state ) begin wt_compensator <= 4 - fifo_cont_reg3 [1:0] ;ps_ddr_wr_addr <= r_data ;if (|fifo_cont_reg3 ) begin w_cont256 <= 1;rd_en3  <=1;ps_ddr_wr_start <= 1; if (|fifo_cont_reg3 [1:0]) begin ps_ddr_wr_length <= {fifo_cont_reg3 [7:2],4'b0} + 16; end else begin ps_ddr_wr_length <= {fifo_cont_reg3 [7:2],4'b0} ;end	end	end	else	begin	r_addr <= 4 ;ps_ddr_wr_start <= 0;ps_ddr_wr_en <= valid3  | (! ps_ddr_wr_finish)  ;ps_ddr_wr_data <=    rd_data3   ;if (ps_ddr_wr_finish)	begin rd_state <= rd_state + 1;w_cont256 <= 0;rd_en3 <=  0;end else if (w_cont256 < fifo_cont_reg3 ) begin	w_cont256 <= w_cont256 + 1;rd_en0  <=1;end else	rd_en3  <= 0;	end	end
			166:	begin if (rd_state_r !=rd_state ) begin wt_compensator <= 4 - fifo_cont_reg4 [1:0] ;ps_ddr_wr_addr <= r_data ;if (|fifo_cont_reg4 ) begin w_cont256 <= 1;rd_en4  <=1;ps_ddr_wr_start <= 1; if (|fifo_cont_reg4 [1:0]) begin ps_ddr_wr_length <= {fifo_cont_reg4 [7:2],4'b0} + 16; end else begin ps_ddr_wr_length <= {fifo_cont_reg4 [7:2],4'b0} ;end	end	end	else	begin	r_addr <= 5 ;ps_ddr_wr_start <= 0;ps_ddr_wr_en <= valid4  | (! ps_ddr_wr_finish)  ;ps_ddr_wr_data <=    rd_data4   ;if (ps_ddr_wr_finish)	begin rd_state <= rd_state + 1;w_cont256 <= 0;rd_en4 <=  0;end else if (w_cont256 < fifo_cont_reg4 ) begin	w_cont256 <= w_cont256 + 1;rd_en0  <=1;end else	rd_en4  <= 0;	end	end
			167:	begin if (rd_state_r !=rd_state ) begin wt_compensator <= 4 - fifo_cont_reg5 [1:0] ;ps_ddr_wr_addr <= r_data ;if (|fifo_cont_reg5 ) begin w_cont256 <= 1;rd_en5  <=1;ps_ddr_wr_start <= 1; if (|fifo_cont_reg5 [1:0]) begin ps_ddr_wr_length <= {fifo_cont_reg5 [7:2],4'b0} + 16; end else begin ps_ddr_wr_length <= {fifo_cont_reg5 [7:2],4'b0} ;end	end	end	else	begin	r_addr <= 6 ;ps_ddr_wr_start <= 0;ps_ddr_wr_en <= valid5  | (! ps_ddr_wr_finish)  ;ps_ddr_wr_data <=    rd_data5   ;if (ps_ddr_wr_finish)	begin rd_state <= rd_state + 1;w_cont256 <= 0;rd_en5 <=  0;end else if (w_cont256 < fifo_cont_reg5 ) begin	w_cont256 <= w_cont256 + 1;rd_en0  <=1;end else	rd_en5  <= 0;	end	end
			168:	begin if (rd_state_r !=rd_state ) begin wt_compensator <= 4 - fifo_cont_reg6 [1:0] ;ps_ddr_wr_addr <= r_data ;if (|fifo_cont_reg6 ) begin w_cont256 <= 1;rd_en6  <=1;ps_ddr_wr_start <= 1; if (|fifo_cont_reg6 [1:0]) begin ps_ddr_wr_length <= {fifo_cont_reg6 [7:2],4'b0} + 16; end else begin ps_ddr_wr_length <= {fifo_cont_reg6 [7:2],4'b0} ;end	end	end	else	begin	r_addr <= 7 ;ps_ddr_wr_start <= 0;ps_ddr_wr_en <= valid6  | (! ps_ddr_wr_finish)  ;ps_ddr_wr_data <=    rd_data6   ;if (ps_ddr_wr_finish)	begin rd_state <= rd_state + 1;w_cont256 <= 0;rd_en6 <=  0;end else if (w_cont256 < fifo_cont_reg6 ) begin	w_cont256 <= w_cont256 + 1;rd_en0  <=1;end else	rd_en6  <= 0;	end	end
			169:	begin if (rd_state_r !=rd_state ) begin wt_compensator <= 4 - fifo_cont_reg7 [1:0] ;ps_ddr_wr_addr <= r_data ;if (|fifo_cont_reg7 ) begin w_cont256 <= 1;rd_en7  <=1;ps_ddr_wr_start <= 1; if (|fifo_cont_reg7 [1:0]) begin ps_ddr_wr_length <= {fifo_cont_reg7 [7:2],4'b0} + 16; end else begin ps_ddr_wr_length <= {fifo_cont_reg7 [7:2],4'b0} ;end	end	end	else	begin	r_addr <= 8 ;ps_ddr_wr_start <= 0;ps_ddr_wr_en <= valid7  | (! ps_ddr_wr_finish)  ;ps_ddr_wr_data <=    rd_data7   ;if (ps_ddr_wr_finish)	begin rd_state <= rd_state + 1;w_cont256 <= 0;rd_en7 <=  0;end else if (w_cont256 < fifo_cont_reg7 ) begin	w_cont256 <= w_cont256 + 1;rd_en0  <=1;end else	rd_en7  <= 0;	end	end
			170:	begin if (rd_state_r !=rd_state ) begin wt_compensator <= 4 - fifo_cont_reg8 [1:0] ;ps_ddr_wr_addr <= r_data ;if (|fifo_cont_reg8 ) begin w_cont256 <= 1;rd_en8  <=1;ps_ddr_wr_start <= 1; if (|fifo_cont_reg8 [1:0]) begin ps_ddr_wr_length <= {fifo_cont_reg8 [7:2],4'b0} + 16; end else begin ps_ddr_wr_length <= {fifo_cont_reg8 [7:2],4'b0} ;end	end	end	else	begin	r_addr <= 9 ;ps_ddr_wr_start <= 0;ps_ddr_wr_en <= valid8  | (! ps_ddr_wr_finish)  ;ps_ddr_wr_data <=    rd_data8   ;if (ps_ddr_wr_finish)	begin rd_state <= rd_state + 1;w_cont256 <= 0;rd_en8 <=  0;end else if (w_cont256 < fifo_cont_reg8 ) begin	w_cont256 <= w_cont256 + 1;rd_en0  <=1;end else	rd_en8  <= 0;	end	end
			171:	begin if (rd_state_r !=rd_state ) begin wt_compensator <= 4 - fifo_cont_reg9 [1:0] ;ps_ddr_wr_addr <= r_data ;if (|fifo_cont_reg9 ) begin w_cont256 <= 1;rd_en9  <=1;ps_ddr_wr_start <= 1; if (|fifo_cont_reg9 [1:0]) begin ps_ddr_wr_length <= {fifo_cont_reg9 [7:2],4'b0} + 16; end else begin ps_ddr_wr_length <= {fifo_cont_reg9 [7:2],4'b0} ;end	end	end	else	begin	r_addr <= 10;ps_ddr_wr_start <= 0;ps_ddr_wr_en <= valid9  | (! ps_ddr_wr_finish)  ;ps_ddr_wr_data <=    rd_data9   ;if (ps_ddr_wr_finish)	begin rd_state <= rd_state + 1;w_cont256 <= 0;rd_en9 <=  0;end else if (w_cont256 < fifo_cont_reg9 ) begin	w_cont256 <= w_cont256 + 1;rd_en0  <=1;end else	rd_en9  <= 0;	end	end
			172:	begin if (rd_state_r !=rd_state ) begin wt_compensator <= 4 - fifo_cont_reg10 [1:0];ps_ddr_wr_addr <= r_data ;if (|fifo_cont_reg10) begin w_cont256 <= 1;rd_en10 <=1;ps_ddr_wr_start <= 1; if (|fifo_cont_reg10[1:0]) begin ps_ddr_wr_length <= {fifo_cont_reg10[7:2],4'b0} + 16; end else begin ps_ddr_wr_length <= {fifo_cont_reg10[7:2],4'b0} ;end	end	end	else	begin	r_addr <= 11;ps_ddr_wr_start <= 0;ps_ddr_wr_en <= valid10 | (! ps_ddr_wr_finish)  ;ps_ddr_wr_data <=    rd_data10  ;if (ps_ddr_wr_finish)	begin rd_state <= rd_state + 1;w_cont256 <= 0;rd_en10 <= 0;end else if (w_cont256 < fifo_cont_reg10) begin	w_cont256 <= w_cont256 + 1;rd_en0  <=1;end else	rd_en10 <= 0;	end	end
			173:	begin if (rd_state_r !=rd_state ) begin wt_compensator <= 4 - fifo_cont_reg11 [1:0];ps_ddr_wr_addr <= r_data ;if (|fifo_cont_reg11) begin w_cont256 <= 1;rd_en11 <=1;ps_ddr_wr_start <= 1; if (|fifo_cont_reg11[1:0]) begin ps_ddr_wr_length <= {fifo_cont_reg11[7:2],4'b0} + 16; end else begin ps_ddr_wr_length <= {fifo_cont_reg11[7:2],4'b0} ;end	end	end	else	begin	r_addr <= 12;ps_ddr_wr_start <= 0;ps_ddr_wr_en <= valid11 | (! ps_ddr_wr_finish)  ;ps_ddr_wr_data <=    rd_data11  ;if (ps_ddr_wr_finish)	begin rd_state <= rd_state + 1;w_cont256 <= 0;rd_en11 <= 0;end else if (w_cont256 < fifo_cont_reg11) begin	w_cont256 <= w_cont256 + 1;rd_en0  <=1;end else	rd_en11 <= 0;	end	end
			174:	begin if (rd_state_r !=rd_state ) begin wt_compensator <= 4 - fifo_cont_reg12 [1:0];ps_ddr_wr_addr <= r_data ;if (|fifo_cont_reg12) begin w_cont256 <= 1;rd_en12 <=1;ps_ddr_wr_start <= 1; if (|fifo_cont_reg12[1:0]) begin ps_ddr_wr_length <= {fifo_cont_reg12[7:2],4'b0} + 16; end else begin ps_ddr_wr_length <= {fifo_cont_reg12[7:2],4'b0} ;end	end	end	else	begin	r_addr <= 13;ps_ddr_wr_start <= 0;ps_ddr_wr_en <= valid12 | (! ps_ddr_wr_finish)  ;ps_ddr_wr_data <=    rd_data12  ;if (ps_ddr_wr_finish)	begin rd_state <= rd_state + 1;w_cont256 <= 0;rd_en12 <= 0;end else if (w_cont256 < fifo_cont_reg12) begin	w_cont256 <= w_cont256 + 1;rd_en0  <=1;end else	rd_en12 <= 0;	end	end
			175:	begin if (rd_state_r !=rd_state ) begin wt_compensator <= 4 - fifo_cont_reg13 [1:0];ps_ddr_wr_addr <= r_data ;if (|fifo_cont_reg13) begin w_cont256 <= 1;rd_en13 <=1;ps_ddr_wr_start <= 1; if (|fifo_cont_reg13[1:0]) begin ps_ddr_wr_length <= {fifo_cont_reg13[7:2],4'b0} + 16; end else begin ps_ddr_wr_length <= {fifo_cont_reg13[7:2],4'b0} ;end	end	end	else	begin	r_addr <= 14;ps_ddr_wr_start <= 0;ps_ddr_wr_en <= valid13 | (! ps_ddr_wr_finish)  ;ps_ddr_wr_data <=    rd_data13  ;if (ps_ddr_wr_finish)	begin rd_state <= rd_state + 1;w_cont256 <= 0;rd_en13 <= 0;end else if (w_cont256 < fifo_cont_reg13) begin	w_cont256 <= w_cont256 + 1;rd_en0  <=1;end else	rd_en13 <= 0;	end	end
			176:	begin if (rd_state_r !=rd_state ) begin wt_compensator <= 4 - fifo_cont_reg14 [1:0];ps_ddr_wr_addr <= r_data ;if (|fifo_cont_reg14) begin w_cont256 <= 1;rd_en14 <=1;ps_ddr_wr_start <= 1; if (|fifo_cont_reg14[1:0]) begin ps_ddr_wr_length <= {fifo_cont_reg14[7:2],4'b0} + 16; end else begin ps_ddr_wr_length <= {fifo_cont_reg14[7:2],4'b0} ;end	end	end	else	begin	r_addr <= 15;ps_ddr_wr_start <= 0;ps_ddr_wr_en <= valid14 | (! ps_ddr_wr_finish)  ;ps_ddr_wr_data <=    rd_data14  ;if (ps_ddr_wr_finish)	begin rd_state <= rd_state + 1;w_cont256 <= 0;rd_en14 <= 0;end else if (w_cont256 < fifo_cont_reg14) begin	w_cont256 <= w_cont256 + 1;rd_en0  <=1;end else	rd_en14 <= 0;	end	end
			177:	begin if (rd_state_r !=rd_state ) begin wt_compensator <= 4 - fifo_cont_reg15 [1:0];ps_ddr_wr_addr <= r_data ;if (|fifo_cont_reg15) begin w_cont256 <= 1;rd_en15 <=1;ps_ddr_wr_start <= 1; if (|fifo_cont_reg15[1:0]) begin ps_ddr_wr_length <= {fifo_cont_reg15[7:2],4'b0} + 16; end else begin ps_ddr_wr_length <= {fifo_cont_reg15[7:2],4'b0} ;end	end	end	else	begin	r_addr <= 16;ps_ddr_wr_start <= 0;ps_ddr_wr_en <= valid15 | (! ps_ddr_wr_finish)  ;ps_ddr_wr_data <=    rd_data15  ;if (ps_ddr_wr_finish)	begin rd_state <= rd_state + 1;w_cont256 <= 0;rd_en15 <= 0;end else if (w_cont256 < fifo_cont_reg15) begin	w_cont256 <= w_cont256 + 1;rd_en0  <=1;end else	rd_en15 <= 0;	end	end
			178:	begin if (rd_state_r !=rd_state ) begin wt_compensator <= 4 - fifo_cont_reg16 [1:0];ps_ddr_wr_addr <= r_data ;if (|fifo_cont_reg16) begin w_cont256 <= 1;rd_en16 <=1;ps_ddr_wr_start <= 1; if (|fifo_cont_reg16[1:0]) begin ps_ddr_wr_length <= {fifo_cont_reg16[7:2],4'b0} + 16; end else begin ps_ddr_wr_length <= {fifo_cont_reg16[7:2],4'b0} ;end	end	end	else	begin	r_addr <= 17;ps_ddr_wr_start <= 0;ps_ddr_wr_en <= valid16 | (! ps_ddr_wr_finish)  ;ps_ddr_wr_data <=    rd_data16  ;if (ps_ddr_wr_finish)	begin rd_state <= rd_state + 1;w_cont256 <= 0;rd_en16 <= 0;end else if (w_cont256 < fifo_cont_reg16) begin	w_cont256 <= w_cont256 + 1;rd_en0  <=1;end else	rd_en16 <= 0;	end	end
			179:	begin if (rd_state_r !=rd_state ) begin wt_compensator <= 4 - fifo_cont_reg17 [1:0];ps_ddr_wr_addr <= r_data ;if (|fifo_cont_reg17) begin w_cont256 <= 1;rd_en17 <=1;ps_ddr_wr_start <= 1; if (|fifo_cont_reg17[1:0]) begin ps_ddr_wr_length <= {fifo_cont_reg17[7:2],4'b0} + 16; end else begin ps_ddr_wr_length <= {fifo_cont_reg17[7:2],4'b0} ;end	end	end	else	begin	r_addr <= 18;ps_ddr_wr_start <= 0;ps_ddr_wr_en <= valid17 | (! ps_ddr_wr_finish)  ;ps_ddr_wr_data <=    rd_data17  ;if (ps_ddr_wr_finish)	begin rd_state <= rd_state + 1;w_cont256 <= 0;rd_en17 <= 0;end else if (w_cont256 < fifo_cont_reg17) begin	w_cont256 <= w_cont256 + 1;rd_en0  <=1;end else	rd_en17 <= 0;	end	end
			180:	begin if (rd_state_r !=rd_state ) begin wt_compensator <= 4 - fifo_cont_reg18 [1:0];ps_ddr_wr_addr <= r_data ;if (|fifo_cont_reg18) begin w_cont256 <= 1;rd_en18 <=1;ps_ddr_wr_start <= 1; if (|fifo_cont_reg18[1:0]) begin ps_ddr_wr_length <= {fifo_cont_reg18[7:2],4'b0} + 16; end else begin ps_ddr_wr_length <= {fifo_cont_reg18[7:2],4'b0} ;end	end	end	else	begin	r_addr <= 19;ps_ddr_wr_start <= 0;ps_ddr_wr_en <= valid18 | (! ps_ddr_wr_finish)  ;ps_ddr_wr_data <=    rd_data18  ;if (ps_ddr_wr_finish)	begin rd_state <= rd_state + 1;w_cont256 <= 0;rd_en18 <= 0;end else if (w_cont256 < fifo_cont_reg18) begin	w_cont256 <= w_cont256 + 1;rd_en0  <=1;end else	rd_en18 <= 0;	end	end
			181:	begin if (rd_state_r !=rd_state ) begin wt_compensator <= 4 - fifo_cont_reg19 [1:0];ps_ddr_wr_addr <= r_data ;if (|fifo_cont_reg19) begin w_cont256 <= 1;rd_en19 <=1;ps_ddr_wr_start <= 1; if (|fifo_cont_reg19[1:0]) begin ps_ddr_wr_length <= {fifo_cont_reg19[7:2],4'b0} + 16; end else begin ps_ddr_wr_length <= {fifo_cont_reg19[7:2],4'b0} ;end	end	end	else	begin	r_addr <= 20;ps_ddr_wr_start <= 0;ps_ddr_wr_en <= valid19 | (! ps_ddr_wr_finish)  ;ps_ddr_wr_data <=    rd_data19  ;if (ps_ddr_wr_finish)	begin rd_state <= rd_state + 1;w_cont256 <= 0;rd_en19 <= 0;end else if (w_cont256 < fifo_cont_reg19) begin	w_cont256 <= w_cont256 + 1;rd_en0  <=1;end else	rd_en19 <= 0;	end	end
			182:	begin if (rd_state_r !=rd_state ) begin wt_compensator <= 4 - fifo_cont_reg20 [1:0];ps_ddr_wr_addr <= r_data ;if (|fifo_cont_reg20) begin w_cont256 <= 1;rd_en20 <=1;ps_ddr_wr_start <= 1; if (|fifo_cont_reg20[1:0]) begin ps_ddr_wr_length <= {fifo_cont_reg20[7:2],4'b0} + 16; end else begin ps_ddr_wr_length <= {fifo_cont_reg20[7:2],4'b0} ;end	end	end	else	begin	r_addr <= 21;ps_ddr_wr_start <= 0;ps_ddr_wr_en <= valid20 | (! ps_ddr_wr_finish)  ;ps_ddr_wr_data <=    rd_data20  ;if (ps_ddr_wr_finish)	begin rd_state <= rd_state + 1;w_cont256 <= 0;rd_en20 <= 0;end else if (w_cont256 < fifo_cont_reg20) begin	w_cont256 <= w_cont256 + 1;rd_en0  <=1;end else	rd_en20 <= 0;	end	end
			183:	begin if (rd_state_r !=rd_state ) begin wt_compensator <= 4 - fifo_cont_reg21 [1:0];ps_ddr_wr_addr <= r_data ;if (|fifo_cont_reg21) begin w_cont256 <= 1;rd_en21 <=1;ps_ddr_wr_start <= 1; if (|fifo_cont_reg21[1:0]) begin ps_ddr_wr_length <= {fifo_cont_reg21[7:2],4'b0} + 16; end else begin ps_ddr_wr_length <= {fifo_cont_reg21[7:2],4'b0} ;end	end	end	else	begin	r_addr <= 22;ps_ddr_wr_start <= 0;ps_ddr_wr_en <= valid21 | (! ps_ddr_wr_finish)  ;ps_ddr_wr_data <=    rd_data21  ;if (ps_ddr_wr_finish)	begin rd_state <= rd_state + 1;w_cont256 <= 0;rd_en21 <= 0;end else if (w_cont256 < fifo_cont_reg21) begin	w_cont256 <= w_cont256 + 1;rd_en0  <=1;end else	rd_en21 <= 0;	end	end
			184:	begin if (rd_state_r !=rd_state ) begin wt_compensator <= 4 - fifo_cont_reg22 [1:0];ps_ddr_wr_addr <= r_data ;if (|fifo_cont_reg22) begin w_cont256 <= 1;rd_en22 <=1;ps_ddr_wr_start <= 1; if (|fifo_cont_reg22[1:0]) begin ps_ddr_wr_length <= {fifo_cont_reg22[7:2],4'b0} + 16; end else begin ps_ddr_wr_length <= {fifo_cont_reg22[7:2],4'b0} ;end	end	end	else	begin	r_addr <= 23;ps_ddr_wr_start <= 0;ps_ddr_wr_en <= valid22 | (! ps_ddr_wr_finish)  ;ps_ddr_wr_data <=    rd_data22  ;if (ps_ddr_wr_finish)	begin rd_state <= rd_state + 1;w_cont256 <= 0;rd_en22 <= 0;end else if (w_cont256 < fifo_cont_reg22) begin	w_cont256 <= w_cont256 + 1;rd_en0  <=1;end else	rd_en22 <= 0;	end	end
			185:	begin if (rd_state_r !=rd_state ) begin wt_compensator <= 4 - fifo_cont_reg23 [1:0];ps_ddr_wr_addr <= r_data ;if (|fifo_cont_reg23) begin w_cont256 <= 1;rd_en23 <=1;ps_ddr_wr_start <= 1; if (|fifo_cont_reg23[1:0]) begin ps_ddr_wr_length <= {fifo_cont_reg23[7:2],4'b0} + 16; end else begin ps_ddr_wr_length <= {fifo_cont_reg23[7:2],4'b0} ;end	end	end	else	begin	r_addr <= 24;ps_ddr_wr_start <= 0;ps_ddr_wr_en <= valid23 | (! ps_ddr_wr_finish)  ;ps_ddr_wr_data <=    rd_data23  ;if (ps_ddr_wr_finish)	begin rd_state <= rd_state + 1;w_cont256 <= 0;rd_en23 <= 0;end else if (w_cont256 < fifo_cont_reg23) begin	w_cont256 <= w_cont256 + 1;rd_en0  <=1;end else	rd_en23 <= 0;	end	end
			186:	begin if (rd_state_r !=rd_state ) begin wt_compensator <= 4 - fifo_cont_reg24 [1:0];ps_ddr_wr_addr <= r_data ;if (|fifo_cont_reg24) begin w_cont256 <= 1;rd_en24 <=1;ps_ddr_wr_start <= 1; if (|fifo_cont_reg24[1:0]) begin ps_ddr_wr_length <= {fifo_cont_reg24[7:2],4'b0} + 16; end else begin ps_ddr_wr_length <= {fifo_cont_reg24[7:2],4'b0} ;end	end	end	else	begin	r_addr <= 25;ps_ddr_wr_start <= 0;ps_ddr_wr_en <= valid24 | (! ps_ddr_wr_finish)  ;ps_ddr_wr_data <=    rd_data24  ;if (ps_ddr_wr_finish)	begin rd_state <= rd_state + 1;w_cont256 <= 0;rd_en24 <= 0;end else if (w_cont256 < fifo_cont_reg24) begin	w_cont256 <= w_cont256 + 1;rd_en0  <=1;end else	rd_en24 <= 0;	end	end
			187:	begin if (rd_state_r !=rd_state ) begin wt_compensator <= 4 - fifo_cont_reg25 [1:0];ps_ddr_wr_addr <= r_data ;if (|fifo_cont_reg25) begin w_cont256 <= 1;rd_en25 <=1;ps_ddr_wr_start <= 1; if (|fifo_cont_reg25[1:0]) begin ps_ddr_wr_length <= {fifo_cont_reg25[7:2],4'b0} + 16; end else begin ps_ddr_wr_length <= {fifo_cont_reg25[7:2],4'b0} ;end	end	end	else	begin	r_addr <= 26;ps_ddr_wr_start <= 0;ps_ddr_wr_en <= valid25 | (! ps_ddr_wr_finish)  ;ps_ddr_wr_data <=    rd_data25  ;if (ps_ddr_wr_finish)	begin rd_state <= rd_state + 1;w_cont256 <= 0;rd_en25 <= 0;end else if (w_cont256 < fifo_cont_reg25) begin	w_cont256 <= w_cont256 + 1;rd_en0  <=1;end else	rd_en25 <= 0;	end	end
			188:	begin if (rd_state_r !=rd_state ) begin wt_compensator <= 4 - fifo_cont_reg26 [1:0];ps_ddr_wr_addr <= r_data ;if (|fifo_cont_reg26) begin w_cont256 <= 1;rd_en26 <=1;ps_ddr_wr_start <= 1; if (|fifo_cont_reg26[1:0]) begin ps_ddr_wr_length <= {fifo_cont_reg26[7:2],4'b0} + 16; end else begin ps_ddr_wr_length <= {fifo_cont_reg26[7:2],4'b0} ;end	end	end	else	begin	r_addr <= 27;ps_ddr_wr_start <= 0;ps_ddr_wr_en <= valid26 | (! ps_ddr_wr_finish)  ;ps_ddr_wr_data <=    rd_data26  ;if (ps_ddr_wr_finish)	begin rd_state <= rd_state + 1;w_cont256 <= 0;rd_en26 <= 0;end else if (w_cont256 < fifo_cont_reg26) begin	w_cont256 <= w_cont256 + 1;rd_en0  <=1;end else	rd_en26 <= 0;	end	end
			189:	begin if (rd_state_r !=rd_state ) begin wt_compensator <= 4 - fifo_cont_reg27 [1:0];ps_ddr_wr_addr <= r_data ;if (|fifo_cont_reg27) begin w_cont256 <= 1;rd_en27 <=1;ps_ddr_wr_start <= 1; if (|fifo_cont_reg27[1:0]) begin ps_ddr_wr_length <= {fifo_cont_reg27[7:2],4'b0} + 16; end else begin ps_ddr_wr_length <= {fifo_cont_reg27[7:2],4'b0} ;end	end	end	else	begin	r_addr <= 28;ps_ddr_wr_start <= 0;ps_ddr_wr_en <= valid27 | (! ps_ddr_wr_finish)  ;ps_ddr_wr_data <=    rd_data27  ;if (ps_ddr_wr_finish)	begin rd_state <= rd_state + 1;w_cont256 <= 0;rd_en27 <= 0;end else if (w_cont256 < fifo_cont_reg27) begin	w_cont256 <= w_cont256 + 1;rd_en0  <=1;end else	rd_en27 <= 0;	end	end
			190:	begin if (rd_state_r !=rd_state ) begin wt_compensator <= 4 - fifo_cont_reg28 [1:0];ps_ddr_wr_addr <= r_data ;if (|fifo_cont_reg28) begin w_cont256 <= 1;rd_en28 <=1;ps_ddr_wr_start <= 1; if (|fifo_cont_reg28[1:0]) begin ps_ddr_wr_length <= {fifo_cont_reg28[7:2],4'b0} + 16; end else begin ps_ddr_wr_length <= {fifo_cont_reg28[7:2],4'b0} ;end	end	end	else	begin	r_addr <= 29;ps_ddr_wr_start <= 0;ps_ddr_wr_en <= valid28 | (! ps_ddr_wr_finish)  ;ps_ddr_wr_data <=    rd_data28  ;if (ps_ddr_wr_finish)	begin rd_state <= rd_state + 1;w_cont256 <= 0;rd_en28 <= 0;end else if (w_cont256 < fifo_cont_reg28) begin	w_cont256 <= w_cont256 + 1;rd_en0  <=1;end else	rd_en28 <= 0;	end	end
			191:	begin if (rd_state_r !=rd_state ) begin wt_compensator <= 4 - fifo_cont_reg29 [1:0];ps_ddr_wr_addr <= r_data ;if (|fifo_cont_reg29) begin w_cont256 <= 1;rd_en29 <=1;ps_ddr_wr_start <= 1; if (|fifo_cont_reg29[1:0]) begin ps_ddr_wr_length <= {fifo_cont_reg29[7:2],4'b0} + 16; end else begin ps_ddr_wr_length <= {fifo_cont_reg29[7:2],4'b0} ;end	end	end	else	begin	r_addr <= 30;ps_ddr_wr_start <= 0;ps_ddr_wr_en <= valid29 | (! ps_ddr_wr_finish)  ;ps_ddr_wr_data <=    rd_data29  ;if (ps_ddr_wr_finish)	begin rd_state <= rd_state + 1;w_cont256 <= 0;rd_en29 <= 0;end else if (w_cont256 < fifo_cont_reg29) begin	w_cont256 <= w_cont256 + 1;rd_en0  <=1;end else	rd_en29 <= 0;	end	end
			192:	begin if (rd_state_r !=rd_state ) begin wt_compensator <= 4 - fifo_cont_reg30 [1:0];ps_ddr_wr_addr <= r_data ;if (|fifo_cont_reg30) begin w_cont256 <= 1;rd_en30 <=1;ps_ddr_wr_start <= 1; if (|fifo_cont_reg30[1:0]) begin ps_ddr_wr_length <= {fifo_cont_reg30[7:2],4'b0} + 16; end else begin ps_ddr_wr_length <= {fifo_cont_reg30[7:2],4'b0} ;end	end	end	else	begin	r_addr <= 31;ps_ddr_wr_start <= 0;ps_ddr_wr_en <= valid30 | (! ps_ddr_wr_finish)  ;ps_ddr_wr_data <=    rd_data30  ;if (ps_ddr_wr_finish)	begin rd_state <= rd_state + 1;w_cont256 <= 0;rd_en30 <= 0;end else if (w_cont256 < fifo_cont_reg30) begin	w_cont256 <= w_cont256 + 1;rd_en0  <=1;end else	rd_en30 <= 0;	end	end
			193:	begin if (rd_state_r !=rd_state ) begin wt_compensator <= 4 - fifo_cont_reg31 [1:0];ps_ddr_wr_addr <= r_data ;if (|fifo_cont_reg31) begin w_cont256 <= 1;rd_en31 <=1;ps_ddr_wr_start <= 1; if (|fifo_cont_reg31[1:0]) begin ps_ddr_wr_length <= {fifo_cont_reg31[7:2],4'b0} + 16; end else begin ps_ddr_wr_length <= {fifo_cont_reg31[7:2],4'b0} ;end	end	end	else	begin	r_addr <= 32;ps_ddr_wr_start <= 0;ps_ddr_wr_en <= valid31 | (! ps_ddr_wr_finish)  ;ps_ddr_wr_data <=    rd_data31  ;if (ps_ddr_wr_finish)	begin rd_state <= rd_state + 1;w_cont256 <= 0;rd_en31 <= 0;end else if (w_cont256 < fifo_cont_reg31) begin	w_cont256 <= w_cont256 + 1;rd_en0  <=1;end else	rd_en31 <= 0;	end	end
			194:	begin if (rd_state_r !=rd_state ) begin wt_compensator <= 4 - fifo_cont_reg32 [1:0];ps_ddr_wr_addr <= r_data ;if (|fifo_cont_reg32) begin w_cont256 <= 1;rd_en32 <=1;ps_ddr_wr_start <= 1; if (|fifo_cont_reg32[1:0]) begin ps_ddr_wr_length <= {fifo_cont_reg32[7:2],4'b0} + 16; end else begin ps_ddr_wr_length <= {fifo_cont_reg32[7:2],4'b0} ;end	end	end	else	begin	r_addr <= 33;ps_ddr_wr_start <= 0;ps_ddr_wr_en <= valid32 | (! ps_ddr_wr_finish)  ;ps_ddr_wr_data <=    rd_data32  ;if (ps_ddr_wr_finish)	begin rd_state <= rd_state + 1;w_cont256 <= 0;rd_en32 <= 0;end else if (w_cont256 < fifo_cont_reg32) begin	w_cont256 <= w_cont256 + 1;rd_en0  <=1;end else	rd_en32 <= 0;	end	end
			195:	begin if (rd_state_r !=rd_state ) begin wt_compensator <= 4 - fifo_cont_reg33 [1:0];ps_ddr_wr_addr <= r_data ;if (|fifo_cont_reg33) begin w_cont256 <= 1;rd_en33 <=1;ps_ddr_wr_start <= 1; if (|fifo_cont_reg33[1:0]) begin ps_ddr_wr_length <= {fifo_cont_reg33[7:2],4'b0} + 16; end else begin ps_ddr_wr_length <= {fifo_cont_reg33[7:2],4'b0} ;end	end	end	else	begin	r_addr <= 34;ps_ddr_wr_start <= 0;ps_ddr_wr_en <= valid33 | (! ps_ddr_wr_finish)  ;ps_ddr_wr_data <=    rd_data33  ;if (ps_ddr_wr_finish)	begin rd_state <= rd_state + 1;w_cont256 <= 0;rd_en33 <= 0;end else if (w_cont256 < fifo_cont_reg33) begin	w_cont256 <= w_cont256 + 1;rd_en0  <=1;end else	rd_en33 <= 0;	end	end
			196:	begin if (rd_state_r !=rd_state ) begin wt_compensator <= 4 - fifo_cont_reg34 [1:0];ps_ddr_wr_addr <= r_data ;if (|fifo_cont_reg34) begin w_cont256 <= 1;rd_en34 <=1;ps_ddr_wr_start <= 1; if (|fifo_cont_reg34[1:0]) begin ps_ddr_wr_length <= {fifo_cont_reg34[7:2],4'b0} + 16; end else begin ps_ddr_wr_length <= {fifo_cont_reg34[7:2],4'b0} ;end	end	end	else	begin	r_addr <= 35;ps_ddr_wr_start <= 0;ps_ddr_wr_en <= valid34 | (! ps_ddr_wr_finish)  ;ps_ddr_wr_data <=    rd_data34  ;if (ps_ddr_wr_finish)	begin rd_state <= rd_state + 1;w_cont256 <= 0;rd_en34 <= 0;end else if (w_cont256 < fifo_cont_reg34) begin	w_cont256 <= w_cont256 + 1;rd_en0  <=1;end else	rd_en34 <= 0;	end	end
			197:	begin if (rd_state_r !=rd_state ) begin wt_compensator <= 4 - fifo_cont_reg35 [1:0];ps_ddr_wr_addr <= r_data ;if (|fifo_cont_reg35) begin w_cont256 <= 1;rd_en35 <=1;ps_ddr_wr_start <= 1; if (|fifo_cont_reg35[1:0]) begin ps_ddr_wr_length <= {fifo_cont_reg35[7:2],4'b0} + 16; end else begin ps_ddr_wr_length <= {fifo_cont_reg35[7:2],4'b0} ;end	end	end	else	begin	r_addr <= 36;ps_ddr_wr_start <= 0;ps_ddr_wr_en <= valid35 | (! ps_ddr_wr_finish)  ;ps_ddr_wr_data <=    rd_data35  ;if (ps_ddr_wr_finish)	begin rd_state <= rd_state + 1;w_cont256 <= 0;rd_en35 <= 0;end else if (w_cont256 < fifo_cont_reg35) begin	w_cont256 <= w_cont256 + 1;rd_en0  <=1;end else	rd_en35 <= 0;	end	end
			198:	begin if (rd_state_r !=rd_state ) begin wt_compensator <= 4 - fifo_cont_reg36 [1:0];ps_ddr_wr_addr <= r_data ;if (|fifo_cont_reg36) begin w_cont256 <= 1;rd_en36 <=1;ps_ddr_wr_start <= 1; if (|fifo_cont_reg36[1:0]) begin ps_ddr_wr_length <= {fifo_cont_reg36[7:2],4'b0} + 16; end else begin ps_ddr_wr_length <= {fifo_cont_reg36[7:2],4'b0} ;end	end	end	else	begin	r_addr <= 37;ps_ddr_wr_start <= 0;ps_ddr_wr_en <= valid36 | (! ps_ddr_wr_finish)  ;ps_ddr_wr_data <=    rd_data36  ;if (ps_ddr_wr_finish)	begin rd_state <= rd_state + 1;w_cont256 <= 0;rd_en36 <= 0;end else if (w_cont256 < fifo_cont_reg36) begin	w_cont256 <= w_cont256 + 1;rd_en0  <=1;end else	rd_en36 <= 0;	end	end
			199:	begin if (rd_state_r !=rd_state ) begin wt_compensator <= 4 - fifo_cont_reg37 [1:0];ps_ddr_wr_addr <= r_data ;if (|fifo_cont_reg37) begin w_cont256 <= 1;rd_en37 <=1;ps_ddr_wr_start <= 1; if (|fifo_cont_reg37[1:0]) begin ps_ddr_wr_length <= {fifo_cont_reg37[7:2],4'b0} + 16; end else begin ps_ddr_wr_length <= {fifo_cont_reg37[7:2],4'b0} ;end	end	end	else	begin	r_addr <= 38;ps_ddr_wr_start <= 0;ps_ddr_wr_en <= valid37 | (! ps_ddr_wr_finish)  ;ps_ddr_wr_data <=    rd_data37  ;if (ps_ddr_wr_finish)	begin rd_state <= rd_state + 1;w_cont256 <= 0;rd_en37 <= 0;end else if (w_cont256 < fifo_cont_reg37) begin	w_cont256 <= w_cont256 + 1;rd_en0  <=1;end else	rd_en37 <= 0;	end	end
			200:	begin if (rd_state_r !=rd_state ) begin wt_compensator <= 4 - fifo_cont_reg38 [1:0];ps_ddr_wr_addr <= r_data ;if (|fifo_cont_reg38) begin w_cont256 <= 1;rd_en38 <=1;ps_ddr_wr_start <= 1; if (|fifo_cont_reg38[1:0]) begin ps_ddr_wr_length <= {fifo_cont_reg38[7:2],4'b0} + 16; end else begin ps_ddr_wr_length <= {fifo_cont_reg38[7:2],4'b0} ;end	end	end	else	begin	r_addr <= 39;ps_ddr_wr_start <= 0;ps_ddr_wr_en <= valid38 | (! ps_ddr_wr_finish)  ;ps_ddr_wr_data <=    rd_data38  ;if (ps_ddr_wr_finish)	begin rd_state <= rd_state + 1;w_cont256 <= 0;rd_en38 <= 0;end else if (w_cont256 < fifo_cont_reg38) begin	w_cont256 <= w_cont256 + 1;rd_en0  <=1;end else	rd_en38 <= 0;	end	end
			201:	begin if (rd_state_r !=rd_state ) begin wt_compensator <= 4 - fifo_cont_reg39 [1:0];ps_ddr_wr_addr <= r_data ;if (|fifo_cont_reg39) begin w_cont256 <= 1;rd_en39 <=1;ps_ddr_wr_start <= 1; if (|fifo_cont_reg39[1:0]) begin ps_ddr_wr_length <= {fifo_cont_reg39[7:2],4'b0} + 16; end else begin ps_ddr_wr_length <= {fifo_cont_reg39[7:2],4'b0} ;end	end	end	else	begin	r_addr <= 40;ps_ddr_wr_start <= 0;ps_ddr_wr_en <= valid39 | (! ps_ddr_wr_finish)  ;ps_ddr_wr_data <=    rd_data39  ;if (ps_ddr_wr_finish)	begin rd_state <= rd_state + 1;w_cont256 <= 0;rd_en39 <= 0;end else if (w_cont256 < fifo_cont_reg39) begin	w_cont256 <= w_cont256 + 1;rd_en0  <=1;end else	rd_en39 <= 0;	end	end
			202:	begin if (rd_state_r !=rd_state ) begin wt_compensator <= 4 - fifo_cont_reg40 [1:0];ps_ddr_wr_addr <= r_data ;if (|fifo_cont_reg40) begin w_cont256 <= 1;rd_en40 <=1;ps_ddr_wr_start <= 1; if (|fifo_cont_reg40[1:0]) begin ps_ddr_wr_length <= {fifo_cont_reg40[7:2],4'b0} + 16; end else begin ps_ddr_wr_length <= {fifo_cont_reg40[7:2],4'b0} ;end	end	end	else	begin	r_addr <= 41;ps_ddr_wr_start <= 0;ps_ddr_wr_en <= valid40 | (! ps_ddr_wr_finish)  ;ps_ddr_wr_data <=    rd_data40  ;if (ps_ddr_wr_finish)	begin rd_state <= rd_state + 1;w_cont256 <= 0;rd_en40 <= 0;end else if (w_cont256 < fifo_cont_reg40) begin	w_cont256 <= w_cont256 + 1;rd_en0  <=1;end else	rd_en40 <= 0;	end	end
			203:	begin if (rd_state_r !=rd_state ) begin wt_compensator <= 4 - fifo_cont_reg41 [1:0];ps_ddr_wr_addr <= r_data ;if (|fifo_cont_reg41) begin w_cont256 <= 1;rd_en41 <=1;ps_ddr_wr_start <= 1; if (|fifo_cont_reg41[1:0]) begin ps_ddr_wr_length <= {fifo_cont_reg41[7:2],4'b0} + 16; end else begin ps_ddr_wr_length <= {fifo_cont_reg41[7:2],4'b0} ;end	end	end	else	begin	r_addr <= 42;ps_ddr_wr_start <= 0;ps_ddr_wr_en <= valid41 | (! ps_ddr_wr_finish)  ;ps_ddr_wr_data <=    rd_data41  ;if (ps_ddr_wr_finish)	begin rd_state <= rd_state + 1;w_cont256 <= 0;rd_en41 <= 0;end else if (w_cont256 < fifo_cont_reg41) begin	w_cont256 <= w_cont256 + 1;rd_en0  <=1;end else	rd_en41 <= 0;	end	end
			204:	begin if (rd_state_r !=rd_state ) begin wt_compensator <= 4 - fifo_cont_reg42 [1:0];ps_ddr_wr_addr <= r_data ;if (|fifo_cont_reg42) begin w_cont256 <= 1;rd_en42 <=1;ps_ddr_wr_start <= 1; if (|fifo_cont_reg42[1:0]) begin ps_ddr_wr_length <= {fifo_cont_reg42[7:2],4'b0} + 16; end else begin ps_ddr_wr_length <= {fifo_cont_reg42[7:2],4'b0} ;end	end	end	else	begin	r_addr <= 43;ps_ddr_wr_start <= 0;ps_ddr_wr_en <= valid42 | (! ps_ddr_wr_finish)  ;ps_ddr_wr_data <=    rd_data42  ;if (ps_ddr_wr_finish)	begin rd_state <= rd_state + 1;w_cont256 <= 0;rd_en42 <= 0;end else if (w_cont256 < fifo_cont_reg42) begin	w_cont256 <= w_cont256 + 1;rd_en0  <=1;end else	rd_en42 <= 0;	end	end
			205:	begin if (rd_state_r !=rd_state ) begin wt_compensator <= 4 - fifo_cont_reg43 [1:0];ps_ddr_wr_addr <= r_data ;if (|fifo_cont_reg43) begin w_cont256 <= 1;rd_en43 <=1;ps_ddr_wr_start <= 1; if (|fifo_cont_reg43[1:0]) begin ps_ddr_wr_length <= {fifo_cont_reg43[7:2],4'b0} + 16; end else begin ps_ddr_wr_length <= {fifo_cont_reg43[7:2],4'b0} ;end	end	end	else	begin	r_addr <= 44;ps_ddr_wr_start <= 0;ps_ddr_wr_en <= valid43 | (! ps_ddr_wr_finish)  ;ps_ddr_wr_data <=    rd_data43  ;if (ps_ddr_wr_finish)	begin rd_state <= rd_state + 1;w_cont256 <= 0;rd_en43 <= 0;end else if (w_cont256 < fifo_cont_reg43) begin	w_cont256 <= w_cont256 + 1;rd_en0  <=1;end else	rd_en43 <= 0;	end	end
			206:	begin if (rd_state_r !=rd_state ) begin wt_compensator <= 4 - fifo_cont_reg44 [1:0];ps_ddr_wr_addr <= r_data ;if (|fifo_cont_reg44) begin w_cont256 <= 1;rd_en44 <=1;ps_ddr_wr_start <= 1; if (|fifo_cont_reg44[1:0]) begin ps_ddr_wr_length <= {fifo_cont_reg44[7:2],4'b0} + 16; end else begin ps_ddr_wr_length <= {fifo_cont_reg44[7:2],4'b0} ;end	end	end	else	begin	r_addr <= 45;ps_ddr_wr_start <= 0;ps_ddr_wr_en <= valid44 | (! ps_ddr_wr_finish)  ;ps_ddr_wr_data <=    rd_data44  ;if (ps_ddr_wr_finish)	begin rd_state <= rd_state + 1;w_cont256 <= 0;rd_en44 <= 0;end else if (w_cont256 < fifo_cont_reg44) begin	w_cont256 <= w_cont256 + 1;rd_en0  <=1;end else	rd_en44 <= 0;	end	end
			207:	begin if (rd_state_r !=rd_state ) begin wt_compensator <= 4 - fifo_cont_reg45 [1:0];ps_ddr_wr_addr <= r_data ;if (|fifo_cont_reg45) begin w_cont256 <= 1;rd_en45 <=1;ps_ddr_wr_start <= 1; if (|fifo_cont_reg45[1:0]) begin ps_ddr_wr_length <= {fifo_cont_reg45[7:2],4'b0} + 16; end else begin ps_ddr_wr_length <= {fifo_cont_reg45[7:2],4'b0} ;end	end	end	else	begin	r_addr <= 46;ps_ddr_wr_start <= 0;ps_ddr_wr_en <= valid45 | (! ps_ddr_wr_finish)  ;ps_ddr_wr_data <=    rd_data45  ;if (ps_ddr_wr_finish)	begin rd_state <= rd_state + 1;w_cont256 <= 0;rd_en45 <= 0;end else if (w_cont256 < fifo_cont_reg45) begin	w_cont256 <= w_cont256 + 1;rd_en0  <=1;end else	rd_en45 <= 0;	end	end
			208:	begin if (rd_state_r !=rd_state ) begin wt_compensator <= 4 - fifo_cont_reg46 [1:0];ps_ddr_wr_addr <= r_data ;if (|fifo_cont_reg46) begin w_cont256 <= 1;rd_en46 <=1;ps_ddr_wr_start <= 1; if (|fifo_cont_reg46[1:0]) begin ps_ddr_wr_length <= {fifo_cont_reg46[7:2],4'b0} + 16; end else begin ps_ddr_wr_length <= {fifo_cont_reg46[7:2],4'b0} ;end	end	end	else	begin	r_addr <= 47;ps_ddr_wr_start <= 0;ps_ddr_wr_en <= valid46 | (! ps_ddr_wr_finish)  ;ps_ddr_wr_data <=    rd_data46  ;if (ps_ddr_wr_finish)	begin rd_state <= rd_state + 1;w_cont256 <= 0;rd_en46 <= 0;end else if (w_cont256 < fifo_cont_reg46) begin	w_cont256 <= w_cont256 + 1;rd_en0  <=1;end else	rd_en46 <= 0;	end	end
			209:	begin if (rd_state_r !=rd_state ) begin wt_compensator <= 4 - fifo_cont_reg47 [1:0];ps_ddr_wr_addr <= r_data ;if (|fifo_cont_reg47) begin w_cont256 <= 1;rd_en47 <=1;ps_ddr_wr_start <= 1; if (|fifo_cont_reg47[1:0]) begin ps_ddr_wr_length <= {fifo_cont_reg47[7:2],4'b0} + 16; end else begin ps_ddr_wr_length <= {fifo_cont_reg47[7:2],4'b0} ;end	end	end	else	begin	r_addr <= 48;ps_ddr_wr_start <= 0;ps_ddr_wr_en <= valid47 | (! ps_ddr_wr_finish)  ;ps_ddr_wr_data <=    rd_data47  ;if (ps_ddr_wr_finish)	begin rd_state <= rd_state + 1;w_cont256 <= 0;rd_en47 <= 0;end else if (w_cont256 < fifo_cont_reg47) begin	w_cont256 <= w_cont256 + 1;rd_en0  <=1;end else	rd_en47 <= 0;	end	end
			210:	begin if (rd_state_r !=rd_state ) begin wt_compensator <= 4 - fifo_cont_reg48 [1:0];ps_ddr_wr_addr <= r_data ;if (|fifo_cont_reg48) begin w_cont256 <= 1;rd_en48 <=1;ps_ddr_wr_start <= 1; if (|fifo_cont_reg48[1:0]) begin ps_ddr_wr_length <= {fifo_cont_reg48[7:2],4'b0} + 16; end else begin ps_ddr_wr_length <= {fifo_cont_reg48[7:2],4'b0} ;end	end	end	else	begin	r_addr <= 49;ps_ddr_wr_start <= 0;ps_ddr_wr_en <= valid48 | (! ps_ddr_wr_finish)  ;ps_ddr_wr_data <=    rd_data48  ;if (ps_ddr_wr_finish)	begin rd_state <= rd_state + 1;w_cont256 <= 0;rd_en48 <= 0;end else if (w_cont256 < fifo_cont_reg48) begin	w_cont256 <= w_cont256 + 1;rd_en0  <=1;end else	rd_en48 <= 0;	end	end
			211:	begin if (rd_state_r !=rd_state ) begin wt_compensator <= 4 - fifo_cont_reg49 [1:0];ps_ddr_wr_addr <= r_data ;if (|fifo_cont_reg49) begin w_cont256 <= 1;rd_en49 <=1;ps_ddr_wr_start <= 1; if (|fifo_cont_reg49[1:0]) begin ps_ddr_wr_length <= {fifo_cont_reg49[7:2],4'b0} + 16; end else begin ps_ddr_wr_length <= {fifo_cont_reg49[7:2],4'b0} ;end	end	end	else	begin	r_addr <= 50;ps_ddr_wr_start <= 0;ps_ddr_wr_en <= valid49 | (! ps_ddr_wr_finish)  ;ps_ddr_wr_data <=    rd_data49  ;if (ps_ddr_wr_finish)	begin rd_state <= rd_state + 1;w_cont256 <= 0;rd_en49 <= 0;end else if (w_cont256 < fifo_cont_reg49) begin	w_cont256 <= w_cont256 + 1;rd_en0  <=1;end else	rd_en49 <= 0;	end	end
			212:	begin if (rd_state_r !=rd_state ) begin wt_compensator <= 4 - fifo_cont_reg50 [1:0];ps_ddr_wr_addr <= r_data ;if (|fifo_cont_reg50) begin w_cont256 <= 1;rd_en50 <=1;ps_ddr_wr_start <= 1; if (|fifo_cont_reg50[1:0]) begin ps_ddr_wr_length <= {fifo_cont_reg50[7:2],4'b0} + 16; end else begin ps_ddr_wr_length <= {fifo_cont_reg50[7:2],4'b0} ;end	end	end	else	begin	r_addr <= 51;ps_ddr_wr_start <= 0;ps_ddr_wr_en <= valid50 | (! ps_ddr_wr_finish)  ;ps_ddr_wr_data <=    rd_data50  ;if (ps_ddr_wr_finish)	begin rd_state <= rd_state + 1;w_cont256 <= 0;rd_en50 <= 0;end else if (w_cont256 < fifo_cont_reg50) begin	w_cont256 <= w_cont256 + 1;rd_en0  <=1;end else	rd_en50 <= 0;	end	end
			213:	begin if (rd_state_r !=rd_state ) begin wt_compensator <= 4 - fifo_cont_reg51 [1:0];ps_ddr_wr_addr <= r_data ;if (|fifo_cont_reg51) begin w_cont256 <= 1;rd_en51 <=1;ps_ddr_wr_start <= 1; if (|fifo_cont_reg51[1:0]) begin ps_ddr_wr_length <= {fifo_cont_reg51[7:2],4'b0} + 16; end else begin ps_ddr_wr_length <= {fifo_cont_reg51[7:2],4'b0} ;end	end	end	else	begin	r_addr <= 52;ps_ddr_wr_start <= 0;ps_ddr_wr_en <= valid51 | (! ps_ddr_wr_finish)  ;ps_ddr_wr_data <=    rd_data51  ;if (ps_ddr_wr_finish)	begin rd_state <= rd_state + 1;w_cont256 <= 0;rd_en51 <= 0;end else if (w_cont256 < fifo_cont_reg51) begin	w_cont256 <= w_cont256 + 1;rd_en0  <=1;end else	rd_en51 <= 0;	end	end
			214:	begin if (rd_state_r !=rd_state ) begin wt_compensator <= 4 - fifo_cont_reg52 [1:0];ps_ddr_wr_addr <= r_data ;if (|fifo_cont_reg52) begin w_cont256 <= 1;rd_en52 <=1;ps_ddr_wr_start <= 1; if (|fifo_cont_reg52[1:0]) begin ps_ddr_wr_length <= {fifo_cont_reg52[7:2],4'b0} + 16; end else begin ps_ddr_wr_length <= {fifo_cont_reg52[7:2],4'b0} ;end	end	end	else	begin	r_addr <= 53;ps_ddr_wr_start <= 0;ps_ddr_wr_en <= valid52 | (! ps_ddr_wr_finish)  ;ps_ddr_wr_data <=    rd_data52  ;if (ps_ddr_wr_finish)	begin rd_state <= rd_state + 1;w_cont256 <= 0;rd_en52 <= 0;end else if (w_cont256 < fifo_cont_reg52) begin	w_cont256 <= w_cont256 + 1;rd_en0  <=1;end else	rd_en52 <= 0;	end	end
			215:	begin if (rd_state_r !=rd_state ) begin wt_compensator <= 4 - fifo_cont_reg53 [1:0];ps_ddr_wr_addr <= r_data ;if (|fifo_cont_reg53) begin w_cont256 <= 1;rd_en53 <=1;ps_ddr_wr_start <= 1; if (|fifo_cont_reg53[1:0]) begin ps_ddr_wr_length <= {fifo_cont_reg53[7:2],4'b0} + 16; end else begin ps_ddr_wr_length <= {fifo_cont_reg53[7:2],4'b0} ;end	end	end	else	begin	r_addr <= 54;ps_ddr_wr_start <= 0;ps_ddr_wr_en <= valid53 | (! ps_ddr_wr_finish)  ;ps_ddr_wr_data <=    rd_data53  ;if (ps_ddr_wr_finish)	begin rd_state <= rd_state + 1;w_cont256 <= 0;rd_en53 <= 0;end else if (w_cont256 < fifo_cont_reg53) begin	w_cont256 <= w_cont256 + 1;rd_en0  <=1;end else	rd_en53 <= 0;	end	end
			216:	begin if (rd_state_r !=rd_state ) begin wt_compensator <= 4 - fifo_cont_reg54 [1:0];ps_ddr_wr_addr <= r_data ;if (|fifo_cont_reg54) begin w_cont256 <= 1;rd_en54 <=1;ps_ddr_wr_start <= 1; if (|fifo_cont_reg54[1:0]) begin ps_ddr_wr_length <= {fifo_cont_reg54[7:2],4'b0} + 16; end else begin ps_ddr_wr_length <= {fifo_cont_reg54[7:2],4'b0} ;end	end	end	else	begin	r_addr <= 55;ps_ddr_wr_start <= 0;ps_ddr_wr_en <= valid54 | (! ps_ddr_wr_finish)  ;ps_ddr_wr_data <=    rd_data54  ;if (ps_ddr_wr_finish)	begin rd_state <= rd_state + 1;w_cont256 <= 0;rd_en54 <= 0;end else if (w_cont256 < fifo_cont_reg54) begin	w_cont256 <= w_cont256 + 1;rd_en0  <=1;end else	rd_en54 <= 0;	end	end
			217:	begin if (rd_state_r !=rd_state ) begin wt_compensator <= 4 - fifo_cont_reg55 [1:0];ps_ddr_wr_addr <= r_data ;if (|fifo_cont_reg55) begin w_cont256 <= 1;rd_en55 <=1;ps_ddr_wr_start <= 1; if (|fifo_cont_reg55[1:0]) begin ps_ddr_wr_length <= {fifo_cont_reg55[7:2],4'b0} + 16; end else begin ps_ddr_wr_length <= {fifo_cont_reg55[7:2],4'b0} ;end	end	end	else	begin	r_addr <= 56;ps_ddr_wr_start <= 0;ps_ddr_wr_en <= valid55 | (! ps_ddr_wr_finish)  ;ps_ddr_wr_data <=    rd_data55  ;if (ps_ddr_wr_finish)	begin rd_state <= rd_state + 1;w_cont256 <= 0;rd_en55 <= 0;end else if (w_cont256 < fifo_cont_reg55) begin	w_cont256 <= w_cont256 + 1;rd_en0  <=1;end else	rd_en55 <= 0;	end	end
			218:	begin if (rd_state_r !=rd_state ) begin wt_compensator <= 4 - fifo_cont_reg56 [1:0];ps_ddr_wr_addr <= r_data ;if (|fifo_cont_reg56) begin w_cont256 <= 1;rd_en56 <=1;ps_ddr_wr_start <= 1; if (|fifo_cont_reg56[1:0]) begin ps_ddr_wr_length <= {fifo_cont_reg56[7:2],4'b0} + 16; end else begin ps_ddr_wr_length <= {fifo_cont_reg56[7:2],4'b0} ;end	end	end	else	begin	r_addr <= 57;ps_ddr_wr_start <= 0;ps_ddr_wr_en <= valid56 | (! ps_ddr_wr_finish)  ;ps_ddr_wr_data <=    rd_data56  ;if (ps_ddr_wr_finish)	begin rd_state <= rd_state + 1;w_cont256 <= 0;rd_en56 <= 0;end else if (w_cont256 < fifo_cont_reg56) begin	w_cont256 <= w_cont256 + 1;rd_en0  <=1;end else	rd_en56 <= 0;	end	end
			219:	begin if (rd_state_r !=rd_state ) begin wt_compensator <= 4 - fifo_cont_reg57 [1:0];ps_ddr_wr_addr <= r_data ;if (|fifo_cont_reg57) begin w_cont256 <= 1;rd_en57 <=1;ps_ddr_wr_start <= 1; if (|fifo_cont_reg57[1:0]) begin ps_ddr_wr_length <= {fifo_cont_reg57[7:2],4'b0} + 16; end else begin ps_ddr_wr_length <= {fifo_cont_reg57[7:2],4'b0} ;end	end	end	else	begin	r_addr <= 58;ps_ddr_wr_start <= 0;ps_ddr_wr_en <= valid57 | (! ps_ddr_wr_finish)  ;ps_ddr_wr_data <=    rd_data57  ;if (ps_ddr_wr_finish)	begin rd_state <= rd_state + 1;w_cont256 <= 0;rd_en57 <= 0;end else if (w_cont256 < fifo_cont_reg57) begin	w_cont256 <= w_cont256 + 1;rd_en0  <=1;end else	rd_en57 <= 0;	end	end
			220:	begin if (rd_state_r !=rd_state ) begin wt_compensator <= 4 - fifo_cont_reg58 [1:0];ps_ddr_wr_addr <= r_data ;if (|fifo_cont_reg58) begin w_cont256 <= 1;rd_en58 <=1;ps_ddr_wr_start <= 1; if (|fifo_cont_reg58[1:0]) begin ps_ddr_wr_length <= {fifo_cont_reg58[7:2],4'b0} + 16; end else begin ps_ddr_wr_length <= {fifo_cont_reg58[7:2],4'b0} ;end	end	end	else	begin	r_addr <= 59;ps_ddr_wr_start <= 0;ps_ddr_wr_en <= valid58 | (! ps_ddr_wr_finish)  ;ps_ddr_wr_data <=    rd_data58  ;if (ps_ddr_wr_finish)	begin rd_state <= rd_state + 1;w_cont256 <= 0;rd_en58 <= 0;end else if (w_cont256 < fifo_cont_reg58) begin	w_cont256 <= w_cont256 + 1;rd_en0  <=1;end else	rd_en58 <= 0;	end	end
			221:	begin if (rd_state_r !=rd_state ) begin wt_compensator <= 4 - fifo_cont_reg59 [1:0];ps_ddr_wr_addr <= r_data ;if (|fifo_cont_reg59) begin w_cont256 <= 1;rd_en59 <=1;ps_ddr_wr_start <= 1; if (|fifo_cont_reg59[1:0]) begin ps_ddr_wr_length <= {fifo_cont_reg59[7:2],4'b0} + 16; end else begin ps_ddr_wr_length <= {fifo_cont_reg59[7:2],4'b0} ;end	end	end	else	begin	r_addr <= 60;ps_ddr_wr_start <= 0;ps_ddr_wr_en <= valid59 | (! ps_ddr_wr_finish)  ;ps_ddr_wr_data <=    rd_data59  ;if (ps_ddr_wr_finish)	begin rd_state <= rd_state + 1;w_cont256 <= 0;rd_en59 <= 0;end else if (w_cont256 < fifo_cont_reg59) begin	w_cont256 <= w_cont256 + 1;rd_en0  <=1;end else	rd_en59 <= 0;	end	end
			222:	begin if (rd_state_r !=rd_state ) begin wt_compensator <= 4 - fifo_cont_reg60 [1:0];ps_ddr_wr_addr <= r_data ;if (|fifo_cont_reg60) begin w_cont256 <= 1;rd_en60 <=1;ps_ddr_wr_start <= 1; if (|fifo_cont_reg60[1:0]) begin ps_ddr_wr_length <= {fifo_cont_reg60[7:2],4'b0} + 16; end else begin ps_ddr_wr_length <= {fifo_cont_reg60[7:2],4'b0} ;end	end	end	else	begin	r_addr <= 61;ps_ddr_wr_start <= 0;ps_ddr_wr_en <= valid60 | (! ps_ddr_wr_finish)  ;ps_ddr_wr_data <=    rd_data60  ;if (ps_ddr_wr_finish)	begin rd_state <= rd_state + 1;w_cont256 <= 0;rd_en60 <= 0;end else if (w_cont256 < fifo_cont_reg60) begin	w_cont256 <= w_cont256 + 1;rd_en0  <=1;end else	rd_en60 <= 0;	end	end
			223:	begin if (rd_state_r !=rd_state ) begin wt_compensator <= 4 - fifo_cont_reg61 [1:0];ps_ddr_wr_addr <= r_data ;if (|fifo_cont_reg61) begin w_cont256 <= 1;rd_en61 <=1;ps_ddr_wr_start <= 1; if (|fifo_cont_reg61[1:0]) begin ps_ddr_wr_length <= {fifo_cont_reg61[7:2],4'b0} + 16; end else begin ps_ddr_wr_length <= {fifo_cont_reg61[7:2],4'b0} ;end	end	end	else	begin	r_addr <= 62;ps_ddr_wr_start <= 0;ps_ddr_wr_en <= valid61 | (! ps_ddr_wr_finish)  ;ps_ddr_wr_data <=    rd_data61  ;if (ps_ddr_wr_finish)	begin rd_state <= rd_state + 1;w_cont256 <= 0;rd_en61 <= 0;end else if (w_cont256 < fifo_cont_reg61) begin	w_cont256 <= w_cont256 + 1;rd_en0  <=1;end else	rd_en61 <= 0;	end	end
			224:	begin if (rd_state_r !=rd_state ) begin wt_compensator <= 4 - fifo_cont_reg62 [1:0];ps_ddr_wr_addr <= r_data ;if (|fifo_cont_reg62) begin w_cont256 <= 1;rd_en62 <=1;ps_ddr_wr_start <= 1; if (|fifo_cont_reg62[1:0]) begin ps_ddr_wr_length <= {fifo_cont_reg62[7:2],4'b0} + 16; end else begin ps_ddr_wr_length <= {fifo_cont_reg62[7:2],4'b0} ;end	end	end	else	begin	r_addr <= 63;ps_ddr_wr_start <= 0;ps_ddr_wr_en <= valid62 | (! ps_ddr_wr_finish)  ;ps_ddr_wr_data <=    rd_data62  ;if (ps_ddr_wr_finish)	begin rd_state <= rd_state + 1;w_cont256 <= 0;rd_en62 <= 0;end else if (w_cont256 < fifo_cont_reg62) begin	w_cont256 <= w_cont256 + 1;rd_en0  <=1;end else	rd_en62 <= 0;	end	end
			225:	begin if (rd_state_r !=rd_state ) begin wt_compensator <= 4 - fifo_cont_reg63 [1:0];ps_ddr_wr_addr <= r_data ;if (|fifo_cont_reg63) begin w_cont256 <= 1;rd_en63 <=1;ps_ddr_wr_start <= 1; if (|fifo_cont_reg63[1:0]) begin ps_ddr_wr_length <= {fifo_cont_reg63[7:2],4'b0} + 16; end else begin ps_ddr_wr_length <= {fifo_cont_reg63[7:2],4'b0} ;end	end	end	else	begin	r_addr <= 64;ps_ddr_wr_start <= 0;ps_ddr_wr_en <= valid63 | (! ps_ddr_wr_finish)  ;ps_ddr_wr_data <=    rd_data63  ;if (ps_ddr_wr_finish)	begin rd_state <= rd_state + 1;w_cont256 <= 0;rd_en63 <= 0;end else if (w_cont256 < fifo_cont_reg63) begin	w_cont256 <= w_cont256 + 1;rd_en0  <=1;end else	rd_en63 <= 0;	end	end
			226:	begin if (rd_state_r !=rd_state ) begin wt_compensator <= 4 - fifo_cont_reg64 [1:0];ps_ddr_wr_addr <= r_data ;if (|fifo_cont_reg64) begin w_cont256 <= 1;rd_en64 <=1;ps_ddr_wr_start <= 1; if (|fifo_cont_reg64[1:0]) begin ps_ddr_wr_length <= {fifo_cont_reg64[7:2],4'b0} + 16; end else begin ps_ddr_wr_length <= {fifo_cont_reg64[7:2],4'b0} ;end	end	end	else	begin	r_addr <= 65;ps_ddr_wr_start <= 0;ps_ddr_wr_en <= valid64 | (! ps_ddr_wr_finish)  ;ps_ddr_wr_data <=    rd_data64  ;if (ps_ddr_wr_finish)	begin rd_state <= rd_state + 1;w_cont256 <= 0;rd_en64 <= 0;end else if (w_cont256 < fifo_cont_reg64) begin	w_cont256 <= w_cont256 + 1;rd_en0  <=1;end else	rd_en64 <= 0;	end	end
			227:	begin if (rd_state_r !=rd_state ) begin wt_compensator <= 4 - fifo_cont_reg65 [1:0];ps_ddr_wr_addr <= r_data ;if (|fifo_cont_reg65) begin w_cont256 <= 1;rd_en65 <=1;ps_ddr_wr_start <= 1; if (|fifo_cont_reg65[1:0]) begin ps_ddr_wr_length <= {fifo_cont_reg65[7:2],4'b0} + 16; end else begin ps_ddr_wr_length <= {fifo_cont_reg65[7:2],4'b0} ;end	end	end	else	begin	r_addr <= 66;ps_ddr_wr_start <= 0;ps_ddr_wr_en <= valid65 | (! ps_ddr_wr_finish)  ;ps_ddr_wr_data <=    rd_data65  ;if (ps_ddr_wr_finish)	begin rd_state <= rd_state + 1;w_cont256 <= 0;rd_en65 <= 0;end else if (w_cont256 < fifo_cont_reg65) begin	w_cont256 <= w_cont256 + 1;rd_en0  <=1;end else	rd_en65 <= 0;	end	end
			228:	begin if (rd_state_r !=rd_state ) begin wt_compensator <= 4 - fifo_cont_reg66 [1:0];ps_ddr_wr_addr <= r_data ;if (|fifo_cont_reg66) begin w_cont256 <= 1;rd_en66 <=1;ps_ddr_wr_start <= 1; if (|fifo_cont_reg66[1:0]) begin ps_ddr_wr_length <= {fifo_cont_reg66[7:2],4'b0} + 16; end else begin ps_ddr_wr_length <= {fifo_cont_reg66[7:2],4'b0} ;end	end	end	else	begin	r_addr <= 67;ps_ddr_wr_start <= 0;ps_ddr_wr_en <= valid66 | (! ps_ddr_wr_finish)  ;ps_ddr_wr_data <=    rd_data66  ;if (ps_ddr_wr_finish)	begin rd_state <= rd_state + 1;w_cont256 <= 0;rd_en66 <= 0;end else if (w_cont256 < fifo_cont_reg66) begin	w_cont256 <= w_cont256 + 1;rd_en0  <=1;end else	rd_en66 <= 0;	end	end
			229:	begin if (rd_state_r !=rd_state ) begin wt_compensator <= 4 - fifo_cont_reg67 [1:0];ps_ddr_wr_addr <= r_data ;if (|fifo_cont_reg67) begin w_cont256 <= 1;rd_en67 <=1;ps_ddr_wr_start <= 1; if (|fifo_cont_reg67[1:0]) begin ps_ddr_wr_length <= {fifo_cont_reg67[7:2],4'b0} + 16; end else begin ps_ddr_wr_length <= {fifo_cont_reg67[7:2],4'b0} ;end	end	end	else	begin	r_addr <= 68;ps_ddr_wr_start <= 0;ps_ddr_wr_en <= valid67 | (! ps_ddr_wr_finish)  ;ps_ddr_wr_data <=    rd_data67  ;if (ps_ddr_wr_finish)	begin rd_state <= rd_state + 1;w_cont256 <= 0;rd_en67 <= 0;end else if (w_cont256 < fifo_cont_reg67) begin	w_cont256 <= w_cont256 + 1;rd_en0  <=1;end else	rd_en67 <= 0;	end	end
			230:	begin if (rd_state_r !=rd_state ) begin wt_compensator <= 4 - fifo_cont_reg68 [1:0];ps_ddr_wr_addr <= r_data ;if (|fifo_cont_reg68) begin w_cont256 <= 1;rd_en68 <=1;ps_ddr_wr_start <= 1; if (|fifo_cont_reg68[1:0]) begin ps_ddr_wr_length <= {fifo_cont_reg68[7:2],4'b0} + 16; end else begin ps_ddr_wr_length <= {fifo_cont_reg68[7:2],4'b0} ;end	end	end	else	begin	r_addr <= 69;ps_ddr_wr_start <= 0;ps_ddr_wr_en <= valid68 | (! ps_ddr_wr_finish)  ;ps_ddr_wr_data <=    rd_data68  ;if (ps_ddr_wr_finish)	begin rd_state <= rd_state + 1;w_cont256 <= 0;rd_en68 <= 0;end else if (w_cont256 < fifo_cont_reg68) begin	w_cont256 <= w_cont256 + 1;rd_en0  <=1;end else	rd_en68 <= 0;	end	end
			231:	begin if (rd_state_r !=rd_state ) begin wt_compensator <= 4 - fifo_cont_reg69 [1:0];ps_ddr_wr_addr <= r_data ;if (|fifo_cont_reg69) begin w_cont256 <= 1;rd_en69 <=1;ps_ddr_wr_start <= 1; if (|fifo_cont_reg69[1:0]) begin ps_ddr_wr_length <= {fifo_cont_reg69[7:2],4'b0} + 16; end else begin ps_ddr_wr_length <= {fifo_cont_reg69[7:2],4'b0} ;end	end	end	else	begin	r_addr <= 70;ps_ddr_wr_start <= 0;ps_ddr_wr_en <= valid69 | (! ps_ddr_wr_finish)  ;ps_ddr_wr_data <=    rd_data69  ;if (ps_ddr_wr_finish)	begin rd_state <= rd_state + 1;w_cont256 <= 0;rd_en69 <= 0;end else if (w_cont256 < fifo_cont_reg69) begin	w_cont256 <= w_cont256 + 1;rd_en0  <=1;end else	rd_en69 <= 0;	end	end
			232:	begin if (rd_state_r !=rd_state ) begin wt_compensator <= 4 - fifo_cont_reg70 [1:0];ps_ddr_wr_addr <= r_data ;if (|fifo_cont_reg70) begin w_cont256 <= 1;rd_en70 <=1;ps_ddr_wr_start <= 1; if (|fifo_cont_reg70[1:0]) begin ps_ddr_wr_length <= {fifo_cont_reg70[7:2],4'b0} + 16; end else begin ps_ddr_wr_length <= {fifo_cont_reg70[7:2],4'b0} ;end	end	end	else	begin	r_addr <= 71;ps_ddr_wr_start <= 0;ps_ddr_wr_en <= valid70 | (! ps_ddr_wr_finish)  ;ps_ddr_wr_data <=    rd_data70  ;if (ps_ddr_wr_finish)	begin rd_state <= rd_state + 1;w_cont256 <= 0;rd_en70 <= 0;end else if (w_cont256 < fifo_cont_reg70) begin	w_cont256 <= w_cont256 + 1;rd_en0  <=1;end else	rd_en70 <= 0;	end	end
			233:	begin if (rd_state_r !=rd_state ) begin wt_compensator <= 4 - fifo_cont_reg71 [1:0];ps_ddr_wr_addr <= r_data ;if (|fifo_cont_reg71) begin w_cont256 <= 1;rd_en71 <=1;ps_ddr_wr_start <= 1; if (|fifo_cont_reg71[1:0]) begin ps_ddr_wr_length <= {fifo_cont_reg71[7:2],4'b0} + 16; end else begin ps_ddr_wr_length <= {fifo_cont_reg71[7:2],4'b0} ;end	end	end	else	begin	r_addr <= 72;ps_ddr_wr_start <= 0;ps_ddr_wr_en <= valid71 | (! ps_ddr_wr_finish)  ;ps_ddr_wr_data <=    rd_data71  ;if (ps_ddr_wr_finish)	begin rd_state <= rd_state + 1;w_cont256 <= 0;rd_en71 <= 0;end else if (w_cont256 < fifo_cont_reg71) begin	w_cont256 <= w_cont256 + 1;rd_en0  <=1;end else	rd_en71 <= 0;	end	end
			234:	begin if (rd_state_r !=rd_state ) begin wt_compensator <= 4 - fifo_cont_reg72 [1:0];ps_ddr_wr_addr <= r_data ;if (|fifo_cont_reg72) begin w_cont256 <= 1;rd_en72 <=1;ps_ddr_wr_start <= 1; if (|fifo_cont_reg72[1:0]) begin ps_ddr_wr_length <= {fifo_cont_reg72[7:2],4'b0} + 16; end else begin ps_ddr_wr_length <= {fifo_cont_reg72[7:2],4'b0} ;end	end	end	else	begin	r_addr <= 73;ps_ddr_wr_start <= 0;ps_ddr_wr_en <= valid72 | (! ps_ddr_wr_finish)  ;ps_ddr_wr_data <=    rd_data72  ;if (ps_ddr_wr_finish)	begin rd_state <= rd_state + 1;w_cont256 <= 0;rd_en72 <= 0;end else if (w_cont256 < fifo_cont_reg72) begin	w_cont256 <= w_cont256 + 1;rd_en0  <=1;end else	rd_en72 <= 0;	end	end
			235:	begin if (rd_state_r !=rd_state ) begin wt_compensator <= 4 - fifo_cont_reg73 [1:0];ps_ddr_wr_addr <= r_data ;if (|fifo_cont_reg73) begin w_cont256 <= 1;rd_en73 <=1;ps_ddr_wr_start <= 1; if (|fifo_cont_reg73[1:0]) begin ps_ddr_wr_length <= {fifo_cont_reg73[7:2],4'b0} + 16; end else begin ps_ddr_wr_length <= {fifo_cont_reg73[7:2],4'b0} ;end	end	end	else	begin	r_addr <= 74;ps_ddr_wr_start <= 0;ps_ddr_wr_en <= valid73 | (! ps_ddr_wr_finish)  ;ps_ddr_wr_data <=    rd_data73  ;if (ps_ddr_wr_finish)	begin rd_state <= rd_state + 1;w_cont256 <= 0;rd_en73 <= 0;end else if (w_cont256 < fifo_cont_reg73) begin	w_cont256 <= w_cont256 + 1;rd_en0  <=1;end else	rd_en73 <= 0;	end	end
			236:	begin if (rd_state_r !=rd_state ) begin wt_compensator <= 4 - fifo_cont_reg74 [1:0];ps_ddr_wr_addr <= r_data ;if (|fifo_cont_reg74) begin w_cont256 <= 1;rd_en74 <=1;ps_ddr_wr_start <= 1; if (|fifo_cont_reg74[1:0]) begin ps_ddr_wr_length <= {fifo_cont_reg74[7:2],4'b0} + 16; end else begin ps_ddr_wr_length <= {fifo_cont_reg74[7:2],4'b0} ;end	end	end	else	begin	r_addr <= 75;ps_ddr_wr_start <= 0;ps_ddr_wr_en <= valid74 | (! ps_ddr_wr_finish)  ;ps_ddr_wr_data <=    rd_data74  ;if (ps_ddr_wr_finish)	begin rd_state <= rd_state + 1;w_cont256 <= 0;rd_en74 <= 0;end else if (w_cont256 < fifo_cont_reg74) begin	w_cont256 <= w_cont256 + 1;rd_en0  <=1;end else	rd_en74 <= 0;	end	end
			237:	begin if (rd_state_r !=rd_state ) begin wt_compensator <= 4 - fifo_cont_reg75 [1:0];ps_ddr_wr_addr <= r_data ;if (|fifo_cont_reg75) begin w_cont256 <= 1;rd_en75 <=1;ps_ddr_wr_start <= 1; if (|fifo_cont_reg75[1:0]) begin ps_ddr_wr_length <= {fifo_cont_reg75[7:2],4'b0} + 16; end else begin ps_ddr_wr_length <= {fifo_cont_reg75[7:2],4'b0} ;end	end	end	else	begin	r_addr <= 76;ps_ddr_wr_start <= 0;ps_ddr_wr_en <= valid75 | (! ps_ddr_wr_finish)  ;ps_ddr_wr_data <=    rd_data75  ;if (ps_ddr_wr_finish)	begin rd_state <= rd_state + 1;w_cont256 <= 0;rd_en75 <= 0;end else if (w_cont256 < fifo_cont_reg75) begin	w_cont256 <= w_cont256 + 1;rd_en0  <=1;end else	rd_en75 <= 0;	end	end
			238:	begin if (rd_state_r !=rd_state ) begin wt_compensator <= 4 - fifo_cont_reg76 [1:0];ps_ddr_wr_addr <= r_data ;if (|fifo_cont_reg76) begin w_cont256 <= 1;rd_en76 <=1;ps_ddr_wr_start <= 1; if (|fifo_cont_reg76[1:0]) begin ps_ddr_wr_length <= {fifo_cont_reg76[7:2],4'b0} + 16; end else begin ps_ddr_wr_length <= {fifo_cont_reg76[7:2],4'b0} ;end	end	end	else	begin	r_addr <= 77;ps_ddr_wr_start <= 0;ps_ddr_wr_en <= valid76 | (! ps_ddr_wr_finish)  ;ps_ddr_wr_data <=    rd_data76  ;if (ps_ddr_wr_finish)	begin rd_state <= rd_state + 1;w_cont256 <= 0;rd_en76 <= 0;end else if (w_cont256 < fifo_cont_reg76) begin	w_cont256 <= w_cont256 + 1;rd_en0  <=1;end else	rd_en76 <= 0;	end	end
			239:	begin if (rd_state_r !=rd_state ) begin wt_compensator <= 4 - fifo_cont_reg77 [1:0];ps_ddr_wr_addr <= r_data ;if (|fifo_cont_reg77) begin w_cont256 <= 1;rd_en77 <=1;ps_ddr_wr_start <= 1; if (|fifo_cont_reg77[1:0]) begin ps_ddr_wr_length <= {fifo_cont_reg77[7:2],4'b0} + 16; end else begin ps_ddr_wr_length <= {fifo_cont_reg77[7:2],4'b0} ;end	end	end	else	begin	r_addr <= 78;ps_ddr_wr_start <= 0;ps_ddr_wr_en <= valid77 | (! ps_ddr_wr_finish)  ;ps_ddr_wr_data <=    rd_data77  ;if (ps_ddr_wr_finish)	begin rd_state <= rd_state + 1;w_cont256 <= 0;rd_en77 <= 0;end else if (w_cont256 < fifo_cont_reg77) begin	w_cont256 <= w_cont256 + 1;rd_en0  <=1;end else	rd_en77 <= 0;	end	end
			240:	begin if (rd_state_r !=rd_state ) begin wt_compensator <= 4 - fifo_cont_reg78 [1:0];ps_ddr_wr_addr <= r_data ;if (|fifo_cont_reg78) begin w_cont256 <= 1;rd_en78 <=1;ps_ddr_wr_start <= 1; if (|fifo_cont_reg78[1:0]) begin ps_ddr_wr_length <= {fifo_cont_reg78[7:2],4'b0} + 16; end else begin ps_ddr_wr_length <= {fifo_cont_reg78[7:2],4'b0} ;end	end	end	else	begin	r_addr <= 79;ps_ddr_wr_start <= 0;ps_ddr_wr_en <= valid78 | (! ps_ddr_wr_finish)  ;ps_ddr_wr_data <=    rd_data78  ;if (ps_ddr_wr_finish)	begin rd_state <= rd_state + 1;w_cont256 <= 0;rd_en78 <= 0;end else if (w_cont256 < fifo_cont_reg78) begin	w_cont256 <= w_cont256 + 1;rd_en0  <=1;end else	rd_en78 <= 0;	end	end
			241:	begin if (rd_state_r !=rd_state ) begin wt_compensator <= 4 - fifo_cont_reg79 [1:0];ps_ddr_wr_addr <= r_data ;if (|fifo_cont_reg79) begin w_cont256 <= 1;rd_en79 <=1;ps_ddr_wr_start <= 1; if (|fifo_cont_reg79[1:0]) begin ps_ddr_wr_length <= {fifo_cont_reg79[7:2],4'b0} + 16; end else begin ps_ddr_wr_length <= {fifo_cont_reg79[7:2],4'b0} ;end	end	end	else	begin	r_addr <= 0 ;ps_ddr_wr_start <= 0;ps_ddr_wr_en <= valid79 | (! ps_ddr_wr_finish)  ;ps_ddr_wr_data <=    rd_data79  ;if (ps_ddr_wr_finish)	begin rd_state <= 0           ;w_cont256 <= 0;rd_en79 <= 0;end else if (w_cont256 < fifo_cont_reg79) begin	w_cont256 <= w_cont256 + 1;rd_en0  <=1;end else	rd_en79 <= 0;	end	end
			default:
			begin
				rd_state <= 0;
			end                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                   
			
			endcase
		end
	end
	
fifo_256x32 my_fifo_256x32_0  (.clk(ps_clk), .srst(!ps_rst) , .din(pl_ddr_rd_data) , .wr_en(w_en_flag[0 ] &pl_ddr_rd_en & pl_ddr_rd_data[31]) , .rd_en(rd_en0 ) , .dout(rd_data0 ), .full() , .empty(), .data_count(fifo_cont0 ),.prog_full(prog_full0 ) , .valid(valid0  ));
fifo_256x32 my_fifo_256x32_1  (.clk(ps_clk), .srst(!ps_rst) , .din(pl_ddr_rd_data) , .wr_en(w_en_flag[1 ] &pl_ddr_rd_en & pl_ddr_rd_data[31]) , .rd_en(rd_en1 ) , .dout(rd_data1 ), .full() , .empty(), .data_count(fifo_cont1 ),.prog_full(prog_full1 ) , .valid(valid1  ));
fifo_256x32 my_fifo_256x32_2  (.clk(ps_clk), .srst(!ps_rst) , .din(pl_ddr_rd_data) , .wr_en(w_en_flag[2 ] &pl_ddr_rd_en & pl_ddr_rd_data[31]) , .rd_en(rd_en2 ) , .dout(rd_data2 ), .full() , .empty(), .data_count(fifo_cont2 ),.prog_full(prog_full2 ) , .valid(valid2  ));
fifo_256x32 my_fifo_256x32_3  (.clk(ps_clk), .srst(!ps_rst) , .din(pl_ddr_rd_data) , .wr_en(w_en_flag[3 ] &pl_ddr_rd_en & pl_ddr_rd_data[31]) , .rd_en(rd_en3 ) , .dout(rd_data3 ), .full() , .empty(), .data_count(fifo_cont3 ),.prog_full(prog_full3 ) , .valid(valid3  ));
fifo_256x32 my_fifo_256x32_4  (.clk(ps_clk), .srst(!ps_rst) , .din(pl_ddr_rd_data) , .wr_en(w_en_flag[4 ] &pl_ddr_rd_en & pl_ddr_rd_data[31]) , .rd_en(rd_en4 ) , .dout(rd_data4 ), .full() , .empty(), .data_count(fifo_cont4 ),.prog_full(prog_full4 ) , .valid(valid4  ));
fifo_256x32 my_fifo_256x32_5  (.clk(ps_clk), .srst(!ps_rst) , .din(pl_ddr_rd_data) , .wr_en(w_en_flag[5 ] &pl_ddr_rd_en & pl_ddr_rd_data[31]) , .rd_en(rd_en5 ) , .dout(rd_data5 ), .full() , .empty(), .data_count(fifo_cont5 ),.prog_full(prog_full5 ) , .valid(valid5  ));
fifo_256x32 my_fifo_256x32_6  (.clk(ps_clk), .srst(!ps_rst) , .din(pl_ddr_rd_data) , .wr_en(w_en_flag[6 ] &pl_ddr_rd_en & pl_ddr_rd_data[31]) , .rd_en(rd_en6 ) , .dout(rd_data6 ), .full() , .empty(), .data_count(fifo_cont6 ),.prog_full(prog_full6 ) , .valid(valid6  ));
fifo_256x32 my_fifo_256x32_7  (.clk(ps_clk), .srst(!ps_rst) , .din(pl_ddr_rd_data) , .wr_en(w_en_flag[7 ] &pl_ddr_rd_en & pl_ddr_rd_data[31]) , .rd_en(rd_en7 ) , .dout(rd_data7 ), .full() , .empty(), .data_count(fifo_cont7 ),.prog_full(prog_full7 ) , .valid(valid7  ));
fifo_256x32 my_fifo_256x32_8  (.clk(ps_clk), .srst(!ps_rst) , .din(pl_ddr_rd_data) , .wr_en(w_en_flag[8 ] &pl_ddr_rd_en & pl_ddr_rd_data[31]) , .rd_en(rd_en8 ) , .dout(rd_data8 ), .full() , .empty(), .data_count(fifo_cont8 ),.prog_full(prog_full8 ) , .valid(valid8  ));
fifo_256x32 my_fifo_256x32_9  (.clk(ps_clk), .srst(!ps_rst) , .din(pl_ddr_rd_data) , .wr_en(w_en_flag[9 ] &pl_ddr_rd_en & pl_ddr_rd_data[31]) , .rd_en(rd_en9 ) , .dout(rd_data9 ), .full() , .empty(), .data_count(fifo_cont9 ),.prog_full(prog_full9 ) , .valid(valid9  ));
fifo_256x32 my_fifo_256x32_10 (.clk(ps_clk), .srst(!ps_rst) , .din(pl_ddr_rd_data) , .wr_en(w_en_flag[10] &pl_ddr_rd_en & pl_ddr_rd_data[31]) , .rd_en(rd_en10) , .dout(rd_data10), .full() , .empty(), .data_count(fifo_cont10),.prog_full(prog_full10) , .valid(valid10 ));
fifo_256x32 my_fifo_256x32_11 (.clk(ps_clk), .srst(!ps_rst) , .din(pl_ddr_rd_data) , .wr_en(w_en_flag[11] &pl_ddr_rd_en & pl_ddr_rd_data[31]) , .rd_en(rd_en11) , .dout(rd_data11), .full() , .empty(), .data_count(fifo_cont11),.prog_full(prog_full11) , .valid(valid11 ));
fifo_256x32 my_fifo_256x32_12 (.clk(ps_clk), .srst(!ps_rst) , .din(pl_ddr_rd_data) , .wr_en(w_en_flag[12] &pl_ddr_rd_en & pl_ddr_rd_data[31]) , .rd_en(rd_en12) , .dout(rd_data12), .full() , .empty(), .data_count(fifo_cont12),.prog_full(prog_full12) , .valid(valid12 ));
fifo_256x32 my_fifo_256x32_13 (.clk(ps_clk), .srst(!ps_rst) , .din(pl_ddr_rd_data) , .wr_en(w_en_flag[13] &pl_ddr_rd_en & pl_ddr_rd_data[31]) , .rd_en(rd_en13) , .dout(rd_data13), .full() , .empty(), .data_count(fifo_cont13),.prog_full(prog_full13) , .valid(valid13 ));
fifo_256x32 my_fifo_256x32_14 (.clk(ps_clk), .srst(!ps_rst) , .din(pl_ddr_rd_data) , .wr_en(w_en_flag[14] &pl_ddr_rd_en & pl_ddr_rd_data[31]) , .rd_en(rd_en14) , .dout(rd_data14), .full() , .empty(), .data_count(fifo_cont14),.prog_full(prog_full14) , .valid(valid14 ));
fifo_256x32 my_fifo_256x32_15 (.clk(ps_clk), .srst(!ps_rst) , .din(pl_ddr_rd_data) , .wr_en(w_en_flag[15] &pl_ddr_rd_en & pl_ddr_rd_data[31]) , .rd_en(rd_en15) , .dout(rd_data15), .full() , .empty(), .data_count(fifo_cont15),.prog_full(prog_full15) , .valid(valid15 ));
fifo_256x32 my_fifo_256x32_16 (.clk(ps_clk), .srst(!ps_rst) , .din(pl_ddr_rd_data) , .wr_en(w_en_flag[16] &pl_ddr_rd_en & pl_ddr_rd_data[31]) , .rd_en(rd_en16) , .dout(rd_data16), .full() , .empty(), .data_count(fifo_cont16),.prog_full(prog_full16) , .valid(valid16 ));
fifo_256x32 my_fifo_256x32_17 (.clk(ps_clk), .srst(!ps_rst) , .din(pl_ddr_rd_data) , .wr_en(w_en_flag[17] &pl_ddr_rd_en & pl_ddr_rd_data[31]) , .rd_en(rd_en17) , .dout(rd_data17), .full() , .empty(), .data_count(fifo_cont17),.prog_full(prog_full17) , .valid(valid17 ));
fifo_256x32 my_fifo_256x32_18 (.clk(ps_clk), .srst(!ps_rst) , .din(pl_ddr_rd_data) , .wr_en(w_en_flag[18] &pl_ddr_rd_en & pl_ddr_rd_data[31]) , .rd_en(rd_en18) , .dout(rd_data18), .full() , .empty(), .data_count(fifo_cont18),.prog_full(prog_full18) , .valid(valid18 ));
fifo_256x32 my_fifo_256x32_19 (.clk(ps_clk), .srst(!ps_rst) , .din(pl_ddr_rd_data) , .wr_en(w_en_flag[19] &pl_ddr_rd_en & pl_ddr_rd_data[31]) , .rd_en(rd_en19) , .dout(rd_data19), .full() , .empty(), .data_count(fifo_cont19),.prog_full(prog_full19) , .valid(valid19 ));
fifo_256x32 my_fifo_256x32_20 (.clk(ps_clk), .srst(!ps_rst) , .din(pl_ddr_rd_data) , .wr_en(w_en_flag[20] &pl_ddr_rd_en & pl_ddr_rd_data[31]) , .rd_en(rd_en20) , .dout(rd_data20), .full() , .empty(), .data_count(fifo_cont20),.prog_full(prog_full20) , .valid(valid20 ));
fifo_256x32 my_fifo_256x32_21 (.clk(ps_clk), .srst(!ps_rst) , .din(pl_ddr_rd_data) , .wr_en(w_en_flag[21] &pl_ddr_rd_en & pl_ddr_rd_data[31]) , .rd_en(rd_en21) , .dout(rd_data21), .full() , .empty(), .data_count(fifo_cont21),.prog_full(prog_full21) , .valid(valid21 ));
fifo_256x32 my_fifo_256x32_22 (.clk(ps_clk), .srst(!ps_rst) , .din(pl_ddr_rd_data) , .wr_en(w_en_flag[22] &pl_ddr_rd_en & pl_ddr_rd_data[31]) , .rd_en(rd_en22) , .dout(rd_data22), .full() , .empty(), .data_count(fifo_cont22),.prog_full(prog_full22) , .valid(valid22 ));
fifo_256x32 my_fifo_256x32_23 (.clk(ps_clk), .srst(!ps_rst) , .din(pl_ddr_rd_data) , .wr_en(w_en_flag[23] &pl_ddr_rd_en & pl_ddr_rd_data[31]) , .rd_en(rd_en23) , .dout(rd_data23), .full() , .empty(), .data_count(fifo_cont23),.prog_full(prog_full23) , .valid(valid23 ));
fifo_256x32 my_fifo_256x32_24 (.clk(ps_clk), .srst(!ps_rst) , .din(pl_ddr_rd_data) , .wr_en(w_en_flag[24] &pl_ddr_rd_en & pl_ddr_rd_data[31]) , .rd_en(rd_en24) , .dout(rd_data24), .full() , .empty(), .data_count(fifo_cont24),.prog_full(prog_full24) , .valid(valid24 ));
fifo_256x32 my_fifo_256x32_25 (.clk(ps_clk), .srst(!ps_rst) , .din(pl_ddr_rd_data) , .wr_en(w_en_flag[25] &pl_ddr_rd_en & pl_ddr_rd_data[31]) , .rd_en(rd_en25) , .dout(rd_data25), .full() , .empty(), .data_count(fifo_cont25),.prog_full(prog_full25) , .valid(valid25 ));
fifo_256x32 my_fifo_256x32_26 (.clk(ps_clk), .srst(!ps_rst) , .din(pl_ddr_rd_data) , .wr_en(w_en_flag[26] &pl_ddr_rd_en & pl_ddr_rd_data[31]) , .rd_en(rd_en26) , .dout(rd_data26), .full() , .empty(), .data_count(fifo_cont26),.prog_full(prog_full26) , .valid(valid26 ));
fifo_256x32 my_fifo_256x32_27 (.clk(ps_clk), .srst(!ps_rst) , .din(pl_ddr_rd_data) , .wr_en(w_en_flag[27] &pl_ddr_rd_en & pl_ddr_rd_data[31]) , .rd_en(rd_en27) , .dout(rd_data27), .full() , .empty(), .data_count(fifo_cont27),.prog_full(prog_full27) , .valid(valid27 ));
fifo_256x32 my_fifo_256x32_28 (.clk(ps_clk), .srst(!ps_rst) , .din(pl_ddr_rd_data) , .wr_en(w_en_flag[28] &pl_ddr_rd_en & pl_ddr_rd_data[31]) , .rd_en(rd_en28) , .dout(rd_data28), .full() , .empty(), .data_count(fifo_cont28),.prog_full(prog_full28) , .valid(valid28 ));
fifo_256x32 my_fifo_256x32_29 (.clk(ps_clk), .srst(!ps_rst) , .din(pl_ddr_rd_data) , .wr_en(w_en_flag[29] &pl_ddr_rd_en & pl_ddr_rd_data[31]) , .rd_en(rd_en29) , .dout(rd_data29), .full() , .empty(), .data_count(fifo_cont29),.prog_full(prog_full29) , .valid(valid29 ));
fifo_256x32 my_fifo_256x32_30 (.clk(ps_clk), .srst(!ps_rst) , .din(pl_ddr_rd_data) , .wr_en(w_en_flag[30] &pl_ddr_rd_en & pl_ddr_rd_data[31]) , .rd_en(rd_en30) , .dout(rd_data30), .full() , .empty(), .data_count(fifo_cont30),.prog_full(prog_full30) , .valid(valid30 ));
fifo_256x32 my_fifo_256x32_31 (.clk(ps_clk), .srst(!ps_rst) , .din(pl_ddr_rd_data) , .wr_en(w_en_flag[31] &pl_ddr_rd_en & pl_ddr_rd_data[31]) , .rd_en(rd_en31) , .dout(rd_data31), .full() , .empty(), .data_count(fifo_cont31),.prog_full(prog_full31) , .valid(valid31 ));
fifo_256x32 my_fifo_256x32_32 (.clk(ps_clk), .srst(!ps_rst) , .din(pl_ddr_rd_data) , .wr_en(w_en_flag[32] &pl_ddr_rd_en & pl_ddr_rd_data[31]) , .rd_en(rd_en32) , .dout(rd_data32), .full() , .empty(), .data_count(fifo_cont32),.prog_full(prog_full32) , .valid(valid32 ));
fifo_256x32 my_fifo_256x32_33 (.clk(ps_clk), .srst(!ps_rst) , .din(pl_ddr_rd_data) , .wr_en(w_en_flag[33] &pl_ddr_rd_en & pl_ddr_rd_data[31]) , .rd_en(rd_en33) , .dout(rd_data33), .full() , .empty(), .data_count(fifo_cont33),.prog_full(prog_full33) , .valid(valid33 ));
fifo_256x32 my_fifo_256x32_34 (.clk(ps_clk), .srst(!ps_rst) , .din(pl_ddr_rd_data) , .wr_en(w_en_flag[34] &pl_ddr_rd_en & pl_ddr_rd_data[31]) , .rd_en(rd_en34) , .dout(rd_data34), .full() , .empty(), .data_count(fifo_cont34),.prog_full(prog_full34) , .valid(valid34 ));
fifo_256x32 my_fifo_256x32_35 (.clk(ps_clk), .srst(!ps_rst) , .din(pl_ddr_rd_data) , .wr_en(w_en_flag[35] &pl_ddr_rd_en & pl_ddr_rd_data[31]) , .rd_en(rd_en35) , .dout(rd_data35), .full() , .empty(), .data_count(fifo_cont35),.prog_full(prog_full35) , .valid(valid35 ));
fifo_256x32 my_fifo_256x32_36 (.clk(ps_clk), .srst(!ps_rst) , .din(pl_ddr_rd_data) , .wr_en(w_en_flag[36] &pl_ddr_rd_en & pl_ddr_rd_data[31]) , .rd_en(rd_en36) , .dout(rd_data36), .full() , .empty(), .data_count(fifo_cont36),.prog_full(prog_full36) , .valid(valid36 ));
fifo_256x32 my_fifo_256x32_37 (.clk(ps_clk), .srst(!ps_rst) , .din(pl_ddr_rd_data) , .wr_en(w_en_flag[37] &pl_ddr_rd_en & pl_ddr_rd_data[31]) , .rd_en(rd_en37) , .dout(rd_data37), .full() , .empty(), .data_count(fifo_cont37),.prog_full(prog_full37) , .valid(valid37 ));
fifo_256x32 my_fifo_256x32_38 (.clk(ps_clk), .srst(!ps_rst) , .din(pl_ddr_rd_data) , .wr_en(w_en_flag[38] &pl_ddr_rd_en & pl_ddr_rd_data[31]) , .rd_en(rd_en38) , .dout(rd_data38), .full() , .empty(), .data_count(fifo_cont38),.prog_full(prog_full38) , .valid(valid38 ));
fifo_256x32 my_fifo_256x32_39 (.clk(ps_clk), .srst(!ps_rst) , .din(pl_ddr_rd_data) , .wr_en(w_en_flag[39] &pl_ddr_rd_en & pl_ddr_rd_data[31]) , .rd_en(rd_en39) , .dout(rd_data39), .full() , .empty(), .data_count(fifo_cont39),.prog_full(prog_full39) , .valid(valid39 ));
fifo_256x32 my_fifo_256x32_40 (.clk(ps_clk), .srst(!ps_rst) , .din(pl_ddr_rd_data) , .wr_en(w_en_flag[40] &pl_ddr_rd_en & pl_ddr_rd_data[31]) , .rd_en(rd_en40) , .dout(rd_data40), .full() , .empty(), .data_count(fifo_cont40),.prog_full(prog_full40) , .valid(valid40 ));
fifo_256x32 my_fifo_256x32_41 (.clk(ps_clk), .srst(!ps_rst) , .din(pl_ddr_rd_data) , .wr_en(w_en_flag[41] &pl_ddr_rd_en & pl_ddr_rd_data[31]) , .rd_en(rd_en41) , .dout(rd_data41), .full() , .empty(), .data_count(fifo_cont41),.prog_full(prog_full41) , .valid(valid41 ));
fifo_256x32 my_fifo_256x32_42 (.clk(ps_clk), .srst(!ps_rst) , .din(pl_ddr_rd_data) , .wr_en(w_en_flag[42] &pl_ddr_rd_en & pl_ddr_rd_data[31]) , .rd_en(rd_en42) , .dout(rd_data42), .full() , .empty(), .data_count(fifo_cont42),.prog_full(prog_full42) , .valid(valid42 ));
fifo_256x32 my_fifo_256x32_43 (.clk(ps_clk), .srst(!ps_rst) , .din(pl_ddr_rd_data) , .wr_en(w_en_flag[43] &pl_ddr_rd_en & pl_ddr_rd_data[31]) , .rd_en(rd_en43) , .dout(rd_data43), .full() , .empty(), .data_count(fifo_cont43),.prog_full(prog_full43) , .valid(valid43 ));
fifo_256x32 my_fifo_256x32_44 (.clk(ps_clk), .srst(!ps_rst) , .din(pl_ddr_rd_data) , .wr_en(w_en_flag[44] &pl_ddr_rd_en & pl_ddr_rd_data[31]) , .rd_en(rd_en44) , .dout(rd_data44), .full() , .empty(), .data_count(fifo_cont44),.prog_full(prog_full44) , .valid(valid44 ));
fifo_256x32 my_fifo_256x32_45 (.clk(ps_clk), .srst(!ps_rst) , .din(pl_ddr_rd_data) , .wr_en(w_en_flag[45] &pl_ddr_rd_en & pl_ddr_rd_data[31]) , .rd_en(rd_en45) , .dout(rd_data45), .full() , .empty(), .data_count(fifo_cont45),.prog_full(prog_full45) , .valid(valid45 ));
fifo_256x32 my_fifo_256x32_46 (.clk(ps_clk), .srst(!ps_rst) , .din(pl_ddr_rd_data) , .wr_en(w_en_flag[46] &pl_ddr_rd_en & pl_ddr_rd_data[31]) , .rd_en(rd_en46) , .dout(rd_data46), .full() , .empty(), .data_count(fifo_cont46),.prog_full(prog_full46) , .valid(valid46 ));
fifo_256x32 my_fifo_256x32_47 (.clk(ps_clk), .srst(!ps_rst) , .din(pl_ddr_rd_data) , .wr_en(w_en_flag[47] &pl_ddr_rd_en & pl_ddr_rd_data[31]) , .rd_en(rd_en47) , .dout(rd_data47), .full() , .empty(), .data_count(fifo_cont47),.prog_full(prog_full47) , .valid(valid47 ));
fifo_256x32 my_fifo_256x32_48 (.clk(ps_clk), .srst(!ps_rst) , .din(pl_ddr_rd_data) , .wr_en(w_en_flag[48] &pl_ddr_rd_en & pl_ddr_rd_data[31]) , .rd_en(rd_en48) , .dout(rd_data48), .full() , .empty(), .data_count(fifo_cont48),.prog_full(prog_full48) , .valid(valid48 ));
fifo_256x32 my_fifo_256x32_49 (.clk(ps_clk), .srst(!ps_rst) , .din(pl_ddr_rd_data) , .wr_en(w_en_flag[49] &pl_ddr_rd_en & pl_ddr_rd_data[31]) , .rd_en(rd_en49) , .dout(rd_data49), .full() , .empty(), .data_count(fifo_cont49),.prog_full(prog_full49) , .valid(valid49 ));
fifo_256x32 my_fifo_256x32_50 (.clk(ps_clk), .srst(!ps_rst) , .din(pl_ddr_rd_data) , .wr_en(w_en_flag[50] &pl_ddr_rd_en & pl_ddr_rd_data[31]) , .rd_en(rd_en50) , .dout(rd_data50), .full() , .empty(), .data_count(fifo_cont50),.prog_full(prog_full50) , .valid(valid50 ));
fifo_256x32 my_fifo_256x32_51 (.clk(ps_clk), .srst(!ps_rst) , .din(pl_ddr_rd_data) , .wr_en(w_en_flag[51] &pl_ddr_rd_en & pl_ddr_rd_data[31]) , .rd_en(rd_en51) , .dout(rd_data51), .full() , .empty(), .data_count(fifo_cont51),.prog_full(prog_full51) , .valid(valid51 ));
fifo_256x32 my_fifo_256x32_52 (.clk(ps_clk), .srst(!ps_rst) , .din(pl_ddr_rd_data) , .wr_en(w_en_flag[52] &pl_ddr_rd_en & pl_ddr_rd_data[31]) , .rd_en(rd_en52) , .dout(rd_data52), .full() , .empty(), .data_count(fifo_cont52),.prog_full(prog_full52) , .valid(valid52 ));
fifo_256x32 my_fifo_256x32_53 (.clk(ps_clk), .srst(!ps_rst) , .din(pl_ddr_rd_data) , .wr_en(w_en_flag[53] &pl_ddr_rd_en & pl_ddr_rd_data[31]) , .rd_en(rd_en53) , .dout(rd_data53), .full() , .empty(), .data_count(fifo_cont53),.prog_full(prog_full53) , .valid(valid53 ));
fifo_256x32 my_fifo_256x32_54 (.clk(ps_clk), .srst(!ps_rst) , .din(pl_ddr_rd_data) , .wr_en(w_en_flag[54] &pl_ddr_rd_en & pl_ddr_rd_data[31]) , .rd_en(rd_en54) , .dout(rd_data54), .full() , .empty(), .data_count(fifo_cont54),.prog_full(prog_full54) , .valid(valid54 ));
fifo_256x32 my_fifo_256x32_55 (.clk(ps_clk), .srst(!ps_rst) , .din(pl_ddr_rd_data) , .wr_en(w_en_flag[55] &pl_ddr_rd_en & pl_ddr_rd_data[31]) , .rd_en(rd_en55) , .dout(rd_data55), .full() , .empty(), .data_count(fifo_cont55),.prog_full(prog_full55) , .valid(valid55 ));
fifo_256x32 my_fifo_256x32_56 (.clk(ps_clk), .srst(!ps_rst) , .din(pl_ddr_rd_data) , .wr_en(w_en_flag[56] &pl_ddr_rd_en & pl_ddr_rd_data[31]) , .rd_en(rd_en56) , .dout(rd_data56), .full() , .empty(), .data_count(fifo_cont56),.prog_full(prog_full56) , .valid(valid56 ));
fifo_256x32 my_fifo_256x32_57 (.clk(ps_clk), .srst(!ps_rst) , .din(pl_ddr_rd_data) , .wr_en(w_en_flag[57] &pl_ddr_rd_en & pl_ddr_rd_data[31]) , .rd_en(rd_en57) , .dout(rd_data57), .full() , .empty(), .data_count(fifo_cont57),.prog_full(prog_full57) , .valid(valid57 ));
fifo_256x32 my_fifo_256x32_58 (.clk(ps_clk), .srst(!ps_rst) , .din(pl_ddr_rd_data) , .wr_en(w_en_flag[58] &pl_ddr_rd_en & pl_ddr_rd_data[31]) , .rd_en(rd_en58) , .dout(rd_data58), .full() , .empty(), .data_count(fifo_cont58),.prog_full(prog_full58) , .valid(valid58 ));
fifo_256x32 my_fifo_256x32_59 (.clk(ps_clk), .srst(!ps_rst) , .din(pl_ddr_rd_data) , .wr_en(w_en_flag[59] &pl_ddr_rd_en & pl_ddr_rd_data[31]) , .rd_en(rd_en59) , .dout(rd_data59), .full() , .empty(), .data_count(fifo_cont59),.prog_full(prog_full59) , .valid(valid59 ));
fifo_256x32 my_fifo_256x32_60 (.clk(ps_clk), .srst(!ps_rst) , .din(pl_ddr_rd_data) , .wr_en(w_en_flag[60] &pl_ddr_rd_en & pl_ddr_rd_data[31]) , .rd_en(rd_en60) , .dout(rd_data60), .full() , .empty(), .data_count(fifo_cont60),.prog_full(prog_full60) , .valid(valid60 ));
fifo_256x32 my_fifo_256x32_61 (.clk(ps_clk), .srst(!ps_rst) , .din(pl_ddr_rd_data) , .wr_en(w_en_flag[61] &pl_ddr_rd_en & pl_ddr_rd_data[31]) , .rd_en(rd_en61) , .dout(rd_data61), .full() , .empty(), .data_count(fifo_cont61),.prog_full(prog_full61) , .valid(valid61 ));
fifo_256x32 my_fifo_256x32_62 (.clk(ps_clk), .srst(!ps_rst) , .din(pl_ddr_rd_data) , .wr_en(w_en_flag[62] &pl_ddr_rd_en & pl_ddr_rd_data[31]) , .rd_en(rd_en62) , .dout(rd_data62), .full() , .empty(), .data_count(fifo_cont62),.prog_full(prog_full62) , .valid(valid62 ));
fifo_256x32 my_fifo_256x32_63 (.clk(ps_clk), .srst(!ps_rst) , .din(pl_ddr_rd_data) , .wr_en(w_en_flag[63] &pl_ddr_rd_en & pl_ddr_rd_data[31]) , .rd_en(rd_en63) , .dout(rd_data63), .full() , .empty(), .data_count(fifo_cont63),.prog_full(prog_full63) , .valid(valid63 ));
fifo_256x32 my_fifo_256x32_64 (.clk(ps_clk), .srst(!ps_rst) , .din(pl_ddr_rd_data) , .wr_en(w_en_flag[64] &pl_ddr_rd_en & pl_ddr_rd_data[31]) , .rd_en(rd_en64) , .dout(rd_data64), .full() , .empty(), .data_count(fifo_cont64),.prog_full(prog_full64) , .valid(valid64 ));
fifo_256x32 my_fifo_256x32_65 (.clk(ps_clk), .srst(!ps_rst) , .din(pl_ddr_rd_data) , .wr_en(w_en_flag[65] &pl_ddr_rd_en & pl_ddr_rd_data[31]) , .rd_en(rd_en65) , .dout(rd_data65), .full() , .empty(), .data_count(fifo_cont65),.prog_full(prog_full65) , .valid(valid65 ));
fifo_256x32 my_fifo_256x32_66 (.clk(ps_clk), .srst(!ps_rst) , .din(pl_ddr_rd_data) , .wr_en(w_en_flag[66] &pl_ddr_rd_en & pl_ddr_rd_data[31]) , .rd_en(rd_en66) , .dout(rd_data66), .full() , .empty(), .data_count(fifo_cont66),.prog_full(prog_full66) , .valid(valid66 ));
fifo_256x32 my_fifo_256x32_67 (.clk(ps_clk), .srst(!ps_rst) , .din(pl_ddr_rd_data) , .wr_en(w_en_flag[67] &pl_ddr_rd_en & pl_ddr_rd_data[31]) , .rd_en(rd_en67) , .dout(rd_data67), .full() , .empty(), .data_count(fifo_cont67),.prog_full(prog_full67) , .valid(valid67 ));
fifo_256x32 my_fifo_256x32_68 (.clk(ps_clk), .srst(!ps_rst) , .din(pl_ddr_rd_data) , .wr_en(w_en_flag[68] &pl_ddr_rd_en & pl_ddr_rd_data[31]) , .rd_en(rd_en68) , .dout(rd_data68), .full() , .empty(), .data_count(fifo_cont68),.prog_full(prog_full68) , .valid(valid68 ));
fifo_256x32 my_fifo_256x32_69 (.clk(ps_clk), .srst(!ps_rst) , .din(pl_ddr_rd_data) , .wr_en(w_en_flag[69] &pl_ddr_rd_en & pl_ddr_rd_data[31]) , .rd_en(rd_en69) , .dout(rd_data69), .full() , .empty(), .data_count(fifo_cont69),.prog_full(prog_full69) , .valid(valid69 ));
fifo_256x32 my_fifo_256x32_70 (.clk(ps_clk), .srst(!ps_rst) , .din(pl_ddr_rd_data) , .wr_en(w_en_flag[70] &pl_ddr_rd_en & pl_ddr_rd_data[31]) , .rd_en(rd_en70) , .dout(rd_data70), .full() , .empty(), .data_count(fifo_cont70),.prog_full(prog_full70) , .valid(valid70 ));
fifo_256x32 my_fifo_256x32_71 (.clk(ps_clk), .srst(!ps_rst) , .din(pl_ddr_rd_data) , .wr_en(w_en_flag[71] &pl_ddr_rd_en & pl_ddr_rd_data[31]) , .rd_en(rd_en71) , .dout(rd_data71), .full() , .empty(), .data_count(fifo_cont71),.prog_full(prog_full71) , .valid(valid71 ));
fifo_256x32 my_fifo_256x32_72 (.clk(ps_clk), .srst(!ps_rst) , .din(pl_ddr_rd_data) , .wr_en(w_en_flag[72] &pl_ddr_rd_en & pl_ddr_rd_data[31]) , .rd_en(rd_en72) , .dout(rd_data72), .full() , .empty(), .data_count(fifo_cont72),.prog_full(prog_full72) , .valid(valid72 ));
fifo_256x32 my_fifo_256x32_73 (.clk(ps_clk), .srst(!ps_rst) , .din(pl_ddr_rd_data) , .wr_en(w_en_flag[73] &pl_ddr_rd_en & pl_ddr_rd_data[31]) , .rd_en(rd_en73) , .dout(rd_data73), .full() , .empty(), .data_count(fifo_cont73),.prog_full(prog_full73) , .valid(valid73 ));
fifo_256x32 my_fifo_256x32_74 (.clk(ps_clk), .srst(!ps_rst) , .din(pl_ddr_rd_data) , .wr_en(w_en_flag[74] &pl_ddr_rd_en & pl_ddr_rd_data[31]) , .rd_en(rd_en74) , .dout(rd_data74), .full() , .empty(), .data_count(fifo_cont74),.prog_full(prog_full74) , .valid(valid74 ));
fifo_256x32 my_fifo_256x32_75 (.clk(ps_clk), .srst(!ps_rst) , .din(pl_ddr_rd_data) , .wr_en(w_en_flag[75] &pl_ddr_rd_en & pl_ddr_rd_data[31]) , .rd_en(rd_en75) , .dout(rd_data75), .full() , .empty(), .data_count(fifo_cont75),.prog_full(prog_full75) , .valid(valid75 ));
fifo_256x32 my_fifo_256x32_76 (.clk(ps_clk), .srst(!ps_rst) , .din(pl_ddr_rd_data) , .wr_en(w_en_flag[76] &pl_ddr_rd_en & pl_ddr_rd_data[31]) , .rd_en(rd_en76) , .dout(rd_data76), .full() , .empty(), .data_count(fifo_cont76),.prog_full(prog_full76) , .valid(valid76 ));
fifo_256x32 my_fifo_256x32_77 (.clk(ps_clk), .srst(!ps_rst) , .din(pl_ddr_rd_data) , .wr_en(w_en_flag[77] &pl_ddr_rd_en & pl_ddr_rd_data[31]) , .rd_en(rd_en77) , .dout(rd_data77), .full() , .empty(), .data_count(fifo_cont77),.prog_full(prog_full77) , .valid(valid77 ));
fifo_256x32 my_fifo_256x32_78 (.clk(ps_clk), .srst(!ps_rst) , .din(pl_ddr_rd_data) , .wr_en(w_en_flag[78] &pl_ddr_rd_en & pl_ddr_rd_data[31]) , .rd_en(rd_en78) , .dout(rd_data78), .full() , .empty(), .data_count(fifo_cont78),.prog_full(prog_full78) , .valid(valid78 ));
fifo_256x32 my_fifo_256x32_79 (.clk(ps_clk), .srst(!ps_rst) , .din(pl_ddr_rd_data) , .wr_en(w_en_flag[79] &pl_ddr_rd_en & pl_ddr_rd_data[31]) , .rd_en(rd_en79) , .dout(rd_data79), .full() , .empty(), .data_count(fifo_cont79),.prog_full(prog_full79) , .valid(valid79 ));	
	
dist_ram_psaddr  my_dist_ram_psaddr
(
.a       (w_addr    ) ,
.d       (w_data    ) ,
.dpra    (r_addr ) ,
.clk     (ps_clk  ) ,
.we      (we   ) ,
.dpo     (r_data  ) 

);	
 ila_ps_wt  ila_ps_wt(
.clk        (ps_clk),

.probe0       (ps_ddr_wr_addr),
.probe1       (ps_ddr_wr_length),
.probe2       (ps_ddr_wr_data),
.probe3       (ps_ddr_wr_en),
.probe4       (cont0),
.probe5       (rd_state)
);	
	
endmodule
