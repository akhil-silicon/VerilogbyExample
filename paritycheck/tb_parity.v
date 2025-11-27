`timescale 1ns/1ns
module tb_parity();
  reg x;
  reg clk;
  reg reset;
  wire z;
  
  parity p0 (x,reset,clk,z);
  
  initial
    begin
    clk=0;
    reset=0;
    end
    
  always
    #5 clk=~clk;
  
  initial
    begin
      $dumpfile("parity.vcd");
      $dumpvars(0,tb_parity);
      $monitor($time,"x=%b \t reset=%b \t z=%b ", x,reset,z);
      #2
      reset=1;
      x=0;
      #10
      x=1;
      #10
      x=1;
      #10
      x=0;
      #10
      x=0;
      #10
      x=1;
      #10 $finish;
    end
  
  
  
  
  
  
  
endmodule
