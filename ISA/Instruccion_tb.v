`timescale 1ns/1ns

module ISA_tb();

	reg [19:0] inst_tb;
	wire [31:0] salida_tb;
	
	ISA uut (
		.instruccion(inst_tb),
		.Salida(salida_tb)
	);
	
	initial begin
        // Caso 1: Escribir en Banco de Registros, operar en ALU, escribir en RAM
        inst_tb = 20'b00010_00111_0_010_00011_1;  // Operación suma 2 + 7 se guarda en pos. 3
        #100;

        // Caso 2: Leer de la RAM
        inst_tb = 20'b00000_00000_0_000_00011_0;  // Leer de RAM pos. 3, no escribir 
        #100;

        // Caso 3: Operación AND en ALU
        inst_tb = 20'b01110_10010_0_000_10110_1;  // Operación AND 14 & 18 se guarda en pos. 22
        #100;

        // Caso 4: Operación OR en ALU
        inst_tb = 20'b00010_11111_0_001_10001_1;  // Operación OR 2 | 31 se guarda en pos. 17
        #100;

        // Caso 5: Operación de resta en ALU
        inst_tb = 20'b00100_11000_0_110_11110_1;  // Operación resta 4 - 24 se guarda en pos. 30
        #100;
		
		// Caso 6: Operación de mayor que en ALU
        inst_tb = 20'b10000_11101_0_111_11011_1;  // Operación "Mayor que" 16 > 29 se guarda en pos. 27
        #100;
    end
endmodule
