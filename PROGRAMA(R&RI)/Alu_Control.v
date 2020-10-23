module Alu_control(alu_control, AluOp, control);
input [5:0] alu_control;
input [5:0] AluOp;
output reg [3:0] control;
always @(*)
begin
      case(AluOp)
	6'b000000 : control = 4'b0010; // load word & store word
	6'b000001 : control = 4'b0110; // Branch equal
	6'b001000 : control = 4'b0010; // ADDI
	6'b011111 : control = 4'b0110; // SUBI
	6'b001100 : control = 4'b0000; // ANDI
	6'b001101 : control = 4'b0001; // ORI
	6'b001010 : control = 4'b0111; // SLTI
	6'b001111 : control = 4'b0101; // LUI
	6'b111111 : control = 4'b1111; // BGEZ
	6'b000101 : control = 4'b1010; // BNE
	6'b10 : 
		begin
			case(alu_control)  // alu_control = instrucion[5:0] 
			6'b100000 : control = 4'b0010; //ADD 
			6'b100010 : control = 4'b0110; //SUB
			6'b100100 : control = 4'b0000; //AND
			6'b100101 : control = 4'b0001; //OR 
			6'b101010 : control = 4'b0111; //SLT
			6'b100111 : control = 4'b1100; //NOR
			
			endcase
		end
	endcase
end 
endmodule
