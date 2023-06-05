/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Expert(TM) in wire load mode
// Version   : R-2020.09-SP5
// Date      : Thu Dec 22 21:48:48 2022
/////////////////////////////////////////////////////////////


module cl ( In_pw, en, t, p, k );
  input In_pw, en;
  output t, p, k;

  assign t = 1'b0;

  OR2X2 k0 ( .A(In_pw), .B(1'b0), .Y(k) );
  CLKAND2X8 k1 ( .A(en), .B(k), .Y(p) );
endmodule


module fine_19 ( p, p1, r );
  input p;
  output p1, r;


  INVXL f1 ( .A(p), .Y(p1) );
  INVX2 f2 ( .A(p1), .Y(r) );
endmodule


module dff_3 ( Q, D, CK, RN );
  input D, CK, RN;
  output Q;


  DFFRHQX1 d0 ( .D(D), .CK(CK), .RN(RN), .Q(Q) );
endmodule


module fine_15 ( p, p1, r );
  input p;
  output p1, r;


  INVXL f1 ( .A(p), .Y(p1) );
  INVX2 f2 ( .A(p1), .Y(r) );
endmodule


module fine_16 ( p, p1, r );
  input p;
  output p1, r;


  INVXL f1 ( .A(p), .Y(p1) );
  INVX2 f2 ( .A(p1), .Y(r) );
endmodule


module fine_17 ( p, p1, r );
  input p;
  output p1, r;


  INVXL f1 ( .A(p), .Y(p1) );
  INVX2 f2 ( .A(p1), .Y(r) );
endmodule


module fine_18 ( p, p1, r );
  input p;
  output p1, r;


  INVXL f1 ( .A(p), .Y(p1) );
  INVX2 f2 ( .A(p1), .Y(r) );
endmodule


module fivefine_3 ( p, p1, r, Q, vdd, RN );
  output [0:4] p1;
  output [0:4] r;
  input p, vdd, RN;
  output Q;


  fine_19 ff0 ( .p(p), .p1(p1[0]), .r(r[0]) );
  fine_18 ff1 ( .p(r[0]), .p1(p1[1]), .r(r[1]) );
  fine_17 ff2 ( .p(r[1]), .p1(p1[2]), .r(r[2]) );
  fine_16 ff3 ( .p(r[2]), .p1(p1[3]), .r(r[3]) );
  fine_15 ff4 ( .p(r[3]), .p1(p1[4]), .r(r[4]) );
  dff_3 ff5 ( .Q(Q), .D(vdd), .CK(r[4]), .RN(RN) );
endmodule


module dff_0 ( Q, D, CK, RN );
  input D, CK, RN;
  output Q;


  DFFRHQX1 d0 ( .D(D), .CK(CK), .RN(RN), .Q(Q) );
endmodule


module fine_0 ( p, p1, r );
  input p;
  output p1, r;


  INVXL f1 ( .A(p), .Y(p1) );
  INVX2 f2 ( .A(p1), .Y(r) );
endmodule


module fine_1 ( p, p1, r );
  input p;
  output p1, r;


  INVXL f1 ( .A(p), .Y(p1) );
  INVX2 f2 ( .A(p1), .Y(r) );
endmodule


module fine_2 ( p, p1, r );
  input p;
  output p1, r;


  INVXL f1 ( .A(p), .Y(p1) );
  INVX2 f2 ( .A(p1), .Y(r) );
endmodule


module fine_3 ( p, p1, r );
  input p;
  output p1, r;


  INVXL f1 ( .A(p), .Y(p1) );
  INVX2 f2 ( .A(p1), .Y(r) );
endmodule


module fine_4 ( p, p1, r );
  input p;
  output p1, r;


  INVXL f1 ( .A(p), .Y(p1) );
  INVX2 f2 ( .A(p1), .Y(r) );
endmodule


module fivefine_0 ( p, p1, r, Q, vdd, RN );
  output [0:4] p1;
  output [0:4] r;
  input p, vdd, RN;
  output Q;


  fine_4 ff0 ( .p(p), .p1(p1[0]), .r(r[0]) );
  fine_3 ff1 ( .p(r[0]), .p1(p1[1]), .r(r[1]) );
  fine_2 ff2 ( .p(r[1]), .p1(p1[2]), .r(r[2]) );
  fine_1 ff3 ( .p(r[2]), .p1(p1[3]), .r(r[3]) );
  fine_0 ff4 ( .p(r[3]), .p1(p1[4]), .r(r[4]) );
  dff_0 ff5 ( .Q(Q), .D(vdd), .CK(r[4]), .RN(RN) );
endmodule


module dff_1 ( Q, D, CK, RN );
  input D, CK, RN;
  output Q;


  DFFRHQX1 d0 ( .D(D), .CK(CK), .RN(RN), .Q(Q) );
endmodule


module fine_5 ( p, p1, r );
  input p;
  output p1, r;


  INVXL f1 ( .A(p), .Y(p1) );
  INVX2 f2 ( .A(p1), .Y(r) );
endmodule


module fine_6 ( p, p1, r );
  input p;
  output p1, r;


  INVXL f1 ( .A(p), .Y(p1) );
  INVX2 f2 ( .A(p1), .Y(r) );
endmodule


module fine_7 ( p, p1, r );
  input p;
  output p1, r;


  INVXL f1 ( .A(p), .Y(p1) );
  INVX2 f2 ( .A(p1), .Y(r) );
endmodule


module fine_8 ( p, p1, r );
  input p;
  output p1, r;


  INVXL f1 ( .A(p), .Y(p1) );
  INVX2 f2 ( .A(p1), .Y(r) );
endmodule


module fine_9 ( p, p1, r );
  input p;
  output p1, r;


  INVXL f1 ( .A(p), .Y(p1) );
  INVX2 f2 ( .A(p1), .Y(r) );
endmodule


module fivefine_1 ( p, p1, r, Q, vdd, RN );
  output [0:4] p1;
  output [0:4] r;
  input p, vdd, RN;
  output Q;


  fine_9 ff0 ( .p(p), .p1(p1[0]), .r(r[0]) );
  fine_8 ff1 ( .p(r[0]), .p1(p1[1]), .r(r[1]) );
  fine_7 ff2 ( .p(r[1]), .p1(p1[2]), .r(r[2]) );
  fine_6 ff3 ( .p(r[2]), .p1(p1[3]), .r(r[3]) );
  fine_5 ff4 ( .p(r[3]), .p1(p1[4]), .r(r[4]) );
  dff_1 ff5 ( .Q(Q), .D(vdd), .CK(r[4]), .RN(RN) );
endmodule


module dff_2 ( Q, D, CK, RN );
  input D, CK, RN;
  output Q;


  DFFRHQX1 d0 ( .D(D), .CK(CK), .RN(RN), .Q(Q) );
endmodule


module fine_10 ( p, p1, r );
  input p;
  output p1, r;


  INVXL f1 ( .A(p), .Y(p1) );
  INVX2 f2 ( .A(p1), .Y(r) );
endmodule


module fine_11 ( p, p1, r );
  input p;
  output p1, r;


  INVXL f1 ( .A(p), .Y(p1) );
  INVX2 f2 ( .A(p1), .Y(r) );
endmodule


module fine_12 ( p, p1, r );
  input p;
  output p1, r;


  INVXL f1 ( .A(p), .Y(p1) );
  INVX2 f2 ( .A(p1), .Y(r) );
endmodule


module fine_13 ( p, p1, r );
  input p;
  output p1, r;


  INVXL f1 ( .A(p), .Y(p1) );
  INVX2 f2 ( .A(p1), .Y(r) );
endmodule


module fine_14 ( p, p1, r );
  input p;
  output p1, r;


  INVXL f1 ( .A(p), .Y(p1) );
  INVX2 f2 ( .A(p1), .Y(r) );
endmodule


module fivefine_2 ( p, p1, r, Q, vdd, RN );
  output [0:4] p1;
  output [0:4] r;
  input p, vdd, RN;
  output Q;


  fine_14 ff0 ( .p(p), .p1(p1[0]), .r(r[0]) );
  fine_13 ff1 ( .p(r[0]), .p1(p1[1]), .r(r[1]) );
  fine_12 ff2 ( .p(r[1]), .p1(p1[2]), .r(r[2]) );
  fine_11 ff3 ( .p(r[2]), .p1(p1[3]), .r(r[3]) );
  fine_10 ff4 ( .p(r[3]), .p1(p1[4]), .r(r[4]) );
  dff_2 ff5 ( .Q(Q), .D(vdd), .CK(r[4]), .RN(RN) );
endmodule


module tdc1 ( In_pw, en, t, vdd, RN, p, k, p1, r, out_code );
  input [0:3] RN;
  output [0:19] p1;
  output [0:19] r;
  output [0:3] out_code;
  input In_pw, en, t, vdd;
  output p, k;


  cl j0 ( .In_pw(In_pw), .en(en), .t(), .p(p), .k(k) );
  fivefine_3 j1 ( .p(p), .p1(p1[0:4]), .r(r[0:4]), .Q(out_code[3]), .vdd(vdd), 
        .RN(RN[0]) );
  fivefine_2 j2 ( .p(r[4]), .p1(p1[5:9]), .r(r[5:9]), .Q(out_code[2]), .vdd(
        vdd), .RN(RN[1]) );
  fivefine_1 j3 ( .p(r[9]), .p1(p1[10:14]), .r(r[10:14]), .Q(out_code[1]), 
        .vdd(vdd), .RN(RN[2]) );
  fivefine_0 j4 ( .p(r[14]), .p1(p1[15:19]), .r(r[15:19]), .Q(out_code[0]), 
        .vdd(vdd), .RN(RN[3]) );
endmodule

