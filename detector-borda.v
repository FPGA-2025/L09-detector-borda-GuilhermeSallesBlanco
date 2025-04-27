module detector_borda (
    input clk,
    input rst,
    input [1:0] entrada,
    output reg [1:0] detector
);
    
reg [1:0] entrada_antiga; // Registro para armazenar o valor anterior da entrada

always @(posedge clk or posedge rst) begin
    if (rst) begin // Se reset = 1, zera os registros
        entrada_antiga = 0;
        detector = 0;
    end else begin
        detector = (~entrada_antiga) & entrada;
        entrada_antiga = entrada;
    end
end

endmodule