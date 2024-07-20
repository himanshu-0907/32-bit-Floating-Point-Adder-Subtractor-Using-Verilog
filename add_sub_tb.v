`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 28.12.2023 15:18:18
// Design Name: 
// Module Name: add_sub_tb
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


module add_sub_tb;

// Inputs
	reg [31:0] A;
	reg [31:0] B;
	reg sign;

	// Outputs
	wire Exception;
	wire Overflow;
	wire Underflow;
	wire [31:0] Result;
	
	// Instantiate the Unit Under Test (UUT)
	add_sub uut (
		.A(A), 
		.B(B), 
		.sign(sign), 
		.Exception(Exception), 
		.Overflow(Overflow), 
		.Underflow(Underflow), 
		.Result(Result)
	);

initial begin

// Initialize Inputs
		A = 32'b01000001000111001100110011001101; //9.8
		B = 32'b01000000100010011001100110011010; //4.3
		sign = 1'b0; // Addition
		#100
$display("%b    %b  %b",Result,Overflow,Underflow);
		#100;
        
		A = 32'b01000001000111001100110011001101; //9.8
		B = 32'b01000000100010011001100110011010; //4.3
		sign = 1'b1; // Subtraction
		#100
$display("%b    %b  %b",Result,Overflow,Underflow);
        #100

        A = 32'b01000001000111001100110011001101; //9.8
		B = 32'b01000001000111001100110011001101; //9.8
		sign = 1'b1; // Subtraction
		#100
$display("%b    %b  %b",Result,Overflow,Underflow);
        #100
        A = 32'b01111111100111001100110011001101; //nan
		B = 32'b01000000100010011001100110011010; //4.3
		sign = 1'b0; // Addition
		#100
$display("%b    %b  %b",Result,Overflow,Underflow);

#100
$finish;
end

endmodule
