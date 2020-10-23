module testbench2();
reg clk;
wire [15:0] immediate_data;
wire [5:0] Control, alu_control, AluOp;
wire [4:0] read1, read2, write, write2;
wire [3:0] control_out, jr;
wire [31:0]  aux, cable1, cable2, salida1, salida2, salida3, data_out, alu_out, JAL_value, jump1;
wire [25:0] jumpAdd;
wire overflow, zero, RegDst, Branch, Jump, Alusrc, RegWrite, MemRead, MemWrite, MemtoReg, JAL;


pc_b tb45(clk, zero, Branch, Jump, immediate_data, jumpAdd, cable1, jump1);

instruction_memory tb3(cable1, Control, read1, read2, write, immediate_data, alu_control,jumpAdd, jr);

control tb9(Control, RegDst, Branch, Jump,  AluOp, Alusrc, RegWrite, MemRead, MemWrite, MemtoReg, JAL);

mux1n tb4(read2, write, RegDst, write2);

regfile tb5(clk, read1, read2, write2, cable2,salida1, salida2, RegWrite, jump1, JAL_value, JAL);

mux tb6(salida2, immediate_data, Alusrc, salida3);

Alu_control tb7(alu_control, AluOp, control_out);

alu tb8(salida1, salida3, control_out, alu_out, overflow, zero);

Data_mem tb11(Control, alu_out, salida2, MemWrite, MemRead, data_out, aux);

mux_data tb10(data_out, alu_out, MemtoReg, cable2);



always begin
        #5 clk = !clk;
end

initial begin 
clk = 0;
#60 $finish;
end
initial begin
$monitor("Opcode: %b Dato1: %d Dato2: %d Resultado: %d Control: %b PC: %d Store: %d",Control, salida1, salida3, cable2, control_out, cable1, aux);
end
endmodule

