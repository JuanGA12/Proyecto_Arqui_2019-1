module mux(salida2, immediate_data, select2, salida3);
input [31:0] salida2;
input [15:0] immediate_data;
input select2;
output reg[31:0] salida3;
reg[31:0]muxo;


always @(*)
begin
	if (select2 == 1'b1) begin;
		muxo <= {16'b0,immediate_data};
		salida3 = muxo;
	end else begin
		salida3 = salida2;
	end
end
endmodule
