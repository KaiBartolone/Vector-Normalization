//////////////////////////////////////////////////////////////////////////////////
// Module Name: arbiter
//////////////////////////////////////////////////////////////////////////////////

module arbiter #(parameter WIDTH = 8) (
    input wire [WIDTH - 1:0] in,
    output wire [WIDTH - 1:0] out    
    );
    wire [WIDTH - 1:0] c = {1'b1, (~in[WIDTH - 1:1] & c[WIDTH - 1:1])};
    assign out = in & c;
endmodule
