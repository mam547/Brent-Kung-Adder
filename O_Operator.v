// Implement the O operator.
module O_Operator(a1, b1, a2, b2, o1, o2);

    // Module parameters.
    input a1, b1, a2, b2;
    output o1, o2;

    // Temp variables.
    wire tmp;

    // Gate assignments.
    and(tmp, b1, a2);
    or(o1, a1, tmp);
    and(o2, b1, b2);

endmodule