module branch(decode_signal,zero,b);
input [1:0] decode_signal;
input zero;
output reg [1:0] b;
always@(decode_signal or zero)begin
if(decode_signal != 2'b11)begin
	b<=decode_signal;

end else begin
	if(zero == 0)begin
		b <= 0;
	end else begin
		b <= 2'b01;
	end
end
end

endmodule
