`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   15:32:21 11/05/2020
// Design Name:   crc
// Module Name:   E:/university/3991/fpga/homeworks/CRC/test_crc.v
// Project Name:  CRC
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: crc
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module test_crc;

	// Inputs
	reg reset;
	reg clk;
	reg [3:0] data_in;

	// Outputs
	wire [4:0] crc;

	// Instantiate the Unit Under Test (UUT)
	crc uut (
		.reset(reset), 
		.clk(clk), 
		.data_in(data_in), 
		.crc(crc)
	);

	initial begin
		// Initialize Inputs
		reset = 0;
		clk = 0;
		data_in = 4'b0010;

		// Wait 100 ns for global reset to finish
		#100;
		
	
        
		// Add stimulus here

	end
	
	always #100 clk=~clk;
      
endmodule

