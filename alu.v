module alu(rs1,rs2,alu_control,funct3,funct7,zero,alu_out,clk);
input [31:0] rs1;
input [31:0] rs2;
input [3:0] alu_control;
input [2:0] funct3;
input [6:0] funct7;
input clk;
output reg zero;
output reg[31:0] alu_out;

always @(alu_control or rs1 or rs2 or alu_out or zero)begin
	case(alu_control)
		4'b0000:begin//R type
			case(funct3)
				0:begin
					if(funct7==7'b0000000)begin//add
						alu_out<=rs1+rs2;
					end
					else begin///sub
						alu_out<=rs1-rs2;
					end
				end
				1:begin
					alu_out<=rs1<<rs2[4:0];
				end
				2:begin
					alu_out<=($signed(rs1) < $signed(rs2))?1:0;
				end
				3:begin
					alu_out<=(rs1<rs2)?1:0;
				end
				4:begin
					alu_out<=rs1^rs2;
				end
				5:begin
					if(funct7==7'b0000000)begin
						alu_out<=rs1>>rs2[4:0];
					end
					else begin
						alu_out<=$signed(rs1)>>rs2[4:0];
					end
				end
				6:begin
					alu_out<=rs1|rs2;
				end
				7:begin
					alu_out<=rs1&rs2;
				end
				default:alu_out<=0;
			endcase
			zero<=0;
		end
		4'b0001:begin//LW
			alu_out<=rs1+rs2;
		end
		4'b0010:begin//I-type
			case(funct3)
				0:begin
					alu_out<=rs1+rs2;
					$display("rs1=%d,rs2=%d",rs1,rs2);
				end
				1:begin
					alu_out<=rs1<<rs2[4:0];
				end
				2:begin
					alu_out<=($signed(rs1)<$signed(rs2))?1:0;
				end
				3:begin
					alu_out<=(rs1<rs2)?1:0;
				end
				4:begin
					alu_out<=rs1^rs2;
				end
				5:begin
					if(rs2[11:5]==7'b0000000)begin
						alu_out<=rs1>>rs2[4:0];
					end
					else begin
						alu_out<=$signed(rs1)>>rs2[4:0];
					end
				end
				6:begin
					alu_out<=rs1|rs2;
				end
				7:begin
					alu_out<=rs1&rs2;
				end
				default:begin
					alu_out<=0;
					zero<=1'b0;
				end
			endcase
		end
		4'b0011:begin//SW
			alu_out<=rs1+rs2;
			zero<=1'b0;
		end
		4'b0100:begin//B-type
			case(funct3)
				0:begin
					if(rs1==rs2)begin
						alu_out<=0;
						zero<=1;
					end
					else begin
						alu_out<=0;
						zero<=0;
					end
				end
				1:begin
					if(rs1!=rs2)begin
						alu_out<=0;
						zero<=1;
					end
					else begin
						alu_out<=0;
						zero<=0;
					end
				end
				4:begin
					if($signed(rs1)<$signed(rs2))begin
						alu_out<=0;
						zero<=1;
					end
					else begin
						alu_out<=0;
						zero<=0;
					end
				end
				5:begin
					if($signed(rs1)>=$signed(rs2))begin
						alu_out<=0;
						zero<=0;
					end
					else begin
						alu_out<=0;
						zero<=0;
					end
				end
				6:begin
					if(rs1<rs2)begin
						alu_out<=0;
						zero<=1;
					end
					else begin
						alu_out<=0;
						zero<=0;
					end
				end
				7:begin
					if(rs1>=rs2)begin
						alu_out<=0;
						zero<=1;
					end
					else begin
						alu_out<=0;
						zero<=0;
					end
				end
				default:begin
					alu_out<=0;
					zero<=0;
				end
			endcase
		end
		4'b0101:begin//LUI
			alu_out<=rs2;
			zero<=0;
		end
		4'b0110:begin//JALR
			alu_out<=0;
			zero<=0;
		end
		4'b0111:begin//AUIPC
			alu_out<=0;
			zero<=0;
		end
		4'b1000:begin//JAL
			alu_out<=0;
			zero<=0;
		end
		default:begin
			alu_out=0;
			zero=0;
		end
	endcase
end
endmodule


				
					