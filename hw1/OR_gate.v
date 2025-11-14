module OR_gate
  (input  INA1,
   input  INA2,
   output OA);
  wire n1_o;
  assign OA = n1_o; //(module output)
  /* OR_gate.vhd:12:16  */
  assign n1_o = INA1 | INA2;
endmodule

