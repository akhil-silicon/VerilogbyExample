`timescale 1ns/1ns
module tb_sequence_det();
  reg x;
  reg clk;
  reg reset;
  wire z;
  
  sequence_det s0 (clk,x,reset,z);
  
  initial
    begin
    clk=0;
    reset=0;
    end
    
  always
    #5 clk=~clk;
  
  initial
    begin
      $dumpfile("sequence_det.vcd");
      $dumpvars(0,tb_sequence_det);
      $monitor($time ," x=%b \t reset=%b \t z=%b ", x,reset,z);
      #2
      reset=1;
          x=0;
      #10 x=1;
      #10 x=1;
      #10 x=0;
      #10 x=1;
      #10 x=1;
      #10 x=0;
      #10 x=1;
      #10 x=1;
      #10 x=0;
      #10 x=1;
      #10 x=1;
      #10 x=1;
      #10 x=1;
      #10 x=1;
      #10 $finish;
    end
  
  
  
  
  
  
  
endmodule
