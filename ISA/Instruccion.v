`timescale 1ns/1ns

// Definir el modulo y sus atributos (I/O)
module ISA(
	input [19:0]instruccion,
	output [31:0]Salida
);

wire [31:0] d1BR_op1Alu;
wire [31:0] d2BR_op2Alu;
wire [31:0] dResALU_DatoRAM;

BancoRegistros instBanco(
	.DL1(instruccion[19:15]),
	.DL2(instruccion[14:10]),
	.DE(0),
	.Dato(0),
	.we(instruccion[9]),
	.op1(d1BR_op1Alu),
	.op2(d2BR_op2Alu)
);

ALU instALU(
	.Ope1(d1BR_op1Alu),
	.Ope2(d2BR_op2Alu),
	.AluOp(instruccion[8:6]),
	.Resultado(dResALU_DatoRAM)
);

RAM instRAM(
	.Dato(dResALU_DatoRAM),
	.dir(instruccion[5:1]),
	.WE(instruccion[0]),
	.Q(Salida)
);
endmodule
