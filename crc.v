`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:54:01 11/05/2020 
// Design Name: 
// Module Name:    crc 
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
module crc(
    input reset,
    input clk,
    input [3:0] data_in,
    output reg [4:0] crc
    );

reg s1,s2,s3,s4,s5;
wire w1,w2;
reg [2:0] counter;

initial // initial value
begin
	s1 = 0;
	s2 = 0;
	s3 = 0;
	s4 = 0;
	s5 = 0;
	counter = 0;
	crc = 4'b0000;
end


////////////////// update wires
assign w2 = s5; 
assign w1 = data_in[counter] + w2;


///////////////// update registers at clock
always @(posedge clk)
begin
	
	if (counter != 5 && reset != 1) begin
		s1 <= w1;
		s2 <= s1;
		s3 <= s2 + w1;
		s4 <= s3;
		s5 <= s4;
		crc <= {s1,s2,s3,s4,s5};
		counter <= counter +1;
	end
	
	if (reset == 1) begin
		s1 <= 0;
		s2 <= 0;
		s3 <= 0;
		s4 <= 0;
		s5 <= 0;
		counter <= 0;
		crc <= 4'b0000;	
	end
	
end

endmodule
