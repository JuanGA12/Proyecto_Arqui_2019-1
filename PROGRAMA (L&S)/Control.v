module control(Instruction, RegDst, Branch, Jump, AluOp, Alusrc, RegWrite, MemRead, MemWrite, MemtoReg, JAL);
input [5:0] Instruction;
output reg RegDst, Branch, Jump, Alusrc, RegWrite, MemRead, MemWrite, MemtoReg, JAL;
output reg [5:0] AluOp;

always @(*)
begin
	case(Instruction) // Instruction[31:26]
		6'b000000 : begin //tipo r (add, and, nor, or, sub, slt)
			RegDst = 1;
               		Alusrc = 0;
                	RegWrite = 1;
                	AluOp = 6'b10;
                	MemRead = 0;
                	MemWrite = 0;
			MemtoReg = 0;
			Branch = 0;
			Jump = 0;
		end
		6'b001000 : begin //tipo RI (addi)
			RegDst = 0;
                        Alusrc = 1;
                        RegWrite = 1;
                        AluOp = 6'b001000;
                        MemRead = 0;
                        MemWrite = 0;
			MemtoReg = 0;
			Branch = 0;
			Jump = 0;
		end
		6'b011111 : begin //tipo RI (subi) opcode inventado ya que no existe un opcode para subi
			RegDst = 0;
                        Alusrc = 1;
                        RegWrite = 1;
                        AluOp = 6'b011111;
                        MemRead = 0;
                        MemWrite = 0;
			MemtoReg = 0;
			Branch = 0;
			Jump = 0;
		end
		6'b001100 : begin //tipo RI (andi)
			RegDst = 0;
                        Alusrc = 1;
                        RegWrite = 1;
                        AluOp = 6'b001100;
                        MemRead = 0;
                        MemWrite = 0;
			MemtoReg = 0;
			Branch = 0;
			Jump = 0;
		end
		6'b001101 : begin //tipo RI (ori)
			RegDst = 0;
                        Alusrc = 1;
                        RegWrite = 1;
                        AluOp = 6'b001101;
                        MemRead = 0;
                        MemWrite = 0;
			MemtoReg = 0;
			Branch = 0;
			Jump = 0;
		end
		6'b001010 : begin //tipo RI (slti)
			RegDst = 0;
                        Alusrc = 1;
                        RegWrite = 1;
                        AluOp = 6'b001010;
                        MemRead = 0;
                        MemWrite = 0;
			MemtoReg = 0;
			Branch = 0;
			Jump = 0;
		end
		6'b100011 : begin //lw
			RegDst = 0;
                        Alusrc = 1;
                        RegWrite = 1;
                        AluOp = 6'b00;
                        MemRead = 1;
                        MemWrite = 0;
			MemtoReg = 1;
			Branch = 0;
			Jump = 0;
		end
		6'b100000 : begin //loadbyte
			RegDst = 0;
                        Alusrc = 1;
                        RegWrite = 1;
                        AluOp = 6'b00;
                        MemRead = 1;
                        MemWrite = 0;
                        MemtoReg = 1;
			Branch = 0;
			Jump = 0;
		end
		6'b100001 : begin //load halfword
			RegDst = 0;
                        Alusrc = 1;
                        RegWrite = 1;
                        AluOp = 6'b00;
                        MemRead = 1;
                        MemWrite = 0;
                        MemtoReg = 1;
			Branch = 0;
			Jump = 0;
		end 
		6'b101011 : begin //sw
			RegDst = 0;
                        Alusrc = 1;
                        RegWrite = 0;
                        AluOp = 6'b00;
                        MemRead = 0;
                        MemWrite = 1;
			MemtoReg = 0;
			Branch = 0;
			Jump = 0;
		end 
		6'b101000 : begin //store byte
			RegDst = 0;
                        Alusrc = 1;
                        RegWrite = 0;
                        AluOp = 6'b00;
                        MemRead = 0;
                        MemWrite = 1;
                        MemtoReg = 0;
			Branch = 0;
			Jump = 0;
		end 
		6'b101001 : begin // store halfword
			RegDst = 0;
                        Alusrc = 1;
                        RegWrite = 0;
                        AluOp = 6'b00;
                        MemRead = 0;
                        MemWrite = 1;
                        MemtoReg = 0;
			Branch = 0;
			Jump = 0;
		end
		6'b001111 : begin //lui
			RegDst = 0;
                        Alusrc = 1;
                        RegWrite = 1;
                        AluOp = 6'b001111;
                        MemRead = 0;
                        MemWrite = 0;
                        MemtoReg = 0;
			Branch = 0;
			Jump = 0;
		end
		6'b000100 : begin //BEQ
			RegDst = 0;
                        Alusrc = 0;
                        RegWrite = 0;
                        AluOp = 6'b000001;
                        MemRead = 0;
                        MemWrite = 0;
                        MemtoReg = 0;
                        Branch = 1;
			Jump = 0;
		end
		6'b000001 : begin //BEZ
                        RegDst = 0;
                        Alusrc = 0;
                        RegWrite = 0;
                        AluOp = 6'b111111;
                        MemRead = 0;
                        MemWrite = 0;
                        MemtoReg = 0;
                        Branch = 1;
			Jump = 0;
                end
		 6'b000101 : begin //BNE
                        RegDst = 0;
                        Alusrc = 0;
                        RegWrite = 0;
                        AluOp = 6'b000101;
                        MemRead = 0;
                        MemWrite = 0;
                        MemtoReg = 0;
                        Branch = 1;
			Jump = 0;
		end
		6'b000010: begin //Jump
                	RegDst = 0;
                        Alusrc = 0;
                        RegWrite = 0;
                        MemRead = 0;
                        MemWrite = 0;
                        MemtoReg = 0;
                        Branch = 0;
                        Jump = 1;
		end
		6'b000011: begin // JAL
                	RegDst = 0;
                        Alusrc = 0;
                        RegWrite = 1;
                        MemRead = 0;
                        MemWrite = 0;
                        MemtoReg = 0;
                        Branch = 0;
                        Jump = 1;
			JAL = 1;
		end
	endcase
end
endmodule		
		

