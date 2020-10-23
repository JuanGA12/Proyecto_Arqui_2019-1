module instruction_memory(read_adress, Control, read1, read2, write, immediate_data, alu_control, jumpAdd, jr);

input [31:0] read_adress;
output reg [3:0] jr;
output reg [5:0] Control, alu_control;
output reg [4:0] read1, read2, write;
output reg [15:0] immediate_data;
output reg [25:0] jumpAdd;
reg [31:0] instruction;

reg [31:0]instruction_memory[0:31];

initial begin
$readmemh("IM.txt", instruction_memory);
end

always @(read_adress)
begin
	instruction = instruction_memory[read_adress];
	// Carga en instruction la posicion read_adress del archivo instruction_memory

	Control = instruction[31:26];
	read1 = instruction[25:21];
	read2 = instruction[20:16];
	write = instruction[15:11];
	immediate_data = instruction[15:0];
	jumpAdd = instruction[25:0];
	alu_control = instruction[5:0];
	jr = instruction[3:0];
end
endmodule

