`timescale 1ns / 1ps
module 1_busSignal_a(
 in_1,
 in_2,
 in_3,
 out_1

    );
    input [3:0] in_1;
    input [3:0] in_2;
    input in_3;
    output [3:0] out_1;
    
    wire [3:0] in_3_bus;
    
    //
    
    assign in_3_bus= {4{in_3}};
    assign out_1= (in_1 & ~in_3_bus) | (in_2 & in_3_bus);
    
endmodule
