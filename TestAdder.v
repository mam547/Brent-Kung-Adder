// Test how the adder functions.
module TestAdder();

// Parameters.
reg [7:0] a;
reg [7:0] b;
reg carryIn;
wire [7:0] s;
wire carryOut;

// Wire the adder.
Adder ad0(
    .a(a),
    .b(b),
    .carryIn(carryIn),
    .s(s),
    .carryOut(carryOut)
);

// Do the thing.
initial begin

    // Dump data.
    $dumpfile("Adder.vcd");
    $dumpvars(0, a);
    $dumpvars(1, b);
    $dumpvars(2, carryIn);
    $dumpvars(3, s);
    $dumpvars(4, carryOut);
    $dumpvars(5, ad0.Gi);
    $dumpvars(6, ad0.Pi);
    $dumpvars(7, ad0.gTmp);
    $dumpvars(8, ad0.pTmp);

    // Assign tests.
    a = 57;
    b = 78;
    carryIn = 0;
    #10 $display("Result: %d, Carry: %b, Expected: %d", s, carryOut, a + b + carryIn);
	 
	 a = 12;
    b = 104;
    carryIn = 1;
    #10 $display("Result: %d, Carry: %b, Expected: %d", s, carryOut, a + b + carryIn);
	 
	 a = 232;
    b = 41;
    carryIn = 0;
    #10 $display("Result: %d, Carry: %b, Expected: %d", s, carryOut, a + b + carryIn);
    $finish;

end

endmodule