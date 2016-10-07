`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:  Neel Shukla
//
// Create Date:   20:03:17 10/07/2016
// Design Name:   Matrix_Inverse
// Module Name:   C:/Xilinx/14.7/ISE_DS/Matrix_Inverse/Matrix_Inverse_tb.v
// Project Name:  Matrix_Inverse
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: Matrix_Inverse
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module Matrix_Inverse_tb;

	// Inputs
	reg clk;
	reg reset;
	reg [4:0] address;

	// Outputs
	wire [31:0] data_out;
	wire [31:0] id11;
	wire [31:0] id12;
	wire [31:0] id13;
	wire [31:0] id14;
	wire [31:0] id15;
	wire [31:0] id21;
	wire [31:0] id22;
	wire [31:0] id23;
	wire [31:0] id24;
	wire [31:0] id25;
	wire [31:0] id31;
	wire [31:0] id32;
	wire [31:0] id33;
	wire [31:0] id34;
	wire [31:0] id35;
	wire [31:0] id41;
	wire [31:0] id42;
	wire [31:0] id43;
	wire [31:0] id44;
	wire [31:0] id45;
	wire [31:0] id51;
	wire [31:0] id52;
	wire [31:0] id53;
	wire [31:0] id54;
	wire [31:0] id55;

	// Instantiate the Unit Under Test (UUT)
	Matrix_Inverse uut (
		.clk(clk), 
		.reset(reset), 
		.data_out(data_out), 
		.address(address), 
		.id11(id11), 
		.id12(id12), 
		.id13(id13), 
		.id14(id14), 
		.id15(id15), 
		.id21(id21), 
		.id22(id22), 
		.id23(id23), 
		.id24(id24), 
		.id25(id25), 
		.id31(id31), 
		.id32(id32), 
		.id33(id33), 
		.id34(id34), 
		.id35(id35), 
		.id41(id41), 
		.id42(id42), 
		.id43(id43), 
		.id44(id44), 
		.id45(id45), 
		.id51(id51), 
		.id52(id52), 
		.id53(id53), 
		.id54(id54), 
		.id55(id55)
	);

	always #100 clk = ~clk;
	initial begin
	
		clk = 0;
		reset=0;
		#50;
		
		address = 5'd0;		
		#200;
		
		address = 5'd1;
		#200;
		
		address = 5'd2;
		#200;
		
		address = 5'd3;
		#200;
		
		address = 5'd4;
		#200;
		
		address = 5'd5;
		#200;
		
		address = 5'd6;
		#200;
		
		address = 5'd7;
		#200;
		
		address = 5'd8;
		#200;
		
		address = 5'd9;
		#200;
		
		address = 5'd10;
		#200;
		
		address = 5'd11;
		#200;
		
		address = 5'd12;
		#200;
		
		address = 5'd13;
		#200;
		
		address = 5'd14;
		#200;
		
		address = 5'd15;
		#200;
		
		address = 5'd16;
		#200;
		
		address = 5'd17;
		#200;
		
		address = 5'd18;
		#200;
		
		address = 5'd19;
		#200;
		
		address = 5'd20;
		#200;
		
		address = 5'd21;
		#200;
		
		address = 5'd22;
		#200;
		
		address = 5'd23;
		#200;
		
		address = 5'd24;
		#200;
		
		address = 5'd25;
		#200;
		
		reset=1'b1;
		#200;
		
		reset=1'b0;
		
	end
      
endmodule
