module ChemicalSafety_Dataflow
  (input  L,
   input  T,
   input  P,
   input  M,
   output A,
   output V);
  wire n2_o;
  wire n3_o;
  wire n4_o;
  wire n5_o;
  wire n6_o;
  wire n7_o;
  wire n8_o;
  assign A = n5_o; //(module output)
  assign V = n8_o; //(module output)
  /* ChemicalSafety_Dataflow.vhd:21:11  */
  assign n2_o = ~M;
  /* ChemicalSafety_Dataflow.vhd:21:31  */
  assign n3_o = T & P;
  /* ChemicalSafety_Dataflow.vhd:21:25  */
  assign n4_o = L | n3_o;
  /* ChemicalSafety_Dataflow.vhd:21:18  */
  assign n5_o = n2_o & n4_o;
  /* ChemicalSafety_Dataflow.vhd:25:12  */
  assign n6_o = M | P;
  /* ChemicalSafety_Dataflow.vhd:25:23  */
  assign n7_o = T & L;
  /* ChemicalSafety_Dataflow.vhd:25:17  */
  assign n8_o = n6_o | n7_o;
endmodule

