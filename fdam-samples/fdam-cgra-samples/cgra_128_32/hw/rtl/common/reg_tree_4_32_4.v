module reg_tree_4_32_4 #
(
  parameter DATA_WIDTH = 16
)
(
  input clk,
  input [DATA_WIDTH-1:0] in,
  output [DATA_WIDTH-1:0] out_0,
  output [DATA_WIDTH-1:0] out_1,
  output [DATA_WIDTH-1:0] out_2,
  output [DATA_WIDTH-1:0] out_3,
  output [DATA_WIDTH-1:0] out_4,
  output [DATA_WIDTH-1:0] out_5,
  output [DATA_WIDTH-1:0] out_6,
  output [DATA_WIDTH-1:0] out_7,
  output [DATA_WIDTH-1:0] out_8,
  output [DATA_WIDTH-1:0] out_9,
  output [DATA_WIDTH-1:0] out_10,
  output [DATA_WIDTH-1:0] out_11,
  output [DATA_WIDTH-1:0] out_12,
  output [DATA_WIDTH-1:0] out_13,
  output [DATA_WIDTH-1:0] out_14,
  output [DATA_WIDTH-1:0] out_15,
  output [DATA_WIDTH-1:0] out_16,
  output [DATA_WIDTH-1:0] out_17,
  output [DATA_WIDTH-1:0] out_18,
  output [DATA_WIDTH-1:0] out_19,
  output [DATA_WIDTH-1:0] out_20,
  output [DATA_WIDTH-1:0] out_21,
  output [DATA_WIDTH-1:0] out_22,
  output [DATA_WIDTH-1:0] out_23,
  output [DATA_WIDTH-1:0] out_24,
  output [DATA_WIDTH-1:0] out_25,
  output [DATA_WIDTH-1:0] out_26,
  output [DATA_WIDTH-1:0] out_27,
  output [DATA_WIDTH-1:0] out_28,
  output [DATA_WIDTH-1:0] out_29,
  output [DATA_WIDTH-1:0] out_30,
  output [DATA_WIDTH-1:0] out_31
);

  reg [DATA_WIDTH-1:0] r0;
  reg [DATA_WIDTH-1:0] r1;
  reg [DATA_WIDTH-1:0] r2;
  reg [DATA_WIDTH-1:0] r3;
  reg [DATA_WIDTH-1:0] r4;
  reg [DATA_WIDTH-1:0] r5;
  reg [DATA_WIDTH-1:0] r6;
  reg [DATA_WIDTH-1:0] r7;
  reg [DATA_WIDTH-1:0] r8;
  reg [DATA_WIDTH-1:0] r9;
  reg [DATA_WIDTH-1:0] r10;
  reg [DATA_WIDTH-1:0] r11;
  reg [DATA_WIDTH-1:0] r12;
  reg [DATA_WIDTH-1:0] r13;
  reg [DATA_WIDTH-1:0] r14;
  reg [DATA_WIDTH-1:0] r15;
  reg [DATA_WIDTH-1:0] r16;
  reg [DATA_WIDTH-1:0] r17;
  reg [DATA_WIDTH-1:0] r18;
  reg [DATA_WIDTH-1:0] r19;
  reg [DATA_WIDTH-1:0] r20;
  reg [DATA_WIDTH-1:0] r21;
  reg [DATA_WIDTH-1:0] r22;
  reg [DATA_WIDTH-1:0] r23;
  reg [DATA_WIDTH-1:0] r24;
  reg [DATA_WIDTH-1:0] r25;
  reg [DATA_WIDTH-1:0] r26;
  reg [DATA_WIDTH-1:0] r27;
  reg [DATA_WIDTH-1:0] r28;
  reg [DATA_WIDTH-1:0] r29;
  reg [DATA_WIDTH-1:0] r30;
  reg [DATA_WIDTH-1:0] r31;
  reg [DATA_WIDTH-1:0] r32;
  reg [DATA_WIDTH-1:0] r33;
  reg [DATA_WIDTH-1:0] r34;
  reg [DATA_WIDTH-1:0] r35;
  reg [DATA_WIDTH-1:0] r36;
  reg [DATA_WIDTH-1:0] r37;
  reg [DATA_WIDTH-1:0] r38;
  reg [DATA_WIDTH-1:0] r39;
  reg [DATA_WIDTH-1:0] r40;
  reg [DATA_WIDTH-1:0] r41;
  reg [DATA_WIDTH-1:0] r42;
  reg [DATA_WIDTH-1:0] r43;
  reg [DATA_WIDTH-1:0] r44;
  reg [DATA_WIDTH-1:0] r45;
  reg [DATA_WIDTH-1:0] r46;
  reg [DATA_WIDTH-1:0] r47;
  reg [DATA_WIDTH-1:0] r48;
  reg [DATA_WIDTH-1:0] r49;
  reg [DATA_WIDTH-1:0] r50;
  reg [DATA_WIDTH-1:0] r51;
  reg [DATA_WIDTH-1:0] r52;
  reg [DATA_WIDTH-1:0] r53;
  reg [DATA_WIDTH-1:0] r54;
  reg [DATA_WIDTH-1:0] r55;
  reg [DATA_WIDTH-1:0] r56;
  reg [DATA_WIDTH-1:0] r57;
  reg [DATA_WIDTH-1:0] r58;
  reg [DATA_WIDTH-1:0] r59;
  reg [DATA_WIDTH-1:0] r60;
  reg [DATA_WIDTH-1:0] r61;
  reg [DATA_WIDTH-1:0] r62;
  reg [DATA_WIDTH-1:0] r63;
  reg [DATA_WIDTH-1:0] r64;
  reg [DATA_WIDTH-1:0] r65;
  reg [DATA_WIDTH-1:0] r66;
  reg [DATA_WIDTH-1:0] r67;
  reg [DATA_WIDTH-1:0] r68;
  reg [DATA_WIDTH-1:0] r69;
  reg [DATA_WIDTH-1:0] r70;
  reg [DATA_WIDTH-1:0] r71;
  reg [DATA_WIDTH-1:0] r72;
  reg [DATA_WIDTH-1:0] r73;
  reg [DATA_WIDTH-1:0] r74;
  reg [DATA_WIDTH-1:0] r75;
  reg [DATA_WIDTH-1:0] r76;
  reg [DATA_WIDTH-1:0] r77;
  reg [DATA_WIDTH-1:0] r78;
  reg [DATA_WIDTH-1:0] r79;
  reg [DATA_WIDTH-1:0] r80;
  reg [DATA_WIDTH-1:0] r81;
  reg [DATA_WIDTH-1:0] r82;
  reg [DATA_WIDTH-1:0] r83;
  reg [DATA_WIDTH-1:0] r84;
  reg [DATA_WIDTH-1:0] r85;
  reg [DATA_WIDTH-1:0] r86;
  reg [DATA_WIDTH-1:0] r87;
  reg [DATA_WIDTH-1:0] r88;
  reg [DATA_WIDTH-1:0] r89;
  reg [DATA_WIDTH-1:0] r90;
  reg [DATA_WIDTH-1:0] r91;
  reg [DATA_WIDTH-1:0] r92;
  reg [DATA_WIDTH-1:0] r93;
  reg [DATA_WIDTH-1:0] r94;
  reg [DATA_WIDTH-1:0] r95;
  reg [DATA_WIDTH-1:0] r96;
  reg [DATA_WIDTH-1:0] r97;
  reg [DATA_WIDTH-1:0] r98;
  reg [DATA_WIDTH-1:0] r99;
  reg [DATA_WIDTH-1:0] r100;
  reg [DATA_WIDTH-1:0] r101;
  reg [DATA_WIDTH-1:0] r102;
  reg [DATA_WIDTH-1:0] r103;
  reg [DATA_WIDTH-1:0] r104;
  reg [DATA_WIDTH-1:0] r105;
  reg [DATA_WIDTH-1:0] r106;
  reg [DATA_WIDTH-1:0] r107;
  reg [DATA_WIDTH-1:0] r108;
  reg [DATA_WIDTH-1:0] r109;
  reg [DATA_WIDTH-1:0] r110;
  reg [DATA_WIDTH-1:0] r111;
  reg [DATA_WIDTH-1:0] r112;
  reg [DATA_WIDTH-1:0] r113;
  reg [DATA_WIDTH-1:0] r114;
  reg [DATA_WIDTH-1:0] r115;
  reg [DATA_WIDTH-1:0] r116;
  reg [DATA_WIDTH-1:0] r117;
  reg [DATA_WIDTH-1:0] r118;
  reg [DATA_WIDTH-1:0] r119;
  reg [DATA_WIDTH-1:0] r120;
  reg [DATA_WIDTH-1:0] r121;
  reg [DATA_WIDTH-1:0] r122;
  reg [DATA_WIDTH-1:0] r123;
  reg [DATA_WIDTH-1:0] r124;
  reg [DATA_WIDTH-1:0] r125;
  reg [DATA_WIDTH-1:0] r126;
  reg [DATA_WIDTH-1:0] r127;
  reg [DATA_WIDTH-1:0] r128;
  reg [DATA_WIDTH-1:0] r129;
  reg [DATA_WIDTH-1:0] r130;
  reg [DATA_WIDTH-1:0] r131;
  reg [DATA_WIDTH-1:0] r132;
  reg [DATA_WIDTH-1:0] r133;
  reg [DATA_WIDTH-1:0] r134;
  reg [DATA_WIDTH-1:0] r135;
  reg [DATA_WIDTH-1:0] r136;
  reg [DATA_WIDTH-1:0] r137;
  reg [DATA_WIDTH-1:0] r138;
  reg [DATA_WIDTH-1:0] r139;
  reg [DATA_WIDTH-1:0] r140;
  reg [DATA_WIDTH-1:0] r141;
  reg [DATA_WIDTH-1:0] r142;
  reg [DATA_WIDTH-1:0] r143;
  reg [DATA_WIDTH-1:0] r144;
  reg [DATA_WIDTH-1:0] r145;
  reg [DATA_WIDTH-1:0] r146;
  reg [DATA_WIDTH-1:0] r147;
  reg [DATA_WIDTH-1:0] r148;
  reg [DATA_WIDTH-1:0] r149;
  reg [DATA_WIDTH-1:0] r150;
  reg [DATA_WIDTH-1:0] r151;
  reg [DATA_WIDTH-1:0] r152;
  reg [DATA_WIDTH-1:0] r153;
  reg [DATA_WIDTH-1:0] r154;
  reg [DATA_WIDTH-1:0] r155;
  reg [DATA_WIDTH-1:0] r156;
  reg [DATA_WIDTH-1:0] r157;
  reg [DATA_WIDTH-1:0] r158;
  reg [DATA_WIDTH-1:0] r159;
  reg [DATA_WIDTH-1:0] r160;
  reg [DATA_WIDTH-1:0] r161;
  reg [DATA_WIDTH-1:0] r162;
  reg [DATA_WIDTH-1:0] r163;
  reg [DATA_WIDTH-1:0] r164;
  reg [DATA_WIDTH-1:0] r165;
  reg [DATA_WIDTH-1:0] r166;
  reg [DATA_WIDTH-1:0] r167;
  reg [DATA_WIDTH-1:0] r168;
  reg [DATA_WIDTH-1:0] r169;
  reg [DATA_WIDTH-1:0] r170;

  initial begin
    r0 = 0;
    r1 = 0;
    r2 = 0;
    r3 = 0;
    r4 = 0;
    r5 = 0;
    r6 = 0;
    r7 = 0;
    r8 = 0;
    r9 = 0;
    r10 = 0;
    r11 = 0;
    r12 = 0;
    r13 = 0;
    r14 = 0;
    r15 = 0;
    r16 = 0;
    r17 = 0;
    r18 = 0;
    r19 = 0;
    r20 = 0;
    r21 = 0;
    r22 = 0;
    r23 = 0;
    r24 = 0;
    r25 = 0;
    r26 = 0;
    r27 = 0;
    r28 = 0;
    r29 = 0;
    r30 = 0;
    r31 = 0;
    r32 = 0;
    r33 = 0;
    r34 = 0;
    r35 = 0;
    r36 = 0;
    r37 = 0;
    r38 = 0;
    r39 = 0;
    r40 = 0;
    r41 = 0;
    r42 = 0;
    r43 = 0;
    r44 = 0;
    r45 = 0;
    r46 = 0;
    r47 = 0;
    r48 = 0;
    r49 = 0;
    r50 = 0;
    r51 = 0;
    r52 = 0;
    r53 = 0;
    r54 = 0;
    r55 = 0;
    r56 = 0;
    r57 = 0;
    r58 = 0;
    r59 = 0;
    r60 = 0;
    r61 = 0;
    r62 = 0;
    r63 = 0;
    r64 = 0;
    r65 = 0;
    r66 = 0;
    r67 = 0;
    r68 = 0;
    r69 = 0;
    r70 = 0;
    r71 = 0;
    r72 = 0;
    r73 = 0;
    r74 = 0;
    r75 = 0;
    r76 = 0;
    r77 = 0;
    r78 = 0;
    r79 = 0;
    r80 = 0;
    r81 = 0;
    r82 = 0;
    r83 = 0;
    r84 = 0;
    r85 = 0;
    r86 = 0;
    r87 = 0;
    r88 = 0;
    r89 = 0;
    r90 = 0;
    r91 = 0;
    r92 = 0;
    r93 = 0;
    r94 = 0;
    r95 = 0;
    r96 = 0;
    r97 = 0;
    r98 = 0;
    r99 = 0;
    r100 = 0;
    r101 = 0;
    r102 = 0;
    r103 = 0;
    r104 = 0;
    r105 = 0;
    r106 = 0;
    r107 = 0;
    r108 = 0;
    r109 = 0;
    r110 = 0;
    r111 = 0;
    r112 = 0;
    r113 = 0;
    r114 = 0;
    r115 = 0;
    r116 = 0;
    r117 = 0;
    r118 = 0;
    r119 = 0;
    r120 = 0;
    r121 = 0;
    r122 = 0;
    r123 = 0;
    r124 = 0;
    r125 = 0;
    r126 = 0;
    r127 = 0;
    r128 = 0;
    r129 = 0;
    r130 = 0;
    r131 = 0;
    r132 = 0;
    r133 = 0;
    r134 = 0;
    r135 = 0;
    r136 = 0;
    r137 = 0;
    r138 = 0;
    r139 = 0;
    r140 = 0;
    r141 = 0;
    r142 = 0;
    r143 = 0;
    r144 = 0;
    r145 = 0;
    r146 = 0;
    r147 = 0;
    r148 = 0;
    r149 = 0;
    r150 = 0;
    r151 = 0;
    r152 = 0;
    r153 = 0;
    r154 = 0;
    r155 = 0;
    r156 = 0;
    r157 = 0;
    r158 = 0;
    r159 = 0;
    r160 = 0;
    r161 = 0;
    r162 = 0;
    r163 = 0;
    r164 = 0;
    r165 = 0;
    r166 = 0;
    r167 = 0;
    r168 = 0;
    r169 = 0;
    r170 = 0;

  end



  always @(posedge clk) begin
    r0 <= in;
    r1 <= r0;
    r2 <= r0;
    r3 <= r1;
    r4 <= r1;
    r5 <= r1;
    r6 <= r1;
    r7 <= r2;
    r8 <= r2;
    r9 <= r2;
    r10 <= r2;
    r11 <= r3;
    r12 <= r3;
    r13 <= r3;
    r14 <= r3;
    r15 <= r4;
    r16 <= r4;
    r17 <= r4;
    r18 <= r4;
    r19 <= r5;
    r20 <= r5;
    r21 <= r5;
    r22 <= r5;
    r23 <= r6;
    r24 <= r6;
    r25 <= r6;
    r26 <= r6;
    r27 <= r7;
    r28 <= r7;
    r29 <= r7;
    r30 <= r7;
    r31 <= r8;
    r32 <= r8;
    r33 <= r8;
    r34 <= r8;
    r35 <= r9;
    r36 <= r9;
    r37 <= r9;
    r38 <= r9;
    r39 <= r10;
    r40 <= r10;
    r41 <= r10;
    r42 <= r10;
    r43 <= r11;
    r44 <= r12;
    r45 <= r13;
    r46 <= r14;
    r47 <= r15;
    r48 <= r16;
    r49 <= r17;
    r50 <= r18;
    r51 <= r19;
    r52 <= r20;
    r53 <= r21;
    r54 <= r22;
    r55 <= r23;
    r56 <= r24;
    r57 <= r25;
    r58 <= r26;
    r59 <= r27;
    r60 <= r28;
    r61 <= r29;
    r62 <= r30;
    r63 <= r31;
    r64 <= r32;
    r65 <= r33;
    r66 <= r34;
    r67 <= r35;
    r68 <= r36;
    r69 <= r37;
    r70 <= r38;
    r71 <= r39;
    r72 <= r40;
    r73 <= r41;
    r74 <= r42;
    r75 <= r43;
    r76 <= r44;
    r77 <= r45;
    r78 <= r46;
    r79 <= r47;
    r80 <= r48;
    r81 <= r49;
    r82 <= r50;
    r83 <= r51;
    r84 <= r52;
    r85 <= r53;
    r86 <= r54;
    r87 <= r55;
    r88 <= r56;
    r89 <= r57;
    r90 <= r58;
    r91 <= r59;
    r92 <= r60;
    r93 <= r61;
    r94 <= r62;
    r95 <= r63;
    r96 <= r64;
    r97 <= r65;
    r98 <= r66;
    r99 <= r67;
    r100 <= r68;
    r101 <= r69;
    r102 <= r70;
    r103 <= r71;
    r104 <= r72;
    r105 <= r73;
    r106 <= r74;
    r107 <= r75;
    r108 <= r76;
    r109 <= r77;
    r110 <= r78;
    r111 <= r79;
    r112 <= r80;
    r113 <= r81;
    r114 <= r82;
    r115 <= r83;
    r116 <= r84;
    r117 <= r85;
    r118 <= r86;
    r119 <= r87;
    r120 <= r88;
    r121 <= r89;
    r122 <= r90;
    r123 <= r91;
    r124 <= r92;
    r125 <= r93;
    r126 <= r94;
    r127 <= r95;
    r128 <= r96;
    r129 <= r97;
    r130 <= r98;
    r131 <= r99;
    r132 <= r100;
    r133 <= r101;
    r134 <= r102;
    r135 <= r103;
    r136 <= r104;
    r137 <= r105;
    r138 <= r106;
    r139 <= r107;
    r140 <= r108;
    r141 <= r109;
    r142 <= r110;
    r143 <= r111;
    r144 <= r112;
    r145 <= r113;
    r146 <= r114;
    r147 <= r115;
    r148 <= r116;
    r149 <= r117;
    r150 <= r118;
    r151 <= r119;
    r152 <= r120;
    r153 <= r121;
    r154 <= r122;
    r155 <= r123;
    r156 <= r124;
    r157 <= r125;
    r158 <= r126;
    r159 <= r127;
    r160 <= r128;
    r161 <= r129;
    r162 <= r130;
    r163 <= r131;
    r164 <= r132;
    r165 <= r133;
    r166 <= r134;
    r167 <= r135;
    r168 <= r136;
    r169 <= r137;
    r170 <= r138;

  end

  assign out_0 = r139;
  assign out_1 = r140;
  assign out_2 = r141;
  assign out_3 = r142;
  assign out_4 = r143;
  assign out_5 = r144;
  assign out_6 = r145;
  assign out_7 = r146;
  assign out_8 = r147;
  assign out_9 = r148;
  assign out_10 = r149;
  assign out_11 = r150;
  assign out_12 = r151;
  assign out_13 = r152;
  assign out_14 = r153;
  assign out_15 = r154;
  assign out_16 = r155;
  assign out_17 = r156;
  assign out_18 = r157;
  assign out_19 = r158;
  assign out_20 = r159;
  assign out_21 = r160;
  assign out_22 = r161;
  assign out_23 = r162;
  assign out_24 = r163;
  assign out_25 = r164;
  assign out_26 = r165;
  assign out_27 = r166;
  assign out_28 = r167;
  assign out_29 = r168;
  assign out_30 = r169;
  assign out_31 = r170;

endmodule