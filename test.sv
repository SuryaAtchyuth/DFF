`include "intf.sv"
`include "pgm_tb.sv"
module test;

  bit clk;
//   wire reset;
//   wire [2:0] d, q;
  
  intf vif(clk);
  
  DFF CUT(vif.clk, vif.reset, vif.d, vif.q);
  pgm_tb STM1(vif);
  
  always #5 clk=~clk;
endmodule
  
