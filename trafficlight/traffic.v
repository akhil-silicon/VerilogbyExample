module traffic (
  input clk,
  input reset,
  output rlight,
  output glight,
  output ylight
);

parameter RED=2'b00, YELLOW=2'b01, GREEN=2'b10;
  
reg [1:0] state,next_state;

//next state logic
always @(*)
begin
    next_state=RED;
	case(state)
      RED: 		next_state=GREEN;
      GREEN:	next_state=YELLOW; 
      YELLOW:	next_state= RED ;
      default: 	next_state=RED ;
	endcase

end

// sequential logic

  always @ (posedge clk or negedge reset)
begin
  if(!reset)
    state<=RED;
  else
	state<=next_state;
end

//output logic
  
  assign rlight=(state==RED)?1:0;
  assign glight=(state==GREEN)?1:0;
  assign ylight=(state==YELLOW)?1:0;

    		
endmodule



  
  
