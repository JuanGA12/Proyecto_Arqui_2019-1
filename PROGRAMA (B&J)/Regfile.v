module regfile (clk, read1, read2, write, write_data, salida1, salida2,RegWrite, jump1, JAL_value, JAL);
input clk, RegWrite, JAL;
input [4:0] read1, read2, write;
input [31:0] write_data, jump1;
output reg [31:0] salida1, salida2, JAL_value;

reg [31:0]memoria[0:31];

initial begin
$readmemh("Regfile.txt",memoria); 
end

always@(*)
	begin
	salida1 = memoria[read1]; 
	salida2 = memoria[read2];	
	end
always@(clk == 1)
	begin
		if (RegWrite == 1) begin
			memoria[write] = write_data;
			
			if (JAL == 1) begin
				memoria[31] = jump1;
				JAL_value = memoria[31];
			end
		end
		
	end
endmodule

