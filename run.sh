iverilog O_Operator.v Adder.v TestAdder.v -o Adder.vvp
vvp Adder.vvp -lxt2
gtkwave Adder.vcd