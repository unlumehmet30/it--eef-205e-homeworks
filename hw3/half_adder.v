module HALF_ADDER
  (input  A,
   input  B,
   output S,
   output Cout);
  wire n2_o;
  wire n3_o;
  assign S = n2_o; //(module output)
  assign Cout = n3_o; //(module output)
  /* half_adder.vhd:14:12  */
  assign n2_o = A ^ B;
  /* half_adder.vhd:15:15  */
  assign n3_o = A & B;
endmodule

