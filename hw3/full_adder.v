module FULL_ADDER
  (input  A,
   input  B,
   input  Cin,
   output S,
   output Cout);
  wire n2_o;
  wire n3_o;
  wire n4_o;
  wire n5_o;
  wire n6_o;
  wire n7_o;
  wire n8_o;
  assign S = n3_o; //(module output)
  assign Cout = n8_o; //(module output)
  /* full_adder.vhd:16:12  */
  assign n2_o = A ^ B;
  /* full_adder.vhd:16:18  */
  assign n3_o = n2_o ^ Cin;
  /* full_adder.vhd:19:16  */
  assign n4_o = A & B;
  /* full_adder.vhd:19:29  */
  assign n5_o = A & Cin;
  /* full_adder.vhd:19:23  */
  assign n6_o = n4_o | n5_o;
  /* full_adder.vhd:19:44  */
  assign n7_o = B & Cin;
  /* full_adder.vhd:19:38  */
  assign n8_o = n6_o | n7_o;
endmodule

