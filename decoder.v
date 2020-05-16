///////////////////////////////////////////////
//??32bit instr,??14bit  control signal
//////////////////////////////////////////////


/*
talk ALU controller which type is it, 
ALL 9 type so need 4 bit      13:10
reg_write 1 bit               9
instr_read 1 bit              8
data_read 1 bit               7
data_write 1 bit              6
Branch Ctrl for PC 2 bit      5:4   if==2'b11,mean don't know need other condition
MUX for ALU src2 1bit         3
MUX for PC to reg src 1 bit   2
MUX for RD src 1 bit          1
MUX for Mem to reg 1 bit      0

total is 14 bit
*/


module decoder(instr_out,control_signal);
input [31:0] instr_out;
output reg [13:0] control_signal;

always @(instr_out) begin
case (instr_out[6:0])
	7'b0110011:begin//Rtype
		control_signal<=14'b0000_1100_00_0001;
		end
	7'b0000011:begin//LW
		control_signal<=14'b0001_1110_00_1000;
		end
	7'b0010011:begin//I type
		control_signal<=14'b0010_1100_00_1001;
		end
	7'b0100011:begin//S type
		control_signal<=14'b0011_0101_00_1000;
		end
	7'b1100011:begin//B type
		control_signal<=14'b0100_0100_11_1000;
		end
	7'b0110111:begin//LUI
		control_signal<=14'b0101_0111_00_0111;
		end
	7'b1100111:begin//Jalr
		control_signal<=14'b0110_0011_10_0011;
		end
	7'b0010111:begin//AUI
		control_signal<=14'b0111_1100_00_0111;
		end
	7'b1101111:begin//J
		control_signal<=14'b1000_1000_01_0011;
		end
	default:
		control_signal<=14'b0000_0000_00_0000;
endcase
end

endmodule
