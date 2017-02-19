`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Project Name:        CMPEN 417 - Lab 2
// Project Description: 18-bit complex-number multiplier written in Verilog used
//                      for synthesis on FPGA fabric
//                      
// Module Name:         complex_mult_part_1
// Module Description:  Pipelined version of complex-number multiplier
// 
// Dependencies: 
// 
// Revision History:
//      Rev 0.01 - 2/19 - File Created
//
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////

// complex_mult_part_1 p1(.clk(clk), .rst(rst), .a({a_real, a_img}), .b({b_real, b_img}), .result({c_real, c_img}));

module complex_mult_part_1 # (parameter AWIDTH = 18, BWIDTH = 18)
    (
    input clk,
    input signed [AWIDTH-1:0] 	    a_real, a_img,
    input signed [BWIDTH-1:0] 	    b_real, b_img,
    output signed [AWIDTH+BWIDTH:0] c_real, c_img
    );

    reg signed [AWIDTH-1:0]	ai_d, ai_dd, ai_ddd, ai_dddd; 
    reg signed [AWIDTH-1:0]	ar_d, ar_dd, ar_ddd, ar_dddd; 
    reg signed [BWIDTH-1:0]	bi_d, bi_dd, bi_ddd, br_d, br_dd, br_ddd; 
    reg signed [AWIDTH:0] addcommon; 
    reg signed [BWIDTH:0] addr, addi; 
    reg signed [AWIDTH+BWIDTH:0] mult0, multr, multi, pr_int, pi_int; 
    reg signed [AWIDTH+BWIDTH:0] common, commonr1, commonr2; 
    
    always @(posedge clk)
    begin
        ar_d        <= a_real;
        ar_dd       <= ar_d;
        ai_d        <= a_img;
        ai_dd       <= ai_d;
        br_d        <= b_real;
        br_dd       <= br_d;
        br_ddd      <= br_dd;
        bi_d        <= b_img;
        bi_dd       <= bi_d;
        bi_ddd      <= bi_dd;
    end

    // Common factor (a_real a_img) x b_img, shared for the calculations of the real and imaginary final products
    always @(posedge clk)
    begin
        addcommon   <= ar_d - ai_d;         (a_real - a_img)
        mult0       <= addcommon * bi_dd;   (a_real - a_img) * b_real = a_real.b_img - a_img.b_img
        common      <= mult0;
    end

    // Real product
    always @(posedge clk)
    begin
        ar_ddd       <= ar_dd;
        ar_dddd      <= ar_ddd;
        addr         <= br_ddd - bi_ddd;     (b_real - b_img)
        multr        <= addr * ar_dddd;      (b_real - b_img) * a_real = a_real.b_real - a_real.b_img
        commonr1     <= common;
        pr_int       <= multr + commonr1;    a_real.b_real - a_img.b_img
    end

    // Imaginary product
    always @(posedge clk)
    begin
        ai_ddd      <= ai_dd;
        ai_dddd     <= ai_ddd;
        addi        <= br_ddd + bi_ddd;
        multi       <= addi * ai_dddd;
        commonr2    <= common;
        pi_int      <= multi + commonr2;
    end

    assign c_real = pr_int;
    assign c_img = pi_int;


endmodule // complex_mult_part_1