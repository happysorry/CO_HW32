module regfile(clk,rs1_addr,rs2_addr,rd_addr,reg_wrt,rd_data,rs1_data,rs2_data);
input clk;
input [4:0] rs1_addr;
input [4:0] rs2_addr;
input [4:0] rd_addr;
input reg_wrt;
input [31:0] rd_data;
output reg[31:0] rs1_data;
output reg[31:0] rs2_data;

//register files
reg signed [31:0] r0;
reg signed [31:0] r1;
reg signed [31:0] r2;
reg signed [31:0] r3;
reg signed [31:0] r4;
reg signed [31:0] r5;
reg signed [31:0] r6;
reg signed [31:0] r7;
reg signed [31:0] r8;
reg signed [31:0] r9;
reg signed [31:0] r10;
reg signed [31:0] r11;
reg signed [31:0] r12;
reg signed [31:0] r13;
reg signed [31:0] r14;
reg signed [31:0] r15;
reg signed [31:0] r16;
reg signed [31:0] r17;
reg signed [31:0] r18;
reg signed [31:0] r19;
reg signed [31:0] r20;
reg signed [31:0] r21;
reg signed [31:0] r22;
reg signed [31:0] r23;
reg signed [31:0] r24;
reg signed [31:0] r25;
reg signed [31:0] r26;
reg signed [31:0] r27;
reg signed [31:0] r28;
reg signed [31:0] r29;
reg signed [31:0] r30;
reg signed [31:0] r31;

always@(posedge clk) begin
r0 = 0;
case (rs1_addr)
    0:rs1_data <= r0;
    1:rs1_data <= r1;
    2:rs1_data <= r2;
    3:rs1_data <= r3;
    4:rs1_data <= r4;
    5:rs1_data <= r5;
    6:rs1_data <= r6;
    7:rs1_data <= r7;
    8:rs1_data <= r8;
    9:rs1_data <= r9;
    10:rs1_data <= r10;
    11:rs1_data <= r11;
    12:rs1_data <= r12;
    13:rs1_data <= r13;
    14:rs1_data <= r14;
    15:rs1_data <= r15;
    16:rs1_data <= r16;
    17:rs1_data <= r17;
    18:rs1_data <= r18;
    19:rs1_data <= r19;
    20:rs1_data <= r20;
    21:rs1_data <= r21;
    22:rs1_data <= r22;
    23:rs1_data <= r23;
    24:rs1_data <= r24;
    25:rs1_data <= r25;
    26:rs1_data <= r26;
    27:rs1_data <= r27;
    28:rs1_data <= r28;
    29:rs1_data <= r29;
    30:rs1_data <= r30;
    31:rs1_data <= r31;
    default: rs1_data <= 32'b0;
endcase
case (rs2_addr)
    0:rs2_data <= r0;
    1:rs2_data <= r1;
    2:rs2_data <= r2;
    3:rs2_data <= r3;
    4:rs2_data <= r4;
    5:rs2_data <= r5;
    6:rs2_data <= r6;
    7:rs2_data <= r7;
    8:rs2_data <= r8;
    9:rs2_data <= r9;
    10:rs2_data <= r10;
    11:rs2_data <= r11;
    12:rs2_data <= r12;
    13:rs2_data <= r13;
    14:rs2_data <= r14;
    15:rs2_data <= r15;
    16:rs2_data <= r16;
    17:rs2_data <= r17;
    18:rs2_data <= r18;
    19:rs2_data <= r19;
    20:rs2_data <= r20;
    21:rs2_data <= r21;
    22:rs2_data <= r22;
    23:rs2_data <= r23;
    24:rs2_data <= r24;
    25:rs2_data <= r25;
    26:rs2_data <= r26;
    27:rs2_data <= r27;
    28:rs2_data <= r28;
    29:rs2_data <= r29;
    30:rs2_data <= r30;
    31:rs2_data <= r31;
    default: rs2_data <= 32'b0;
endcase
if(reg_wrt)begin
    case (rd_addr)
    0:r0 <= rd_data;
    1:r1 <= rd_data;
    2:r2 <= rd_data;
    3:r3 <= rd_data;
    4:r4 <= rd_data;
    5:r5 <= rd_data;
    6:r6 <= rd_data;
    7:r7 <= rd_data;
    8:r8 <= rd_data;
    9:r9 <= rd_data;
    10:r10 <= rd_data;
    11:r11 <= rd_data;
    12:r12 <= rd_data;
    13:r13 <= rd_data;
    14:r14 <= rd_data;
    15:r15 <= rd_data;
    16:r16 <= rd_data;
    17:r17 <= rd_data;
    18:r18 <= rd_data;
    19:r19 <= rd_data;
    20:r20 <= rd_data;
    21:r21 <= rd_data;
    22:r22 <= rd_data;
    23:r23 <= rd_data;
    24:r24 <= rd_data;
    25:r25 <= rd_data;
    26:r26 <= rd_data;
    27:r27 <= rd_data;
    28:r28 <= rd_data;
    29:r29 <= rd_data;
    30:r30 <= rd_data;
    31:r31 <= rd_data;
    default: r0 = 0;
endcase
end

//$display("first %d is %d, second %d is %d ,rd %d is %d",rs1_addr,rs1_data,rs2_addr,rs2_data,rd_addr,rd_data);
end
endmodule // 
