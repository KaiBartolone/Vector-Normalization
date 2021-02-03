//////////////////////////////////////////////////////////////////////////////////
// Module Name: multiplier
//////////////////////////////////////////////////////////////////////////////////

module multiplier(
    input wire [31:0] a,
    input wire [31:0] b,
    output wire [31:0] out
    );
    // Declarations
    wire [63:0] pm;
    wire [7:0] ae = a[30:23];
    wire [7:0] be = b[30:23];
    wire [22:0] am = a[22:0];
    wire [22:0] bm = b[22:0];
    
    wire sign = a[31] ^ b[31];
    
    
    
    // Add exponents to get final exponent
    wire [8:0] pe = ae + be;
    
    
    
    
    
    // Get multiplied mantissas
    assign partial = am * bm;
    
endmodule
