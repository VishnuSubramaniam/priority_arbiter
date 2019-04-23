module rrarbiter_test();
logic req[3:0];
logic rst;
 logic gnt_a,gnt_b,gnt_c,gnt_d;
 rrarbiter r1(req[3:0],rst,gnt_a,gnt_b,gnt_c,gnt_d);
 initial begin
rst=1'b0;
#5 rst=1'b1;
  #5 {req[3],req[2],req[1],req[0]}=4'b1111;
  $display("%t , %d , %d , %d , %d ",$time,gnt_a,gnt_b,gnt_c,gnt_d);
  #10 {req[3],req[2],req[1],req[0]}=4'b0100;;
$display("%t , %d , %d , %d , %d ",$time,gnt_a,gnt_b,gnt_c,gnt_d);
  #10 {req[3],req[2],req[1],req[0]}=4'b0011;
$display("%t , %d , %d , %d , %d ",$time,gnt_a,gnt_b,gnt_c,gnt_d);
  #10 {req[3],req[2],req[1],req[0]}=4'b0001;
$display("%t , %d , %d , %d , %d ",$time,gnt_a,gnt_b,gnt_c,gnt_d);
 #100 $finish;
 end
endmodule
