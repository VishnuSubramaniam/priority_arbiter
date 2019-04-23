module rrarbiter(req[3:0],rst,gnt_a,gnt_b,gnt_c,gnt_d);
input logic req[3:0];
input logic rst;
output logic gnt_a,gnt_b,gnt_c,gnt_d;
reg [1:0] grant_req;
logic busy,done;
always@(*)
begin
if(rst==1'b0)
begin
$display("1");
grant_req=2'b00;
end
else
begin
busy=1'b0;
done=1'b1;
while(1)
begin
case(grant_req)
2'b00: begin
	$display("%d",req_a);
	if(req[3]==1'b1 && busy==0 && grant_req==2'b00)
	begin
       gnt_a=1'b1;
       busy=1'b1;
       done=1'b0;
	grant_req=2'b01;
	break;
	end
	else if(grant_req==2'b00)
	grant_req=2'b01;
	end
2'b01:if(req[2]==1'b1 && busy==0 && grant_req==2'b01)
	begin
       gnt_b=1'b1;
       busy=1'b1;
       done=1'b0;
	grant_req=2'b10;
	break;
	end
	else if(grant_req==2'b01)
	grant_req=2'b10;
2'b10:if(req[1]==1'b1 && busy==0&& grant_req==2'b10)
	begin
       gnt_c=1'b1;
       busy=1'b1;
       done=1'b0;
	grant_req=2'b11;
	break;
	end
	else if(grant_req==2'b10)
	grant_req=2'b11;
2'b11:if(req[0]==1'b1 && busy==0&& grant_req==2'b11)
	begin
       gnt_d=1'b1;
       busy=1'b1;
       done=1'b0;
	grant_req=2'b00;
	break;
	end
	else if(grant_req==2'b11)
	grant_req=2'b00;
endcase
end
end
end
endmodule