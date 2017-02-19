`include "top.v"

module atest;

    wire [35:0] cr_t, ci_t;

    reg clk, rst;
    reg [17:0] ar_t, ai_t;
    reg [17:0] br_t, bi_t; 

    top top1 (clk, rst);

    initial 
    begin
        clk = 0;	
    end

    always #100 c_clk = ~c_clk;

    initial
    begin
        rst = 1;
        ar_t = 0;   ai_t = 0;
        br_t = 0;   bi_t = 0;

        #600 
        rst = 0;
        ar_t = 1;   ai_t = 0;
        br_t = 1;   bi_t = 0;        

        #200 
        rst = 0;
        ar_t = 2;   ai_t = 0;
        br_t = 2;   bi_t = 0;   

        #200
        rst = 0;
        ar_t = 1;   ai_t = 1;
        br_t = 1;   bi_t = 1;   

         200
        rst = 0;
        ar_t = 1;   ai_t = 2;
        br_t = 1;   bi_t = 2;  

        #200
        rst = 0;
        ar_t = 2;   ai_t = 2;
        br_t = 2;   bi_t = 2;  

        #2000 $stop;
    end // initial begin

    always @ (rst or clk or ar_t or ai_t or br_t or bi_t)
    begin

    $display (  "%t :::::\trst: %b\n 
                ar_t: %d\tai_t: %d\n
                br_t: %d\tbi_t: %d\n
                cr_t: %d\tci_t: %d\n\n", 
                $time, rst, ar_t, ai_t, br_t, bi_t, cr_t, ci_t);

    end

endmodule
   






