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
    wire [22:0] nm; // Normalized mantissa
    wire [5:0] sum;
    wire carry;
    wire overflow;
    wire [2:0] final_exponent;
    wire [4:0] final_mantissa;
    wire [5:0] normalized_sum;

    // Determine larger number
    assign ge = a[30:23] >= b[30:23] ? a : b;
    assign le = b[30:23] > a[30:23] ? b : a;

    // Normalize the smaller number
    shifter normalize (.in(lesser_mantissa), .distance(greater_exponent - lesser_exponent), .direction(1'b1), .out(normalized_mantissa));

    // Add normalized mantissa
    adder add(.a(normalized_mantissa), .b(greater_mantissa), .sum(sum[4:0]), .cout(carry));
    assign sum[5] = carry;
    assign normalized_sum = sum >> carry;
    assign overflow = &greater_exponent & carry;

    // Deal with overflow case
    assign final_exponent = overflow ? greater_exponent : greater_exponent + carry;
    assign final_mantissa = overflow ? 5'b11111 : normalized_sum[4:0];
    assign result = {final_exponent, final_mantissa};
endmodule

    
endmodule
