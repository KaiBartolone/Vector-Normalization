//////////////////////////////////////////////////////////////////////////////////
// Module Name: vector_normalizer
//////////////////////////////////////////////////////////////////////////////////

module vector_normalizer(
    input wire x,
    input wire y,
    input wire z,
    output wire nx,
    output wire ny,
    output wire nz
    );
    // Declarations
    wire [31:0] estimate;
    wire [31:0] magnitude_squared;
    wire [31:0] constant =  32'h5F3759DF;
    
    wire [31:0] x_2, y_2, z_2;
    float_power x_squared (.in(x), .power(2'd2), .out(x_2));
    float_power y_squared (.in(y), .power(2'd2), .out(y_2));
    float_power z_squared (.in(z), .power(2'd2), .out(z_2));
    
    wire [31:0] x_y;
    adder xy (.a(x), .b(y), .out(x_y));
    adder xyz (.a(x_y), .b(z), .out(magnitude_squared));
    
    // Initial guess
    assign estimate = constant - (magnitude_squared >> 1);
    
    
    
    // Newton Method
    
    // 
    
endmodule
