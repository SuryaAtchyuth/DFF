// Code your design here
module DFF(clk, reset, d, q);
  input clk, reset;
  input [2:0] d;
  output reg [2:0]q;
  
  always @(posedge clk or negedge reset) begin
    if(!reset)
      q<=3'b000;
    else
      q<=d;
  end
endmodule
