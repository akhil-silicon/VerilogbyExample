`timescale 1ns/1ps
module traffic_tb();
  reg clk;
  reg reset;
  wire rlight,glight,ylight;
  
  traffic t0 (clk, reset, rlight, glight,ylight);
  
  initial
    begin
    clk=0;
    reset=0;
    end
  always
    #1 clk=~clk;
  
  initial
    begin
      $dumpfile("traffic.vcd");
      $dumpvars(0,traffic_tb);
      $monitor($time,"reset=%b \t rlight=%b \t glight=%b \t  ylight=%b", reset,rlight,glight,ylight);
      #5
      reset=1;
      #100 $finish;
    end
  
  
  
  
  
  
  
endmodule
