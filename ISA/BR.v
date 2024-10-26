`timescale 1ns/1ns

// Definir el modulo y sus atributos (I/O)
module BancoRegistros (          
    input we,              
    input [4:0] DL1,        
    input [4:0] DL2,        
    input [4:0] DE,         
    input [31:0] Dato,        
    output reg [31:0] op1,       
    output reg [31:0] op2       
);

// Declaracion de las señales/Reg (wire & reg)
reg [31:0]BR [0:31];

initial
begin
	$readmemb("BR_FILE", BR);
end

always @(*) 
begin
	if (we)
	begin
		BR[DE] = Dato;
	end
	
	op1 = BR[DL1];
	op2 = BR[DL2];
end

endmodule