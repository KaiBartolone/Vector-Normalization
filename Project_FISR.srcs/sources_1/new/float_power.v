module float_power (
        input wire [31:0] in,
        input wire [1:0] power,
        output wire [31:0] out
    );
    
    wire [8:0] exp = {1'b0, in[30:23]} - 9'd127;
    wire [8:0] exp2 = exp * power;
    wire [8:0] exp3 = exp2 + 9'd127;
    assign out = {in[31], exp3, in[22:0]};    
endmodule
