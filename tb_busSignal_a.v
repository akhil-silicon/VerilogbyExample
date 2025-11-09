`timescale 1ns / 1ps


module tb_busSignal_a();
    reg [3:0] in_1;
    reg[3:0] in_2;
    reg in_3;
    wire  [3:0] out_1;
    
    busSignal U0 (in_1,in_2,in_3,out_1);
    
     initial begin
        $dumpfile("busSigalwave.vcd");
        $dumpvars(0,tb_busSignal);
        $monitor("input1=%b \t input2=%b \t input3=%b output=%b",in_1,in_2,in_3,out_1);
        in_1=4'b1011; in_2=4'b1110; in_3=1'b1;
        #5
        in_1=4'b1001; in_2=4'b1110; in_3=1'b1;
        #5
        in_1=4'b1011; in_2=4'b1000; in_3=1'b0;
           
    end
    
endmodule
