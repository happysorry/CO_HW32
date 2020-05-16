module data_mem(alu_out,rs2_data,mem_read,mem_wrt,data_out);
input [31:0]alu_out;
input [31:0]rs2_data;
input mem_read;
input mem_wrt;

output reg [31:0]data_out;

reg [31:0] MEMO[0:255];

integer i;

initial begin

   data_out <= 0;

   for (i = 0; i < 256; i = i + 1)
     MEMO[i] = i;

   end


always @(mem_read or mem_wrt)begin
	if(mem_read==1'b1)begin
		data_out<=MEMO[alu_out];
	end
	if(mem_wrt==1)begin
		MEMO[alu_out]<=rs2_data;
	end
	
end
endmodule	
	
	