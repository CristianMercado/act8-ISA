`timescale 1ns/1ns

// Definir el modulo y sus atributos (I/O)

module ALU(
	input [31:0]Ope1,
	input [31:0]Ope2,
	input [2:0]AluOp,
	output reg [31:0] Resultado
);

always @(*)
begin
	case (AluOp)
		3'b000: //AND
			Resultado = Ope1 & Ope2;
		3'b001: //OR
			Resultado = Ope1 | Ope2;
		3'b010: //SUMA
			Resultado = Ope1 + Ope2;
		3'b110: //RESTA
			Resultado = Ope1 - Ope2;
		3'b111: //MAYORQ
			Resultado = Ope1 > Ope2? 1:0;
	endcase
end


endmodule
