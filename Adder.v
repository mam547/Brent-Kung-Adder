// Calculate g.
`define g(outWire, index) and(outWire, a[index], b[index])

// Calculate p.
`define p(outWire, index) xor(outWire, a[index], b[index])

// Calculate GP tuple.
`define GP(index, gateName) \
`g(gTmp[index], index);     \
`p(pTmp[index], index);     \
O_Operator gateName(        \
    .a1(gTmp[index]),       \
    .b1(pTmp[index]),       \
    .a2(Gi[index - 1]),     \
    .b2(Pi[index - 1]),     \
    .o1(Gi[index]),         \
    .o2(Pi[index])          \
)

// Summation.
`define sum(index) xor(s[index], pTmp[index], Gi[index - 1])

// Logarithmic adder. Adds a and b with carryIn to summation s and carryOut.
module Adder(a, b, carryIn, s, carryOut);

    // Parameters.
    input [7:0] a, b;
    input carryIn;
    output [7:0] s;
    output carryOut;

    // Temp variables.
    wire [7:0] Gi;
    wire [7:0] Pi;
    wire [7:1] gTmp;
    wire [7:1] pTmp;

    // First elements of Gi and Pi are g0 and p0.
    `g(Gi[0], 0);
    `p(Pi[0], 0);

    // Rest are just results of O operator with gi and pi with the last results.
    `GP(1, o1);
    `GP(2, o2);
    `GP(3, o3);
    `GP(4, o4);
    `GP(5, o5);
    `GP(6, o6);
    `GP(7, o7);

    // Carry out is just the last G entry.
    assign carryOut = Gi[7];

    // First sum bit is a special case as it uses the input carry. Note that p0 is equal to P0.
    xor(s[0], Pi[0], carryIn);

    // Rest of the sum bits are standard.
    `sum(1);
    `sum(2);
    `sum(3);
    `sum(4);
    `sum(5);
    `sum(6);
    `sum(7);

endmodule