// Definir el modulo y sus atributos (I/O)
module RAM (
    input WE,               
	input [4:0] dir,	
    input [31:0] Dato,     
    output reg [31:0] Q 
);
// Declaracion de las señales/Reg (wire & reg)
	reg [31:0] mem [31:0];  
	// Cuerpo
	//Asignaciones
	//Instancias 	
	//Bloque always/initial(TestBench)   

    always @(*) 
	begin
        if (WE) 
			begin
				mem[dir] = Dato; // Escribir en la RAM en la dirección dada
			end 
		else 
			begin
				Q = mem[dir]; // Leer desde la RAM en la dirección dada
			end
    end
endmodule

