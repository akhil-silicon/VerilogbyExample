`timescale 1ns / 1ps

module tb_topmodule(

    );
     reg start;
     reg stop;
     reg clk;
     reg reset;
     wire [3:0]count;
     wire stop_d2;
    
    topmodule t0 (start,stop,clk, reset, count, stop_d2);
    
    initial begin
    clk=1'd0;
    end
    
    always begin
    #2 clk=~clk;
    end
    
    initial begin
    $dumpfile("topmodulewave.vcd");
    $dumpvars(0,tb_topmodule);
    $monitor ("start= %d \t stop=%d \t  reset=%d \t count=%d \t stop_d2=%b",start,stop, reset, count, stop_d2);
    
    start=0;stop=0;reset=1'd1;
    #10
    start=1;stop=0;reset=1'd0; 
    #513
    start=0;stop=1;reset=1'd0;
    #50
    start=1;stop=0;reset=1'd0;
    
    
    #50 $finish;
    end
endmodule
