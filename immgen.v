module immgen(instr,imm);
input [31:0] instr;
output reg [31:0]imm;
////////////////////////
///?immediate??
///////////////////////

//////instr[31] decide wheather number is positive?
always@(instr)begin
	case(instr[6:0])
		7'b0000011,7'b0010011,7'b1100111:begin          //I-type
			if(instr[31]==1)begin///20bits sign 12bits number
				imm<={{20{1'b1}},instr[31:20]};
			end
			else begin
				imm<={{20{1'b0}},instr[31:20]};
			end
		end
		7'b0100011:begin//s-type
			if(instr[31]==1)begin
				imm <= {{20{1'b1}} , instr[31:25] , instr[11:7]};
			end
			else begin
				imm <= {{20{1'b0}} , instr[31:25] , instr[11:7]};
			end
		end
		7'b1100011:begin //btype
			if(instr[31]==1)begin
				imm <= {{19{1'b1}} , instr[31] , instr[7] , instr[30:25] , instr[11:8],1'b1};
			end
			else begin
				imm <= {{19{1'b0}} , instr[31] , instr[7] , instr[30:25] , instr[11:8],1'b0};
			end
		end
		7'b0010111,7'b0110111:begin//u-type
			imm<={instr[31:12],{12{1'b0}}};
		end
		7'b1101111:begin//J-type
			if(instr[31]==1)begin
				imm <= {{11{1'b1}} , instr[31] , instr[19:12] , instr[20] , instr[30:21] , 1'b0};

			end
			else begin
				imm <= {{11{1'b0}} , instr[31] , instr[19:12] , instr[20] , instr[30:21] , 1'b0};

			end
		end
		default:begin
			imm<=0;
		end
	endcase
end
endmodule
