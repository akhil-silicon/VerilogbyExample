module topmodule (
  start,
  stop,
  clk,
  reset,
  count,
  stop_d2
);

output reg [3:0] count;
output reg stop_d2;
input reset;
input start;
input stop;
input clk;
reg cnt_en;
reg stop_d1;


always @(posedge clk or posedge reset) begin
    if (reset)
        cnt_en<=1'd0;
    else if(stop)
        cnt_en<=1'd0;
    else if(start)
        cnt_en<=1'd1;    
end

always @(posedge clk or posedge reset) begin
    if (reset)
        count<=4'd0;
    else if( cnt_en==1'd1 && count==4'd13)
        count<=4'd0;
    else if(cnt_en)
        count <= count+1;   
end

always @(posedge clk or posedge reset) begin
    if (reset)
     begin
        stop_d1<=1'd0;
        stop_d2<=1'd0;
     end
    else
     begin
        stop_d1<=stop;
        stop_d2<=stop_d1;
     end
end
endmodule

