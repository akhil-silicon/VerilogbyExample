`timescale 1ns / 1ps

module tb_topmodule(

    );
    reg [3:0]in_1;
    reg [3:0]in_2;
    wire [5:0] out_1;
    
    topmodule t0 (in_1,in_2,out_1);
    
    initial begin
    $dumpfile("topmodulewave.vcd");
    $dumpvars(0,tb_topmodule);
    $monitor ("input1= %d \t input2=%d \t output=%d",in_1,in_2,out_1);
    
    in_1=4'b1100; in_2=4'b1010;
    #5
    in_1=4'b1000; in_2=4'b1011;
    #5
    in_1=4'b0100; in_2=4'b1110;
    
    
    end
endmodule
