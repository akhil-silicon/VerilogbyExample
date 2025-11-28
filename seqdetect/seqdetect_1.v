module sequence_det (
input clk,
input x,
input reset,
output reg z

);

parameter S0=2'b00, S1=2'b01,S2=2'b10,S3=2'b11;

reg [1:0] state, next_state;

// next state logic
always @(*)
begin
case(state)
    S0: begin //initial state
        next_state=x?S0:S1;
        z=x?0:0;
        end 
    S1: begin // Matched 0
        next_state=x?S2:S1; 
        z=x?0:0;
        end
    S2: begin // Matched 01
        next_state=x?S3:S1;
        z=x?0:0; 
        end
    S3: begin // Matched 011
        next_state=x?S0:S1;
        z=x?0:1;    
        end  
    default:begin 
            next_state=S0;    
            z=x?0:0;
            end 
endcase
end

// sequence logic
always @(posedge clk or negedge reset)
begin
if(!reset)
    state<=S0;
else
    state<=next_state;
end

//output logic


endmodule
