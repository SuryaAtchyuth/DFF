program pgm_tb(intf wir);
  
//   input clk;
//   output reg reset;
//   output reg [2:0] d;
//   input [2:0]q;  
  
  reg [2:0] exp_val[$], real_val[$];

  initial begin
      $dumpfile("dump.vcd"); $dumpvars(0,test.CUT);
        wir.reset=1; wir.d<=$random;
    #1;  wir.reset=0;
    #2;  wir.reset=1;
  end
  
  
  initial begin
    for(int i=1;i<=6;i++) begin
      @(posedge wir.clk);
      exp_val.push_back(wir.d);
      wir.d<=i;
    end 
    @(posedge wir.clk);
    $finish;
  end
  
  initial  begin
    repeat(7) begin
      @(negedge wir.clk);
      real_val.push_back(wir.q);
 	end
  end
  
  final begin
    if(exp_val==real_val)
      $display("\n### TEST PASSED ###\n");
    else
      $display("\n### TEST FAILED ###","\nExpected:",exp_val, "\nReal     :",real_val);
  end                                                   
  
 
endprogram
  
    
