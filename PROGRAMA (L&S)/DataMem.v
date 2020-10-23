module Data_mem(Instruction,alu_out, salida2, MemWrite, MemRead, data_out,aux);

input [31:0] alu_out, salida2;
input [5:0] Instruction;
input MemWrite, MemRead;
output reg [31:0] data_out;
output reg [31:0] aux;
reg [31:0] data_memory[0:31];
reg [31:0] load;
reg [31:0] store;

initial begin
$readmemh("DataMem.txt", data_memory);
end

always @(*)
begin
	if (MemRead == 1)begin
		load = data_memory[alu_out];
		case(Instruction)
			6'b100011 : begin
				data_out = load;   // load word
			end
			6'b100000 : begin
				data_out = {24'b0,load[7:0]};   // load byte
			end
			6'b100001 : begin
 				data_out = {16'b0,load[15:0]};   // load halfword
			end
		endcase
	end
		
	if (MemWrite == 1)begin
		store = data_memory[alu_out];
		case(Instruction)
			6'b101011 : begin
				store = salida2;   // store word
				aux = store;
			end
			6'b101000 : begin
				store[7:0] = salida2; //store byte
				aux = store[7:0];
			end
			6'b101001 : begin
				store[15:0] = salida2;  //store halfword
				aux = store[15:0];
			end
		endcase
	end
 	
end
endmodule
