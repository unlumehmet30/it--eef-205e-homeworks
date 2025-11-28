module full_adder
  (input  a,
   input  b,
   input  cin,
   output s,
   output cout);
  wire n44_o;
  wire n45_o;
  wire n46_o;
  wire n47_o;
  wire n48_o;
  wire n49_o;
  wire n50_o;
  assign s = n45_o; //(module output)
  assign cout = n50_o; //(module output)
  /* full_adder.vhd:16:12  */
  assign n44_o = a ^ b;
  /* full_adder.vhd:16:18  */
  assign n45_o = n44_o ^ cin;
  /* full_adder.vhd:19:16  */
  assign n46_o = a & b;
  /* full_adder.vhd:19:29  */
  assign n47_o = a & cin;
  /* full_adder.vhd:19:23  */
  assign n48_o = n46_o | n47_o;
  /* full_adder.vhd:19:44  */
  assign n49_o = b & cin;
  /* full_adder.vhd:19:38  */
  assign n50_o = n48_o | n49_o;
endmodule

module half_adder
  (input  a,
   input  b,
   output s,
   output cout);
  wire n40_o;
  wire n41_o;
  assign s = n40_o; //(module output)
  assign cout = n41_o; //(module output)
  /* half_adder.vhd:14:12  */
  assign n40_o = a ^ b;
  /* half_adder.vhd:15:15  */
  assign n41_o = a & b;
endmodule

module RCA_4BIT_STRUCTURAL
  (input  [3:0] A,
   input  [3:0] B,
   output [4:0] C_out);
  wire [2:0] c_internal;
  wire n1_o;
  wire n2_o;
  wire ha_0_n3;
  wire ha_0_n4;
  wire ha_0_s;
  wire ha_0_cout;
  wire n9_o;
  wire n10_o;
  wire n11_o;
  wire fa_1_n12;
  wire fa_1_n13;
  wire fa_1_s;
  wire fa_1_cout;
  wire n18_o;
  wire n19_o;
  wire n20_o;
  wire fa_2_n21;
  wire fa_2_n22;
  wire fa_2_s;
  wire fa_2_cout;
  wire n27_o;
  wire n28_o;
  wire n29_o;
  wire fa_3_n30;
  wire fa_3_n31;
  wire fa_3_s;
  wire fa_3_cout;
  wire [2:0] n36_o;
  wire [4:0] n37_o;
  assign C_out = n37_o; //(module output)
  /* RCA_4BIT_STRUCTURAL.vhd:22:8  */
  assign c_internal = n36_o; // (signal)
  /* RCA_4BIT_STRUCTURAL.vhd:29:15  */
  assign n1_o = A[0]; // extract
  /* RCA_4BIT_STRUCTURAL.vhd:30:15  */
  assign n2_o = B[0]; // extract
  /* RCA_4BIT_STRUCTURAL.vhd:31:14  */
  assign ha_0_n3 = ha_0_s; // (signal)
  /* RCA_4BIT_STRUCTURAL.vhd:32:17  */
  assign ha_0_n4 = ha_0_cout; // (signal)
  /* RCA_4BIT_STRUCTURAL.vhd:27:5  */
  half_adder ha_0 (
    .a(n1_o),
    .b(n2_o),
    .s(ha_0_s),
    .cout(ha_0_cout));
  /* RCA_4BIT_STRUCTURAL.vhd:39:15  */
  assign n9_o = A[1]; // extract
  /* RCA_4BIT_STRUCTURAL.vhd:40:15  */
  assign n10_o = B[1]; // extract
  /* RCA_4BIT_STRUCTURAL.vhd:41:26  */
  assign n11_o = c_internal[0]; // extract
  /* RCA_4BIT_STRUCTURAL.vhd:42:14  */
  assign fa_1_n12 = fa_1_s; // (signal)
  /* RCA_4BIT_STRUCTURAL.vhd:43:17  */
  assign fa_1_n13 = fa_1_cout; // (signal)
  /* RCA_4BIT_STRUCTURAL.vhd:37:5  */
  full_adder fa_1 (
    .a(n9_o),
    .b(n10_o),
    .cin(n11_o),
    .s(fa_1_s),
    .cout(fa_1_cout));
  /* RCA_4BIT_STRUCTURAL.vhd:50:15  */
  assign n18_o = A[2]; // extract
  /* RCA_4BIT_STRUCTURAL.vhd:51:15  */
  assign n19_o = B[2]; // extract
  /* RCA_4BIT_STRUCTURAL.vhd:52:26  */
  assign n20_o = c_internal[1]; // extract
  /* RCA_4BIT_STRUCTURAL.vhd:53:14  */
  assign fa_2_n21 = fa_2_s; // (signal)
  /* RCA_4BIT_STRUCTURAL.vhd:54:17  */
  assign fa_2_n22 = fa_2_cout; // (signal)
  /* RCA_4BIT_STRUCTURAL.vhd:48:5  */
  full_adder fa_2 (
    .a(n18_o),
    .b(n19_o),
    .cin(n20_o),
    .s(fa_2_s),
    .cout(fa_2_cout));
  /* RCA_4BIT_STRUCTURAL.vhd:61:15  */
  assign n27_o = A[3]; // extract
  /* RCA_4BIT_STRUCTURAL.vhd:62:15  */
  assign n28_o = B[3]; // extract
  /* RCA_4BIT_STRUCTURAL.vhd:63:26  */
  assign n29_o = c_internal[2]; // extract
  /* RCA_4BIT_STRUCTURAL.vhd:64:14  */
  assign fa_3_n30 = fa_3_s; // (signal)
  /* RCA_4BIT_STRUCTURAL.vhd:65:17  */
  assign fa_3_n31 = fa_3_cout; // (signal)
  /* RCA_4BIT_STRUCTURAL.vhd:59:5  */
  full_adder fa_3 (
    .a(n27_o),
    .b(n28_o),
    .cin(n29_o),
    .s(fa_3_s),
    .cout(fa_3_cout));
  assign n36_o = {fa_2_n22, fa_1_n13, ha_0_n4};
  assign n37_o = {fa_3_n31, fa_3_n30, fa_2_n21, fa_1_n12, ha_0_n3};
endmodule

