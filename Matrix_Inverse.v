`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Neel Shukla
// 
// Create Date:    10:32:25 10/06/2016 
// Design Name: 
// Module Name:    Matrix_Inverse 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////

module Matrix_Inverse(clk, reset, data_out, address, id11,id12,id13,id14,id15,id21,id22,id23,id24,id25,id31,id32,id33,id34,id35,id41,id42,id43,id44,id45,id51,id52,id53,id54,id55);

	output reg [31:0] id11,id12,id13,id14,id15;
	output reg [31:0] id21,id22,id23,id24,id25;
	output reg [31:0] id31,id32,id33,id34,id35;
	output reg [31:0] id41,id42,id43,id44,id45;
	output reg [31:0] id51,id52,id53,id54,id55;
	output [31:0] data_out; //doesn't do anything. had to take as output of ipcore
	input clk, reset;
	input [4:0] address;
	
	reg [31:0] data_in[0:4][0:4];
	reg [31:0] temp_i[0:4][0:4];
	reg [31:0] ans_tmp[0:4][0:4];
   reg [31:0] Mat[0:25],Mat_inverse[0:24];
	
	
	reg [31:0] x;
	reg [31:0] y;

	Matrix_ROM MAT (
	  .clka(clk), // input clka
	  .addra(address), // input [4 : 0] addra
	  .douta(data_out) // output [31 : 0] douta
	);

	always@(posedge clk)
	begin
		 temp_i[0][0] = 32'd1;
		 temp_i[0][1] = 32'd0;
		 temp_i[0][2] = 32'd0;
		 temp_i[0][3] = 32'd0;
		 temp_i[0][4] = 32'd0;

		 temp_i[1][0] = 32'd0;
		 temp_i[1][1] = 32'd1;
		 temp_i[1][2] = 32'd0;
		 temp_i[1][3] = 32'd0;
		 temp_i[1][4] = 32'd0;

		 temp_i[2][0] = 32'd0;
		 temp_i[2][1] = 32'd0;
		 temp_i[2][2] = 32'd1;
		 temp_i[2][3] = 32'd0;
		 temp_i[2][4] = 32'd0;

		 temp_i[3][0] = 32'd0;
		 temp_i[3][1] = 32'd0;
		 temp_i[3][2] = 32'd0;
		 temp_i[3][3] = 32'd1;
		 temp_i[3][4] = 32'd0;

		 temp_i[4][0] = 32'd0;
		 temp_i[4][1] = 32'd0;
		 temp_i[4][2] = 32'd0;
		 temp_i[4][3] = 32'd0;
		 temp_i[4][4] = 32'd1;

		if(reset==1'b0)
		begin
			Mat[address] <= data_out;
		end
		
		else
		begin
			data_in[0][0] = Mat[1];
			data_in[0][1] = Mat[2];
			data_in[0][2] = Mat[3];
			data_in[0][3] = Mat[4];
			data_in[0][4] = Mat[5];

			data_in[1][0] = Mat[6];
			data_in[1][1] = Mat[7];
			data_in[1][2] = Mat[8];
			data_in[1][3] = Mat[9];
			data_in[1][4] = Mat[10];

			data_in[2][0] = Mat[11];
			data_in[2][1] = Mat[12];
			data_in[2][2] = Mat[13];
			data_in[2][3] = Mat[14];
			data_in[2][4] = Mat[15];

			data_in[3][0] = Mat[16];
			data_in[3][1] = Mat[17];
			data_in[3][2] = Mat[18];
			data_in[3][3] = Mat[19];
			data_in[3][4] = Mat[20];

			data_in[4][0] = Mat[21];
			data_in[4][1] = Mat[22];
			data_in[4][2] = Mat[23];
			data_in[4][3] = Mat[24];
			data_in[4][4] = Mat[25];

			ans_tmp[0][0] = (data_in[0][0] > 0 ? data_in[0][0] : (~data_in[0][0]+32'd1));
			ans_tmp[0][1] = (data_in[0][1] > 0 ? data_in[0][1] : (~data_in[0][1]+32'd1));
			ans_tmp[0][2] = (data_in[0][2] > 0 ? data_in[0][2] : (~data_in[0][2]+32'd1));
			ans_tmp[0][3] = (data_in[0][3] > 0 ? data_in[0][3] : (~data_in[0][3]+32'd1));
			ans_tmp[0][4] = (data_in[0][4] > 0 ? data_in[0][4] : (~data_in[0][4]+32'd1));

			ans_tmp[1][0] = (data_in[1][0] > 0 ? data_in[1][0] : (~data_in[1][0] + 32'd1));
			ans_tmp[1][1] = (data_in[1][1] > 0 ? data_in[1][1] : (~data_in[1][1] + 32'd1));
			ans_tmp[1][2] = (data_in[1][2] > 0 ? data_in[1][2] : (~data_in[1][2] + 32'd1));
			ans_tmp[1][3] = (data_in[1][3] > 0 ? data_in[1][3] : (~data_in[1][3] + 32'd1));
			ans_tmp[1][4] = (data_in[1][4] > 0 ? data_in[1][4] : (~data_in[1][4] + 32'd1));

			ans_tmp[2][0] = (data_in[2][0] > 0 ? data_in[2][0] : (~data_in[2][0] + 32'd1));
			ans_tmp[2][1] = (data_in[2][1] > 0 ? data_in[2][1] : (~data_in[2][1] + 32'd1));
			ans_tmp[2][2] = (data_in[2][2] > 0 ? data_in[2][2] : (~data_in[2][2] + 32'd1));
			ans_tmp[2][3] = (data_in[2][3] > 0 ? data_in[2][3] : (~data_in[2][3] + 32'd1));
			ans_tmp[2][4] = (data_in[2][4] > 0 ? data_in[2][4] : (~data_in[2][4] + 32'd1));

			ans_tmp[3][0] = (data_in[3][0] > 0 ? data_in[3][0] : (~data_in[3][0]+32'd1));
			ans_tmp[3][1] = (data_in[3][1] > 0 ? data_in[3][1] : (~data_in[3][1]+32'd1));
			ans_tmp[3][2] = (data_in[3][2] > 0 ? data_in[3][2] : (~data_in[3][2]+32'd1));
			ans_tmp[3][3] = (data_in[3][3] > 0 ? data_in[3][3] : (~data_in[3][3]+32'd1));
			ans_tmp[3][4] = (data_in[3][4] > 0 ? data_in[3][4] : (~data_in[3][4]+32'd1));

			ans_tmp[4][0] = (data_in[4][0] > 0 ? data_in[4][0] : (~data_in[4][0]+32'd1));
			ans_tmp[4][1] = (data_in[4][1] > 0 ? data_in[4][1] : (~data_in[4][1]+32'd1));
			ans_tmp[4][2] = (data_in[4][2] > 0 ? data_in[4][2] : (~data_in[4][2]+32'd1));
			ans_tmp[4][3] = (data_in[4][3] > 0 ? data_in[4][3] : (~data_in[4][3]+32'd1));
			ans_tmp[4][4] = (data_in[4][4] > 0 ? data_in[4][4] : (~data_in[4][4]+32'd1));



			x = ans_tmp[0][0];
			y = ans_tmp[1][0];

			ans_tmp[1][0] = x*ans_tmp[1][0] - y*ans_tmp[0][0];
			ans_tmp[1][1] = x*ans_tmp[1][1] - y*ans_tmp[0][1];
			ans_tmp[1][2] = x*ans_tmp[1][2] - y*ans_tmp[0][2];
			ans_tmp[1][3] = x*ans_tmp[1][3] - y*ans_tmp[0][3];
			ans_tmp[1][4] = x*ans_tmp[1][4] - y*ans_tmp[0][4];
			temp_i[1][0] = x*temp_i[1][0] - y*temp_i[0][0];
			temp_i[1][1] = x*temp_i[1][1] - y*temp_i[0][1];
			temp_i[1][2] = x*temp_i[1][2] - y*temp_i[0][2];
			temp_i[1][3] = x*temp_i[1][3] - y*temp_i[0][3];
			temp_i[1][4] = x*temp_i[1][4] - y*temp_i[0][4];

			x = ans_tmp[0][0];
			y = ans_tmp[2][0];

			ans_tmp[2][0] = x*ans_tmp[2][0] - y*ans_tmp[0][0];
			ans_tmp[2][1] = x*ans_tmp[2][1] - y*ans_tmp[0][1];
			ans_tmp[2][2] = x*ans_tmp[2][2] - y*ans_tmp[0][2];
			ans_tmp[2][3] = x*ans_tmp[2][3] - y*ans_tmp[0][3];
			ans_tmp[2][4] = x*ans_tmp[2][4] - y*ans_tmp[0][4];
			temp_i[2][0] = x*temp_i[2][0] - y*temp_i[0][0];
			temp_i[2][1] = x*temp_i[2][1] - y*temp_i[0][1];
			temp_i[2][2] = x*temp_i[2][2] - y*temp_i[0][2];
			temp_i[2][3] = x*temp_i[2][3] - y*temp_i[0][3];
			temp_i[2][4] = x*temp_i[2][4] - y*temp_i[0][4];

			x = ans_tmp[0][0];
			y = ans_tmp[3][0];

			ans_tmp[3][0] = x*ans_tmp[3][0] - y*ans_tmp[0][0];
			ans_tmp[3][1] = x*ans_tmp[3][1] - y*ans_tmp[0][1];
			ans_tmp[3][2] = x*ans_tmp[3][2] - y*ans_tmp[0][2];
			ans_tmp[3][3] = x*ans_tmp[3][3] - y*ans_tmp[0][3];
			ans_tmp[3][4] = x*ans_tmp[3][4] - y*ans_tmp[0][4];
			temp_i[3][0] = x*temp_i[3][0] - y*temp_i[0][0];
			temp_i[3][1] = x*temp_i[3][1] - y*temp_i[0][1];
			temp_i[3][2] = x*temp_i[3][2] - y*temp_i[0][2];
			temp_i[3][3] = x*temp_i[3][3] - y*temp_i[0][3];
			temp_i[3][4] = x*temp_i[3][4] - y*temp_i[0][4];

			x = ans_tmp[0][0];
			y = ans_tmp[4][0];

			ans_tmp[4][0] = x*ans_tmp[4][0] - y*ans_tmp[0][0];
			ans_tmp[4][1] = x*ans_tmp[4][1] - y*ans_tmp[0][1];
			ans_tmp[4][2] = x*ans_tmp[4][2] - y*ans_tmp[0][2];
			ans_tmp[4][3] = x*ans_tmp[4][3] - y*ans_tmp[0][3];
			ans_tmp[4][4] = x*ans_tmp[4][4] - y*ans_tmp[0][4];
			temp_i[4][0] = x*temp_i[4][0] - y*temp_i[0][0];
			temp_i[4][1] = x*temp_i[4][1] - y*temp_i[0][1];
			temp_i[4][2] = x*temp_i[4][2] - y*temp_i[0][2];
			temp_i[4][3] = x*temp_i[4][3] - y*temp_i[0][3];
			temp_i[4][4] = x*temp_i[4][4] - y*temp_i[0][4];


			/*         */


			x = ans_tmp[1][1];
			y = ans_tmp[0][1];

			ans_tmp[0][0] = x*ans_tmp[0][0] - y*ans_tmp[1][0];
			ans_tmp[0][1] = x*ans_tmp[0][1] - y*ans_tmp[1][1];
			ans_tmp[0][2] = x*ans_tmp[0][2] - y*ans_tmp[1][2];
			ans_tmp[0][3] = x*ans_tmp[0][3] - y*ans_tmp[1][3];
			ans_tmp[0][4] = x*ans_tmp[0][4] - y*ans_tmp[1][4];
			temp_i[0][0] = x*temp_i[0][0] - y*temp_i[1][0];
			temp_i[0][1] = x*temp_i[0][1] - y*temp_i[1][1];
			temp_i[0][2] = x*temp_i[0][2] - y*temp_i[1][2];
			temp_i[0][3] = x*temp_i[0][3] - y*temp_i[1][3];
			temp_i[0][4] = x*temp_i[0][4] - y*temp_i[1][4];

			x = ans_tmp[1][1];
			y = ans_tmp[2][1];

			ans_tmp[2][0] = x*ans_tmp[2][0] - y*ans_tmp[1][0];
			ans_tmp[2][1] = x*ans_tmp[2][1] - y*ans_tmp[1][1];
			ans_tmp[2][2] = x*ans_tmp[2][2] - y*ans_tmp[1][2];
			ans_tmp[2][3] = x*ans_tmp[2][3] - y*ans_tmp[1][3];
			ans_tmp[2][4] = x*ans_tmp[2][4] - y*ans_tmp[1][4];
			temp_i[2][0] = x*temp_i[2][0] - y*temp_i[1][0];
			temp_i[2][1] = x*temp_i[2][1] - y*temp_i[1][1];
			temp_i[2][2] = x*temp_i[2][2] - y*temp_i[1][2];
			temp_i[2][3] = x*temp_i[2][3] - y*temp_i[1][3];
			temp_i[2][4] = x*temp_i[2][4] - y*temp_i[1][4];

			x = ans_tmp[1][1];
			y = ans_tmp[3][1];

			ans_tmp[3][0] = x*ans_tmp[3][0] - y*ans_tmp[1][0];
			ans_tmp[3][1] = x*ans_tmp[3][1] - y*ans_tmp[1][1];
			ans_tmp[3][2] = x*ans_tmp[3][2] - y*ans_tmp[1][2];
			ans_tmp[3][3] = x*ans_tmp[3][3] - y*ans_tmp[1][3];
			ans_tmp[3][4] = x*ans_tmp[3][4] - y*ans_tmp[1][4];
			temp_i[3][0] = x*temp_i[3][0] - y*temp_i[1][0];
			temp_i[3][1] = x*temp_i[3][1] - y*temp_i[1][1];
			temp_i[3][2] = x*temp_i[3][2] - y*temp_i[1][2];
			temp_i[3][3] = x*temp_i[3][3] - y*temp_i[1][3];
			temp_i[3][4] = x*temp_i[3][4] - y*temp_i[1][4];

			x = ans_tmp[1][1];
			y = ans_tmp[4][1];

			ans_tmp[4][0] = x*ans_tmp[4][0] - y*ans_tmp[1][0];
			ans_tmp[4][1] = x*ans_tmp[4][1] - y*ans_tmp[1][1];
			ans_tmp[4][2] = x*ans_tmp[4][2] - y*ans_tmp[1][2];
			ans_tmp[4][3] = x*ans_tmp[4][3] - y*ans_tmp[1][3];
			ans_tmp[4][4] = x*ans_tmp[4][4] - y*ans_tmp[1][4];
			temp_i[4][0] = x*temp_i[4][0] - y*temp_i[1][0];
			temp_i[4][1] = x*temp_i[4][1] - y*temp_i[1][1];
			temp_i[4][2] = x*temp_i[4][2] - y*temp_i[1][2];
			temp_i[4][3] = x*temp_i[4][3] - y*temp_i[1][3];
			temp_i[4][4] = x*temp_i[4][4] - y*temp_i[1][4];


			/*         */


			x = ans_tmp[2][2];
			y = ans_tmp[0][2];

			ans_tmp[0][0] = x*ans_tmp[0][0] - y*ans_tmp[2][0];
			ans_tmp[0][1] = x*ans_tmp[0][1] - y*ans_tmp[2][1];
			ans_tmp[0][2] = x*ans_tmp[0][2] - y*ans_tmp[2][2];
			ans_tmp[0][3] = x*ans_tmp[0][3] - y*ans_tmp[2][3];
			ans_tmp[0][4] = x*ans_tmp[0][4] - y*ans_tmp[2][4];
			temp_i[0][0] = x*temp_i[0][0] - y*temp_i[2][0];
			temp_i[0][1] = x*temp_i[0][1] - y*temp_i[2][1];
			temp_i[0][2] = x*temp_i[0][2] - y*temp_i[2][2];
			temp_i[0][3] = x*temp_i[0][3] - y*temp_i[2][3];
			temp_i[0][4] = x*temp_i[0][4] - y*temp_i[2][4];

			x = ans_tmp[2][2];
			y = ans_tmp[1][2];

			ans_tmp[1][0] = x*ans_tmp[1][0] - y*ans_tmp[2][0];
			ans_tmp[1][1] = x*ans_tmp[1][1] - y*ans_tmp[2][1];
			ans_tmp[1][2] = x*ans_tmp[1][2] - y*ans_tmp[2][2];
			ans_tmp[1][3] = x*ans_tmp[1][3] - y*ans_tmp[2][3];
			ans_tmp[1][4] = x*ans_tmp[1][4] - y*ans_tmp[2][4];
			temp_i[1][0] = x*temp_i[1][0] - y*temp_i[2][0];
			temp_i[1][1] = x*temp_i[1][1] - y*temp_i[2][1];
			temp_i[1][2] = x*temp_i[1][2] - y*temp_i[2][2];
			temp_i[1][3] = x*temp_i[1][3] - y*temp_i[2][3];
			temp_i[1][4] = x*temp_i[1][4] - y*temp_i[2][4];

			x = ans_tmp[2][2];
			y = ans_tmp[3][2];

			ans_tmp[3][0] = x*ans_tmp[3][0] - y*ans_tmp[2][0];
			ans_tmp[3][1] = x*ans_tmp[3][1] - y*ans_tmp[2][1];
			ans_tmp[3][2] = x*ans_tmp[3][2] - y*ans_tmp[2][2];
			ans_tmp[3][3] = x*ans_tmp[3][3] - y*ans_tmp[2][3];
			ans_tmp[3][4] = x*ans_tmp[3][4] - y*ans_tmp[2][4];
			temp_i[3][0] = x*temp_i[3][0] - y*temp_i[2][0];
			temp_i[3][1] = x*temp_i[3][1] - y*temp_i[2][1];
			temp_i[3][2] = x*temp_i[3][2] - y*temp_i[2][2];
			temp_i[3][3] = x*temp_i[3][3] - y*temp_i[2][3];
			temp_i[3][4] = x*temp_i[3][4] - y*temp_i[2][4];

			x = ans_tmp[2][2];
			y = ans_tmp[4][2];

			ans_tmp[4][0] = x*ans_tmp[4][0] - y*ans_tmp[2][0];
			ans_tmp[4][1] = x*ans_tmp[4][1] - y*ans_tmp[2][1];
			ans_tmp[4][2] = x*ans_tmp[4][2] - y*ans_tmp[2][2];
			ans_tmp[4][3] = x*ans_tmp[4][3] - y*ans_tmp[2][3];
			ans_tmp[4][4] = x*ans_tmp[4][4] - y*ans_tmp[2][4];
			temp_i[4][0] = x*temp_i[4][0] - y*temp_i[2][0];
			temp_i[4][1] = x*temp_i[4][1] - y*temp_i[2][1];
			temp_i[4][2] = x*temp_i[4][2] - y*temp_i[2][2];
			temp_i[4][3] = x*temp_i[4][3] - y*temp_i[2][3];
			temp_i[4][4] = x*temp_i[4][4] - y*temp_i[2][4];


			/*         */


			x = ans_tmp[3][3];
			y = ans_tmp[0][3];

			ans_tmp[0][0] = x*ans_tmp[0][0] - y*ans_tmp[3][0];
			ans_tmp[0][1] = x*ans_tmp[0][1] - y*ans_tmp[3][1];
			ans_tmp[0][2] = x*ans_tmp[0][2] - y*ans_tmp[3][2];
			ans_tmp[0][3] = x*ans_tmp[0][3] - y*ans_tmp[3][3];
			ans_tmp[0][4] = x*ans_tmp[0][4] - y*ans_tmp[3][4];
			temp_i[0][0] = x*temp_i[0][0] - y*temp_i[3][0];
			temp_i[0][1] = x*temp_i[0][1] - y*temp_i[3][1];
			temp_i[0][2] = x*temp_i[0][2] - y*temp_i[3][2];
			temp_i[0][3] = x*temp_i[0][3] - y*temp_i[3][3];
			temp_i[0][4] = x*temp_i[0][4] - y*temp_i[3][4];

			x = ans_tmp[3][3];
			y = ans_tmp[1][3];

			ans_tmp[1][0] = x*ans_tmp[1][0] - y*ans_tmp[3][0];
			ans_tmp[1][1] = x*ans_tmp[1][1] - y*ans_tmp[3][1];
			ans_tmp[1][2] = x*ans_tmp[1][2] - y*ans_tmp[3][2];
			ans_tmp[1][3] = x*ans_tmp[1][3] - y*ans_tmp[3][3];
			ans_tmp[1][4] = x*ans_tmp[1][4] - y*ans_tmp[3][4];
			temp_i[1][0] = x*temp_i[1][0] - y*temp_i[3][0];
			temp_i[1][1] = x*temp_i[1][1] - y*temp_i[3][1];
			temp_i[1][2] = x*temp_i[1][2] - y*temp_i[3][2];
			temp_i[1][3] = x*temp_i[1][3] - y*temp_i[3][3];
			temp_i[1][4] = x*temp_i[1][4] - y*temp_i[3][4];

			x = ans_tmp[3][3];
			y = ans_tmp[2][3];

			ans_tmp[2][0] = x*ans_tmp[2][0] - y*ans_tmp[3][0];
			ans_tmp[2][1] = x*ans_tmp[2][1] - y*ans_tmp[3][1];
			ans_tmp[2][2] = x*ans_tmp[2][2] - y*ans_tmp[3][2];
			ans_tmp[2][3] = x*ans_tmp[2][3] - y*ans_tmp[3][3];
			ans_tmp[2][4] = x*ans_tmp[2][4] - y*ans_tmp[3][4];
			temp_i[2][0] = x*temp_i[2][0] - y*temp_i[3][0];
			temp_i[2][1] = x*temp_i[2][1] - y*temp_i[3][1];
			temp_i[2][2] = x*temp_i[2][2] - y*temp_i[3][2];
			temp_i[2][3] = x*temp_i[2][3] - y*temp_i[3][3];
			temp_i[2][4] = x*temp_i[2][4] - y*temp_i[3][4];

			x = ans_tmp[3][3];
			y = ans_tmp[4][3];

			ans_tmp[4][0] = x*ans_tmp[4][0] - y*ans_tmp[3][0];
			ans_tmp[4][1] = x*ans_tmp[4][1] - y*ans_tmp[3][1];
			ans_tmp[4][2] = x*ans_tmp[4][2] - y*ans_tmp[3][2];
			ans_tmp[4][3] = x*ans_tmp[4][3] - y*ans_tmp[3][3];
			ans_tmp[4][4] = x*ans_tmp[4][4] - y*ans_tmp[3][4];
			temp_i[4][0] = x*temp_i[4][0] - y*temp_i[3][0];
			temp_i[4][1] = x*temp_i[4][1] - y*temp_i[3][1];
			temp_i[4][2] = x*temp_i[4][2] - y*temp_i[3][2];
			temp_i[4][3] = x*temp_i[4][3] - y*temp_i[3][3];
			temp_i[4][4] = x*temp_i[4][4] - y*temp_i[3][4];


			/*         */


			x = ans_tmp[4][4];
			y = ans_tmp[0][4];

			ans_tmp[0][0] = x*ans_tmp[0][0] - y*ans_tmp[4][0];
			ans_tmp[0][1] = x*ans_tmp[0][1] - y*ans_tmp[4][1];
			ans_tmp[0][2] = x*ans_tmp[0][2] - y*ans_tmp[4][2];
			ans_tmp[0][3] = x*ans_tmp[0][3] - y*ans_tmp[4][3];
			ans_tmp[0][4] = x*ans_tmp[0][4] - y*ans_tmp[4][4];
			temp_i[0][0] = x*temp_i[0][0] - y*temp_i[4][0];
			temp_i[0][1] = x*temp_i[0][1] - y*temp_i[4][1];
			temp_i[0][2] = x*temp_i[0][2] - y*temp_i[4][2];
			temp_i[0][3] = x*temp_i[0][3] - y*temp_i[4][3];
			temp_i[0][4] = x*temp_i[0][4] - y*temp_i[4][4];

			x = ans_tmp[4][4];
			y = ans_tmp[1][4];

			ans_tmp[1][0] = x*ans_tmp[1][0] - y*ans_tmp[4][0];
			ans_tmp[1][1] = x*ans_tmp[1][1] - y*ans_tmp[4][1];
			ans_tmp[1][2] = x*ans_tmp[1][2] - y*ans_tmp[4][2];
			ans_tmp[1][3] = x*ans_tmp[1][3] - y*ans_tmp[4][3];
			ans_tmp[1][4] = x*ans_tmp[1][4] - y*ans_tmp[4][4];
			temp_i[1][0] = x*temp_i[1][0] - y*temp_i[4][0];
			temp_i[1][1] = x*temp_i[1][1] - y*temp_i[4][1];
			temp_i[1][2] = x*temp_i[1][2] - y*temp_i[4][2];
			temp_i[1][3] = x*temp_i[1][3] - y*temp_i[4][3];
			temp_i[1][4] = x*temp_i[1][4] - y*temp_i[4][4];

			x = ans_tmp[4][4];
			y = ans_tmp[2][4];

			ans_tmp[2][0] = x*ans_tmp[2][0] - y*ans_tmp[4][0];
			ans_tmp[2][1] = x*ans_tmp[2][1] - y*ans_tmp[4][1];
			ans_tmp[2][2] = x*ans_tmp[2][2] - y*ans_tmp[4][2];
			ans_tmp[2][3] = x*ans_tmp[2][3] - y*ans_tmp[4][3];
			ans_tmp[2][4] = x*ans_tmp[2][4] - y*ans_tmp[4][4];
			temp_i[2][0] = x*temp_i[2][0] - y*temp_i[4][0];
			temp_i[2][1] = x*temp_i[2][1] - y*temp_i[4][1];
			temp_i[2][2] = x*temp_i[2][2] - y*temp_i[4][2];
			temp_i[2][3] = x*temp_i[2][3] - y*temp_i[4][3];
			temp_i[2][4] = x*temp_i[2][4] - y*temp_i[4][4];

			x = ans_tmp[4][4];
			y = ans_tmp[3][4];

			ans_tmp[3][0] = x*ans_tmp[3][0] - y*ans_tmp[4][0];
			ans_tmp[3][1] = x*ans_tmp[3][1] - y*ans_tmp[4][1];
			ans_tmp[3][2] = x*ans_tmp[3][2] - y*ans_tmp[4][2];
			ans_tmp[3][3] = x*ans_tmp[3][3] - y*ans_tmp[4][3];
			ans_tmp[3][4] = x*ans_tmp[3][4] - y*ans_tmp[4][4];
			temp_i[3][0] = x*temp_i[3][0] - y*temp_i[4][0];
			temp_i[3][1] = x*temp_i[3][1] - y*temp_i[4][1];
			temp_i[3][2] = x*temp_i[3][2] - y*temp_i[4][2];
			temp_i[3][3] = x*temp_i[3][3] - y*temp_i[4][3];
			temp_i[3][4] = x*temp_i[3][4] - y*temp_i[4][4];


			if(ans_tmp[0][0]==32'd0 || ans_tmp[1][1] == 32'd0 || ans_tmp[2][2] == 32'd0 || ans_tmp[3][3]==32'd0 || ans_tmp[4][4]==32'd0)
			begin
				id11 = 32'dx;
				id22 = 32'dx;
				id33 = 32'dx;
				id44 = 32'dx;
				id55 = 32'dx;
			end

			else
			begin
				id11 = temp_i[0][0];
				id12 = temp_i[0][1];
				id13 = temp_i[0][2];
				id14 = temp_i[0][3];
				id15 = temp_i[0][4];

				id21 = temp_i[1][0];
				id22 = temp_i[1][1];
				id23 = temp_i[1][2];
				id24 = temp_i[1][3];
				id25 = temp_i[1][4];

				id31 = temp_i[2][0];
				id32 = temp_i[2][1];
				id33 = temp_i[2][2];
				id34 = temp_i[2][3];
				id35 = temp_i[2][4];

				id41 = temp_i[3][0];
				id42 = temp_i[3][1];
				id43 = temp_i[3][2];
				id44 = temp_i[3][3];
				id45 = temp_i[3][4];

				id51 = temp_i[4][0];
				id52 = temp_i[4][1];
				id53 = temp_i[4][2];
				id54 = temp_i[4][3];
				id55 = temp_i[4][4];
			end

			Mat_inverse[0] = id11;
			Mat_inverse[1] = id12;
			Mat_inverse[2] = id13;
			Mat_inverse[3] = id14;
			Mat_inverse[4] = id15;

			Mat_inverse[5] = id21;
			Mat_inverse[6] = id22;
			Mat_inverse[7] = id23;
			Mat_inverse[8] = id24;
			Mat_inverse[9] = id25;

			Mat_inverse[10] = id31;
			Mat_inverse[11] = id32;
			Mat_inverse[12] = id33;
			Mat_inverse[13] = id34;
			Mat_inverse[14] = id35;

			Mat_inverse[15] = id41;
			Mat_inverse[16] = id42;
			Mat_inverse[17] = id43;
			Mat_inverse[18] = id44;
			Mat_inverse[19] = id45;

			Mat_inverse[20] = id51;
			Mat_inverse[21] = id52;
			Mat_inverse[22] = id53;
			Mat_inverse[23] = id54;
			Mat_inverse[24] = id55;
			
		end

	end

endmodule

/*
	wire [31:0] id11dt,id12dt,id13dt,id14dt,id15dt;
	wire [31:0] id21dt,id22dt,id23dt,id24dt,id25dt;
	wire [31:0] id31dt,id32dt,id33dt,id34dt,id35dt;
	wire [31:0] id41dt,id42dt,id43dt,id44dt,id45dt;
	wire [31:0] id51dt,id52dt,id53dt,id54dt,id55dt;*/
	/*
	wire  rid11dt,rid12dt,rid13dt,rid14dt,rid15dt;
	wire  rid21dt,rid22dt,rid23dt,rid24dt,rid25dt;
	wire  rid31dt,rid32dt,rid33dt,rid34dt,rid35dt;
	wire  rid41dt,rid42dt,rid43dt,rid44dt,rid45dt;
	wire  rid51dt,rid52dt,rid53dt,rid54dt,rid55dt;

	wire [31:0] fid11dt,fid12dt,fid13dt,fid14dt,fid15dt;
	wire [31:0] fid21dt,fid22dt,fid23dt,fid24dt,fid25dt;
	wire [31:0] fid31dt,fid32dt,fid33dt,fid34dt,fid35dt;
	wire [31:0] fid41dt,fid42dt,fid43dt,fid44dt,fid45dt;
	wire [31:0] fid51dt,fid52dt,fid53dt,fid54dt,fid55dt;*/
/*
	assign id11d = id11;
	assign id12d = id12;
	assign id13d = id13;
	assign id14d = id14;
	assign id15d = id15;

	assign id21d = id21;
	assign id22d = id22;
	assign id23d = id23;
	assign id24d = id24;
	assign id25d = id25;

	assign id31d = id31;
	assign id32d = id32;
	assign id33d = id33;
	assign id34d = id34;
	assign id35d = id35;

	assign id41d = id41;
	assign id42d = id42;
	assign id43d = id43;
	assign id44d = id44;
	assign id45d = id45;

	assign id51d = id51;
	assign id52d = id52;
	assign id53d = id53;
	assign id54d = id54;
	assign id55d = id55;

	wire [31:0] a,b,c,d,e;

	assign a = ans_tmp[0][0];
	assign b = ans_tmp[1][1];
	assign c = ans_tmp[2][2];
	assign d = ans_tmp[3][3];
	assign e = ans_tmp[4][4];


	assign id11d = id11dt;
	assign id12d = id12dt;
	assign id13d = id13dt;
	assign id14d = id14dt;
	assign id15d = id15dt;

	assign id21d = id21dt;
	assign id22d = id22dt;
	assign id23d = id23dt;
	assign id24d = id24dt;
	assign id25d = id25dt;

	assign id31d = id31dt;
	assign id32d = id32dt;
	assign id33d = id33dt;
	assign id34d = id34dt;
	assign id35d = id35dt;

	assign id41d = id41dt;
	assign id42d = id42dt;
	assign id43d = id43dt;
	assign id44d = id44dt;
	assign id45d = id45dt;

	assign id51d = id51dt;
	assign id52d = id52dt;
	assign id53d = id53dt;
	assign id54d = id54dt;
	assign id55d = id55dt;

endmodule
*/