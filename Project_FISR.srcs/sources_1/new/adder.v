//////////////////////////////////////////////////////////////////////////////////
// Module Name: adder
//////////////////////////////////////////////////////////////////////////////////
module adder(
    input wire [31:0] a,
    input wire [31:0] b,
    output wire [31:0] out
    );
    // Declarations
    wire [31:0] gn; // Greater number
    wire [31:0] ln; // Lesser number
    wire [7:0] ge; // Greater exponent
    wire [7:0] le; // Lesser exponent
    wire [22:0] gm; // Greater mantissa
    wire [22:0] lm; // Lesser mantissa
    wire [23:0] nm; // Normalized mantissa
    wire [24:0] sm; // Sum of normalized mantissas
    wire ovf; // Overflow
    wire carry; // Carry
    wire [7:0] fe; // Final exponent
    wire [22:0] fm; // Final mantissa
    wire [22:0] ns; // Normalized sum

    // Determine larger number
    assign gn = a[30:23] >= b[30:23] ? a : b;
    assign ln = b[30:23] < a[30:23] ? b : a;
    assign ge = gn[30:23];
    assign le = ln[30:23];
    assign gm = gn[22:0];
    assign lm = ln[22:0];

    // Normalize the smaller number
    assign nm = {|le,lm} >> (ge - le);

    // Add normalized mantissa
    assign sm = nm + {|ge, gm};
    
    // Normalize sum
    assign carry = sm[24];
    assign nm = sm >> carry;
    
    // Check for overflow
    assign ovf = &ge & carry;

    // Deal with overflow case
    assign fe = ovf ? ge : ge + carry;
    assign fm = ovf ? 23'b11111111111111111111111 : nm[22:0];
    assign out = {in[31],fe, fm};
endmodule