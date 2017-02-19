`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Project Name:        CMPEN 417 - Lab 2
// Project Description: 18-bit complex-number multiplier written in Verilog used
//                      for synthesis on FPGA fabric
//                      
// Module Name:         top
// Module Description:  top level module
// 
// Dependencies: 
// 
// Revision History:
//      Rev 0.01 - 2/19 - File Created
//
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////

// (a_real + a_img)(b_real + b_img) = (a_real * b_real) + (a_real * b_img) + (a_img * b_real) + (a_img * b_img)

module top(
    input clk,
    input rst
    );
    
    reg [35:0] c_real, c_img;
    reg [17:0] a_real, a_img;
    reg [17:0] b_real, b_img; 
    
    ////////////////////////////////
    //DO NOT MODIFY ABOVE THIS LINE
    ////////////////////////////////
   
    ///////////////////////////////////////////////
    //Use this instantiation to guide your own modules
    ///////////////////////////////////////////////
    
    complex_mult_part_1 p1(.clk(clk), .rst(rst), .a({a_real, a_img}), .b({b_real, b_img}), .result({c_real, c_img}));
    complex_mult_part_2 p2(.clk(clk), .rst(rst), .a({a_real, a_img}), .b({b_real, b_img}), .result({c_real, c_img}));

    ////////////////////////////////
    //DO NOT MODIFY BELOW THIS LINE
    ////////////////////////////////
    
    always@(posedge clk)
    begin
        if(rst)
        begin
            a_real <= 0;
            a_img <= 0;
            b_real <= 0;
            b_img <= 0;
        end
        else
        begin
            a_real <= a_real + 18'd3;
            a_img <= ~(a_real);
            b_img <= b_img + 18'd1;
            b_real <= ~(b_img);
        end
    end
    
    
    
    
endmodule
