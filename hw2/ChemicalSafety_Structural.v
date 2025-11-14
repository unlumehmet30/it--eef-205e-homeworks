module or2_gate
  (input  i1,
   input  i2,
   output o);
  wire n28_o;
  assign o = n28_o; //(module output)
  /* or2_gate.vhd:14:13  */
  assign n28_o = i1 | i2;
endmodule

module and2_gate
  (input  i1,
   input  i2,
   output o);
  wire n26_o;
  assign o = n26_o; //(module output)
  /* and2_gate.vhd:14:13  */
  assign n26_o = i1 & i2;
endmodule

module inv_gate
  (input  i,
   output o);
  wire n24_o;
  assign o = n24_o; //(module output)
  /* inv_gate.vhd:13:10  */
  assign n24_o = ~i;
endmodule

module ChemicalSafety_Structural
  (input  L,
   input  T,
   input  P,
   input  M,
   output A,
   output V);
  wire s_not_m;
  wire s_tp;
  wire s_l_or_tp;
  wire s_tl;
  wire s_m_or_p;
  wire u1_not_m_n2;
  wire u1_not_m_o;
  wire u2_and_tp_n5;
  wire u2_and_tp_o;
  wire u3_or_l_tp_n8;
  wire u3_or_l_tp_o;
  wire u4_and_a_n11;
  wire u4_and_a_o;
  wire u5_and_tl_n14;
  wire u5_and_tl_o;
  wire u6_or_mp_n17;
  wire u6_or_mp_o;
  wire u7_or_v_n20;
  wire u7_or_v_o;
  assign A = u4_and_a_n11; //(module output)
  assign V = u7_or_v_n20; //(module output)
  /* ChemicalSafety_Structural.vhd:33:8  */
  assign s_not_m = u1_not_m_n2; // (signal)
  /* ChemicalSafety_Structural.vhd:34:8  */
  assign s_tp = u2_and_tp_n5; // (signal)
  /* ChemicalSafety_Structural.vhd:35:8  */
  assign s_l_or_tp = u3_or_l_tp_n8; // (signal)
  /* ChemicalSafety_Structural.vhd:36:8  */
  assign s_tl = u5_and_tl_n14; // (signal)
  /* ChemicalSafety_Structural.vhd:37:8  */
  assign s_m_or_p = u6_or_mp_n17; // (signal)
  /* ChemicalSafety_Structural.vhd:47:28  */
  assign u1_not_m_n2 = u1_not_m_o; // (signal)
  /* ChemicalSafety_Structural.vhd:46:5  */
  inv_gate u1_not_m (
    .i(M),
    .o(u1_not_m_o));
  /* ChemicalSafety_Structural.vhd:51:38  */
  assign u2_and_tp_n5 = u2_and_tp_o; // (signal)
  /* ChemicalSafety_Structural.vhd:50:5  */
  and2_gate u2_and_tp (
    .i1(T),
    .i2(P),
    .o(u2_and_tp_o));
  /* ChemicalSafety_Structural.vhd:55:41  */
  assign u3_or_l_tp_n8 = u3_or_l_tp_o; // (signal)
  /* ChemicalSafety_Structural.vhd:54:5  */
  or2_gate u3_or_l_tp (
    .i1(L),
    .i2(s_tp),
    .o(u3_or_l_tp_o));
  /* ChemicalSafety_Structural.vhd:59:52  */
  assign u4_and_a_n11 = u4_and_a_o; // (signal)
  /* ChemicalSafety_Structural.vhd:58:5  */
  and2_gate u4_and_a (
    .i1(s_not_m),
    .i2(s_l_or_tp),
    .o(u4_and_a_o));
  /* ChemicalSafety_Structural.vhd:68:38  */
  assign u5_and_tl_n14 = u5_and_tl_o; // (signal)
  /* ChemicalSafety_Structural.vhd:67:5  */
  and2_gate u5_and_tl (
    .i1(T),
    .i2(L),
    .o(u5_and_tl_o));
  /* ChemicalSafety_Structural.vhd:72:38  */
  assign u6_or_mp_n17 = u6_or_mp_o; // (signal)
  /* ChemicalSafety_Structural.vhd:71:5  */
  or2_gate u6_or_mp (
    .i1(M),
    .i2(P),
    .o(u6_or_mp_o));
  /* ChemicalSafety_Structural.vhd:76:48  */
  assign u7_or_v_n20 = u7_or_v_o; // (signal)
  /* ChemicalSafety_Structural.vhd:75:5  */
  or2_gate u7_or_v (
    .i1(s_m_or_p),
    .i2(s_tl),
    .o(u7_or_v_o));
endmodule

