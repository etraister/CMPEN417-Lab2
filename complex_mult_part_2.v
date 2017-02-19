`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Project Name:        CMPEN 417 - Lab 2
// Project Description: 18-bit complex-number multiplier written in Verilog used
//                      for synthesis on FPGA fabric
//                      
// Module Name:         complex_mult_part_2
// Module Description:  Explicity uses the DSP slices of the Xilinix 7-Series FPGA
// 
// Dependencies: 
// 
// Revision History:
//      Rev 0.01 - 2/19 - File Created
//
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////

// complex_mult_part_2 p2(.clk(clk), .rst(rst), .a({a_real, a_img}), .b({b_real, b_img}), .result({c_real, c_img}));

module complex_mult_part_2(
    input a_real,
    input a_img,
    input b_real,
    input b_img,
    output c_real,
    output c_img
    );
    
    reg [35:0] c_real, c_img;
    reg [17:0] a_real, a_img;
    reg [17:0] b_real, b_img; 

    
    always@(posedge clk)
    begin

    end
   
endmodule
