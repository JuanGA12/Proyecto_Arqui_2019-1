module alu (salida1, salida3, control, rd, overflow, zero);
input [31:0] salida1, salida3;                
input [3:0] control;
output reg[31:0] rd;
output reg overflow, zero;
reg[32:0] tmp;    
always @(*)
    begin
	overflow = 0;
        case(control)
        4'b0000: // AND
           rd = salida1 & salida3 ;
 
        4'b0001: // OR
           rd = salida1 | salida3 ;
       
	4'b0010: // ADD
	   begin
	  	 tmp = salida1 + salida3;
	  	 if ( tmp[32] == 1)
		 begin
	   	 rd = salida1 + salida3 - 32'b11111111111111111111111111111111;
           	 overflow = 1;
	   	 end else
		 begin        
 	   	 rd = salida1 + salida3;
	  	 overflow = 0;
	  	 end
	   end
	4'b0110: // SUB
	   rd = salida1 - salida3; 
 
	4'b0111: // SLT
		if ( salida1 < salida3)
			begin
				rd = 1;
			 end
		else 	begin
				rd = 0;
			end

        4'b1100: // NOR
           rd = !(salida1 | salida3);
       
	4'b0101: //LUI se asigno un control aleatorio porque no había un control en ninguna fuente
	   rd = ( salida3 << 16 );
	
	4'b1111: //BGEZ
		if (salida1 >= 0 ) begin
			rd = 0;
		end else begin
			rd = 1;
		end 
	4'b1010: //BNE
		if ( salida1 != salida3 )begin
			rd = 0;
		end else begin
			rd = 1;
		end
          default: rd = salida1 + salida3 ; 
        endcase	
    end
always @(rd) begin
	if ( rd == 0 ) begin
		zero = 1;
	end else begin
		zero = 0;
	end	
end
endmodule



