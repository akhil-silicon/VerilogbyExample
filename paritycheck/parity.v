module parity (
input x,
input reset,
input clk,
output z

);

parameter EVEN=0, ODD=1;

reg state,next_state;

// next stage logic
always @(*)
begin
    
    case(state)
        EVEN: next_state= x?ODD:EVEN;
        ODD: next_state=x?EVEN:ODD;
        
    endcase
end

// sequential logic
always @(posedge clk or negedge reset)
begin
    if(!reset)
        state<=EVEN;
        else
        state<=next_state;

end

//output logic

assign z=state;

endmodule
