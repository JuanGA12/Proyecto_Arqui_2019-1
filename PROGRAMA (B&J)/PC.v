module pc_b(clk, zero, Branch, Jump, immediate_data, jumpAdd, pc, jump1, jr, Control, salida1);
input clk; 
input [3:0] jr;
input [5:0] Control;
input [31:0] salida1;
input [15:0] immediate_data;
input [25:0] jumpAdd;
input zero, Branch, Jump;
wire [31:0] pc_in, branch_add, branch1, jump2;
wire select_and;
reg [31:0] mux1, npc;
output reg [31:0] pc, jump1;

assign select_and = Branch & zero;
assign pc_in = pc + 32'b0; // porque mi instmem esta en hexadecimal y toda la instruccion esta en una sola linea.
assign branch1 = {16'b0,immediate_data};
assign branch_add = pc_in + (branch1 << 2);
assign jump2 = { pc_in[31:28], (jumpAdd << 2) };


initial begin
	pc = 32'b0;
end

always @(*)
begin
	if ( select_and == 1 ) begin
                mux1 = branch_add;
        end else begin
                mux1 = pc_in;
        end
end

always @(*)
begin	
	jump1 = jump2;
	if ( Jump == 1 ) begin
		if ( (Control == 6'b0) & ( jr == 4'b1000) ) begin
			npc = salida1;
		end else begin
			npc = jump1;
		end
	end else begin
		npc = mux1;
	end
end

always @ (posedge clk)
begin
	if ( clk == 0 ) begin
		pc = 0;
	end else begin
		pc = npc;
	end
end
endmodule
//probar pc
