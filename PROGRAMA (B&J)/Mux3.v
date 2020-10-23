module mux_data(data_out, alu_out, MemtoReg, Write_data);
input [31:0] data_out, alu_out;
input MemtoReg;
output reg [31:0] Write_data;

always @(*)
begin
	if (MemtoReg == 1) begin
		Write_data = data_out;
	end else begin
		Write_data = alu_out;
	end
end
endmodule
