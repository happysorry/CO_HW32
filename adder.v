module adder(a,b,c);
input [31:0] a;
input [31:0] b;
output reg [31:0] c;

always@(a or b)begin
c<=a+b;
end
endmodule
