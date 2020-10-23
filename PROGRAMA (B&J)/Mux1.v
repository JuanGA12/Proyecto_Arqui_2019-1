module mux1n(read2, write, select1, write2);

input [4:0] read2, write;
input select1;
output reg [4:0] write2;

always @(*)
begin 
	if ( select1 == 1 ) begin
		write2 = write;
	end else begin
		write2 = read2;
	end
end
endmodule
