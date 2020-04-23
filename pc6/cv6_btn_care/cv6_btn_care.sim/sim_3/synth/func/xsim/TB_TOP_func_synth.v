// Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2019.2 (win64) Build 2708876 Wed Nov  6 21:40:23 MST 2019
// Date        : Thu Apr 23 20:30:22 2020
// Host        : DELL_E6530 running 64-bit major release  (build 9200)
// Command     : write_verilog -mode funcsim -nolib -force -file
//               C:/Users/Uzivatel/Documents/_skola/MPLD/pc6/cv6_btn_care/cv6_btn_care.sim/sim_3/synth/func/xsim/TB_TOP_func_synth.v
// Design      : TOP
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7k70tfbv676-1
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* NotValidForBitStream *)
module TOP
   (clk,
    btn_i,
    sw_i,
    led_o,
    disp_seg_o,
    disp_dig_o);
  input clk;
  input [3:0]btn_i;
  input [3:0]sw_i;
  output [7:0]led_o;
  output [7:0]disp_seg_o;
  output [4:0]disp_dig_o;

  wire StopWatch_control_FSM_i_n_3;
  wire [3:0]btn_i;
  wire [1:0]btn_i_IBUF;
  wire ce_gen_i_n_1;
  wire citac_BCD_i_n_0;
  wire citac_BCD_i_n_1;
  wire citac_BCD_i_n_2;
  wire citac_BCD_i_n_3;
  wire citac_BCD_i_n_4;
  wire citac_BCD_i_n_5;
  wire citac_BCD_i_n_6;
  wire citac_BCD_i_n_7;
  wire clk;
  wire clk_IBUF;
  wire clk_IBUF_BUFG;
  wire clk_en_100Hz;
  wire cnt_enable;
  wire cnt_reset;
  wire [3:0]dig_1_i;
  wire [3:0]dig_2_i;
  wire [3:0]dig_3_i;
  wire [3:0]dig_4_i;
  wire [4:0]disp_dig_o;
  wire [4:0]disp_dig_o_OBUF;
  wire disp_enable;
  wire [7:0]disp_seg_o;
  wire [7:0]disp_seg_o_OBUF;
  wire \edge_detector_i/old_state ;
  wire \edge_detector_i/old_state_0 ;
  wire \gen_btn_in[0].btn_in_inst_n_1 ;
  wire \gen_btn_in[0].btn_in_inst_n_2 ;
  wire \gen_btn_in[0].btn_in_inst_n_3 ;
  wire \gen_btn_in[1].btn_in_inst_n_1 ;
  wire [7:0]led_o;
  wire [7:0]led_o_OBUF;
  wire s_btn_posedge_0;

  stopwatch_FSM StopWatch_control_FSM_i
       (.D(\gen_btn_in[0].btn_in_inst_n_3 ),
        .E(disp_enable),
        .\FSM_onehot_pres_state_reg[1]_0 (\gen_btn_in[0].btn_in_inst_n_2 ),
        .\FSM_onehot_pres_state_reg[2]_0 (\gen_btn_in[0].btn_in_inst_n_1 ),
        .\FSM_onehot_pres_state_reg[2]_1 (\gen_btn_in[1].btn_in_inst_n_1 ),
        .Q(StopWatch_control_FSM_i_n_3),
        .SR(cnt_reset),
        .clk_IBUF_BUFG(clk_IBUF_BUFG),
        .cnt_enable(cnt_enable),
        .old_state(\edge_detector_i/old_state ),
        .old_state_0(\edge_detector_i/old_state_0 ),
        .s_btn_posedge_0(s_btn_posedge_0));
  IBUF \btn_i_IBUF[0]_inst 
       (.I(btn_i[0]),
        .O(btn_i_IBUF[0]));
  IBUF \btn_i_IBUF[1]_inst 
       (.I(btn_i[1]),
        .O(btn_i_IBUF[1]));
  ce_gen ce_gen_i
       (.E(ce_gen_i_n_1),
        .clk_IBUF_BUFG(clk_IBUF_BUFG),
        .clk_en_100Hz(clk_en_100Hz),
        .cnt_enable(cnt_enable));
  counter_BCD citac_BCD_i
       (.CLK(clk_IBUF_BUFG),
        .E(ce_gen_i_n_1),
        .Q({citac_BCD_i_n_0,citac_BCD_i_n_1,citac_BCD_i_n_2,citac_BCD_i_n_3}),
        .SR(cnt_reset),
        .clk_en_100Hz(clk_en_100Hz),
        .\cnt_10m_reg[3]_0 ({citac_BCD_i_n_4,citac_BCD_i_n_5,citac_BCD_i_n_6,citac_BCD_i_n_7}),
        .cnt_enable(cnt_enable),
        .led_o_OBUF(led_o_OBUF));
  BUFG clk_IBUF_BUFG_inst
       (.I(clk_IBUF),
        .O(clk_IBUF_BUFG));
  IBUF clk_IBUF_inst
       (.I(clk),
        .O(clk_IBUF));
  OBUF \disp_dig_o_OBUF[0]_inst 
       (.I(disp_dig_o_OBUF[0]),
        .O(disp_dig_o[0]));
  OBUF \disp_dig_o_OBUF[1]_inst 
       (.I(disp_dig_o_OBUF[1]),
        .O(disp_dig_o[1]));
  OBUF \disp_dig_o_OBUF[2]_inst 
       (.I(disp_dig_o_OBUF[2]),
        .O(disp_dig_o[2]));
  OBUF \disp_dig_o_OBUF[3]_inst 
       (.I(disp_dig_o_OBUF[3]),
        .O(disp_dig_o[3]));
  OBUF \disp_dig_o_OBUF[4]_inst 
       (.I(disp_dig_o_OBUF[4]),
        .O(disp_dig_o[4]));
  display_reg disp_out_REG_i
       (.CLK(clk_IBUF_BUFG),
        .D({citac_BCD_i_n_0,citac_BCD_i_n_1,citac_BCD_i_n_2,citac_BCD_i_n_3}),
        .E(disp_enable),
        .Q(dig_1_i),
        .\hthsec_BCD_H_reg_reg[3]_0 (dig_3_i),
        .\hthsec_BCD_L_reg_reg[3]_0 (dig_4_i),
        .\hthsec_BCD_L_reg_reg[3]_1 ({citac_BCD_i_n_4,citac_BCD_i_n_5,citac_BCD_i_n_6,citac_BCD_i_n_7}),
        .led_o_OBUF(led_o_OBUF),
        .\second_BCD_L_reg_reg[3]_0 (dig_2_i));
  OBUF \disp_seg_o_OBUF[0]_inst 
       (.I(disp_seg_o_OBUF[0]),
        .O(disp_seg_o[0]));
  OBUF \disp_seg_o_OBUF[1]_inst 
       (.I(disp_seg_o_OBUF[1]),
        .O(disp_seg_o[1]));
  OBUF \disp_seg_o_OBUF[2]_inst 
       (.I(disp_seg_o_OBUF[2]),
        .O(disp_seg_o[2]));
  OBUF \disp_seg_o_OBUF[3]_inst 
       (.I(disp_seg_o_OBUF[3]),
        .O(disp_seg_o[3]));
  OBUF \disp_seg_o_OBUF[4]_inst 
       (.I(disp_seg_o_OBUF[4]),
        .O(disp_seg_o[4]));
  OBUF \disp_seg_o_OBUF[5]_inst 
       (.I(disp_seg_o_OBUF[5]),
        .O(disp_seg_o[5]));
  OBUF \disp_seg_o_OBUF[6]_inst 
       (.I(disp_seg_o_OBUF[6]),
        .O(disp_seg_o[6]));
  OBUF \disp_seg_o_OBUF[7]_inst 
       (.I(disp_seg_o_OBUF[7]),
        .O(disp_seg_o[7]));
  btn_in \gen_btn_in[0].btn_in_inst 
       (.CLK(clk_IBUF_BUFG),
        .D(\gen_btn_in[0].btn_in_inst_n_3 ),
        .\FSM_onehot_pres_state_reg[4] (\gen_btn_in[1].btn_in_inst_n_1 ),
        .Q(StopWatch_control_FSM_i_n_3),
        .clk_en_100Hz(clk_en_100Hz),
        .in0(btn_i_IBUF[0]),
        .old_state(\edge_detector_i/old_state ),
        .old_state_0(\edge_detector_i/old_state_0 ),
        .old_state_reg(\gen_btn_in[0].btn_in_inst_n_2 ),
        .s_btn_debounced_reg(\gen_btn_in[0].btn_in_inst_n_1 ),
        .s_btn_posedge_0(s_btn_posedge_0));
  btn_in_0 \gen_btn_in[1].btn_in_inst 
       (.CLK(clk_IBUF_BUFG),
        .clk_en_100Hz(clk_en_100Hz),
        .in0(btn_i_IBUF[1]),
        .old_state(\edge_detector_i/old_state_0 ),
        .s_btn_debounced_reg(\gen_btn_in[1].btn_in_inst_n_1 ));
  OBUF \led_o_OBUF[0]_inst 
       (.I(led_o_OBUF[0]),
        .O(led_o[0]));
  OBUF \led_o_OBUF[1]_inst 
       (.I(led_o_OBUF[1]),
        .O(led_o[1]));
  OBUF \led_o_OBUF[2]_inst 
       (.I(led_o_OBUF[2]),
        .O(led_o[2]));
  OBUF \led_o_OBUF[3]_inst 
       (.I(led_o_OBUF[3]),
        .O(led_o[3]));
  OBUF \led_o_OBUF[4]_inst 
       (.I(led_o_OBUF[4]),
        .O(led_o[4]));
  OBUF \led_o_OBUF[5]_inst 
       (.I(led_o_OBUF[5]),
        .O(led_o[5]));
  OBUF \led_o_OBUF[6]_inst 
       (.I(led_o_OBUF[6]),
        .O(led_o[6]));
  OBUF \led_o_OBUF[7]_inst 
       (.I(led_o_OBUF[7]),
        .O(led_o[7]));
  (* IMPORTED_FROM = "C:/Users/Uzivatel/Documents/_skola/MPLD/cv05_stopwatch/cv05_stopwatch.srcs/sources_1/imports/Downloads/seg_disp_driver.dcp" *) 
  (* IMPORTED_TYPE = "CHECKPOINT" *) 
  (* IS_IMPORTED *) 
  seg_disp_driver seg_disp_driver_i
       (.clk(clk_IBUF_BUFG),
        .dig_1_i(dig_1_i),
        .dig_2_i(dig_2_i),
        .dig_3_i(dig_3_i),
        .dig_4_i(dig_4_i),
        .disp_dig_o(disp_dig_o_OBUF),
        .disp_seg_o(disp_seg_o_OBUF),
        .dots_i({1'b0,1'b1,1'b1}),
        .dp_i({1'b0,1'b0,1'b0,1'b0}));
endmodule

module btn_in
   (old_state,
    s_btn_debounced_reg,
    old_state_reg,
    D,
    s_btn_posedge_0,
    in0,
    CLK,
    clk_en_100Hz,
    old_state_0,
    \FSM_onehot_pres_state_reg[4] ,
    Q);
  output old_state;
  output s_btn_debounced_reg;
  output old_state_reg;
  output [0:0]D;
  output s_btn_posedge_0;
  input in0;
  input CLK;
  input clk_en_100Hz;
  input old_state_0;
  input \FSM_onehot_pres_state_reg[4] ;
  input [0:0]Q;

  wire CLK;
  wire [0:0]D;
  wire \FSM_onehot_pres_state_reg[4] ;
  wire [0:0]Q;
  wire clk_en_100Hz;
  wire in0;
  wire old_state;
  wire old_state_0;
  wire old_state_reg;
  wire [0:0]p_0_in;
  wire s_btn_debounced_reg;
  wire s_btn_posedge_0;

  debouncer_1 debouncer_i
       (.CLK(CLK),
        .D(D),
        .\FSM_onehot_pres_state_reg[4] (old_state),
        .\FSM_onehot_pres_state_reg[4]_0 (\FSM_onehot_pres_state_reg[4] ),
        .Q(Q),
        .clk_en_100Hz(clk_en_100Hz),
        .old_state_0(old_state_0),
        .\s_btn_buff_reg[0]_0 (p_0_in),
        .s_btn_debounced_reg_0(s_btn_debounced_reg),
        .s_btn_posedge_0(s_btn_posedge_0));
  edge_detector_2 edge_detector_i
       (.CLK(CLK),
        .\FSM_onehot_pres_state_reg[1] (\FSM_onehot_pres_state_reg[4] ),
        .old_state(old_state),
        .old_state_0(old_state_0),
        .old_state_reg_0(old_state_reg),
        .old_state_reg_1(s_btn_debounced_reg));
  sync_reg_3 sync_reg_i
       (.CLK(CLK),
        .in0(in0),
        .q_o_reg_0(p_0_in));
endmodule

(* ORIG_REF_NAME = "btn_in" *) 
module btn_in_0
   (old_state,
    s_btn_debounced_reg,
    in0,
    CLK,
    clk_en_100Hz);
  output old_state;
  output s_btn_debounced_reg;
  input in0;
  input CLK;
  input clk_en_100Hz;

  wire CLK;
  wire clk_en_100Hz;
  wire in0;
  wire old_state;
  wire [0:0]p_0_in__0;
  wire s_btn_debounced_reg;

  debouncer debouncer_i
       (.CLK(CLK),
        .D(p_0_in__0),
        .clk_en_100Hz(clk_en_100Hz),
        .s_btn_debounced_reg_0(s_btn_debounced_reg));
  edge_detector edge_detector_i
       (.CLK(CLK),
        .old_state(old_state),
        .old_state_reg_0(s_btn_debounced_reg));
  sync_reg sync_reg_i
       (.CLK(CLK),
        .D(p_0_in__0),
        .in0(in0));
endmodule

module ce_gen
   (clk_en_100Hz,
    E,
    clk_IBUF_BUFG,
    cnt_enable);
  output clk_en_100Hz;
  output [0:0]E;
  input clk_IBUF_BUFG;
  input cnt_enable;

  wire [0:0]E;
  wire clk_IBUF_BUFG;
  wire clk_en_100Hz;
  wire [18:0]cnt_d;
  wire [0:0]cnt_d_0;
  wire cnt_enable;
  wire [18:1]data0;
  wire \divided_output.cnt_d[18]_i_1_n_0 ;
  wire \divided_output.cnt_d[18]_i_2_n_0 ;
  wire \divided_output.cnt_d[18]_i_3_n_0 ;
  wire \divided_output.cnt_d[18]_i_4_n_0 ;
  wire \divided_output.cnt_d[18]_i_5_n_0 ;
  wire \divided_output.cnt_d[18]_i_6_n_0 ;
  wire plusOp_carry__0_n_0;
  wire plusOp_carry__0_n_1;
  wire plusOp_carry__0_n_2;
  wire plusOp_carry__0_n_3;
  wire plusOp_carry__1_n_0;
  wire plusOp_carry__1_n_1;
  wire plusOp_carry__1_n_2;
  wire plusOp_carry__1_n_3;
  wire plusOp_carry__2_n_0;
  wire plusOp_carry__2_n_1;
  wire plusOp_carry__2_n_2;
  wire plusOp_carry__2_n_3;
  wire plusOp_carry__3_n_3;
  wire plusOp_carry_n_0;
  wire plusOp_carry_n_1;
  wire plusOp_carry_n_2;
  wire plusOp_carry_n_3;
  wire [3:1]NLW_plusOp_carry__3_CO_UNCONNECTED;
  wire [3:2]NLW_plusOp_carry__3_O_UNCONNECTED;

  LUT2 #(
    .INIT(4'h8)) 
    \cnt_10m[3]_i_1 
       (.I0(clk_en_100Hz),
        .I1(cnt_enable),
        .O(E));
  FDRE #(
    .INIT(1'b0)) 
    \divided_output.ce_o_reg 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(\divided_output.cnt_d[18]_i_1_n_0 ),
        .Q(clk_en_100Hz),
        .R(1'b0));
  (* SOFT_HLUTNM = "soft_lutpair1" *) 
  LUT1 #(
    .INIT(2'h1)) 
    \divided_output.cnt_d[0]_i_1 
       (.I0(cnt_d[0]),
        .O(cnt_d_0));
  LUT5 #(
    .INIT(32'h00000001)) 
    \divided_output.cnt_d[18]_i_1 
       (.I0(\divided_output.cnt_d[18]_i_2_n_0 ),
        .I1(\divided_output.cnt_d[18]_i_3_n_0 ),
        .I2(\divided_output.cnt_d[18]_i_4_n_0 ),
        .I3(\divided_output.cnt_d[18]_i_5_n_0 ),
        .I4(\divided_output.cnt_d[18]_i_6_n_0 ),
        .O(\divided_output.cnt_d[18]_i_1_n_0 ));
  LUT4 #(
    .INIT(16'h7FFF)) 
    \divided_output.cnt_d[18]_i_2 
       (.I0(cnt_d[2]),
        .I1(cnt_d[1]),
        .I2(cnt_d[4]),
        .I3(cnt_d[3]),
        .O(\divided_output.cnt_d[18]_i_2_n_0 ));
  LUT4 #(
    .INIT(16'hDFFF)) 
    \divided_output.cnt_d[18]_i_3 
       (.I0(cnt_d[13]),
        .I1(cnt_d[14]),
        .I2(cnt_d[16]),
        .I3(cnt_d[15]),
        .O(\divided_output.cnt_d[18]_i_3_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair1" *) 
  LUT3 #(
    .INIT(8'h7F)) 
    \divided_output.cnt_d[18]_i_4 
       (.I0(cnt_d[18]),
        .I1(cnt_d[17]),
        .I2(cnt_d[0]),
        .O(\divided_output.cnt_d[18]_i_4_n_0 ));
  LUT4 #(
    .INIT(16'hFFFE)) 
    \divided_output.cnt_d[18]_i_5 
       (.I0(cnt_d[10]),
        .I1(cnt_d[9]),
        .I2(cnt_d[12]),
        .I3(cnt_d[11]),
        .O(\divided_output.cnt_d[18]_i_5_n_0 ));
  LUT4 #(
    .INIT(16'hFFEF)) 
    \divided_output.cnt_d[18]_i_6 
       (.I0(cnt_d[6]),
        .I1(cnt_d[5]),
        .I2(cnt_d[8]),
        .I3(cnt_d[7]),
        .O(\divided_output.cnt_d[18]_i_6_n_0 ));
  FDRE #(
    .INIT(1'b1)) 
    \divided_output.cnt_d_reg[0] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(cnt_d_0),
        .Q(cnt_d[0]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \divided_output.cnt_d_reg[10] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(data0[10]),
        .Q(cnt_d[10]),
        .R(\divided_output.cnt_d[18]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \divided_output.cnt_d_reg[11] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(data0[11]),
        .Q(cnt_d[11]),
        .R(\divided_output.cnt_d[18]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \divided_output.cnt_d_reg[12] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(data0[12]),
        .Q(cnt_d[12]),
        .R(\divided_output.cnt_d[18]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b1)) 
    \divided_output.cnt_d_reg[13] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(data0[13]),
        .Q(cnt_d[13]),
        .R(\divided_output.cnt_d[18]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \divided_output.cnt_d_reg[14] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(data0[14]),
        .Q(cnt_d[14]),
        .R(\divided_output.cnt_d[18]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b1)) 
    \divided_output.cnt_d_reg[15] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(data0[15]),
        .Q(cnt_d[15]),
        .R(\divided_output.cnt_d[18]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b1)) 
    \divided_output.cnt_d_reg[16] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(data0[16]),
        .Q(cnt_d[16]),
        .R(\divided_output.cnt_d[18]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b1)) 
    \divided_output.cnt_d_reg[17] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(data0[17]),
        .Q(cnt_d[17]),
        .R(\divided_output.cnt_d[18]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b1)) 
    \divided_output.cnt_d_reg[18] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(data0[18]),
        .Q(cnt_d[18]),
        .R(\divided_output.cnt_d[18]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b1)) 
    \divided_output.cnt_d_reg[1] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(data0[1]),
        .Q(cnt_d[1]),
        .R(\divided_output.cnt_d[18]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b1)) 
    \divided_output.cnt_d_reg[2] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(data0[2]),
        .Q(cnt_d[2]),
        .R(\divided_output.cnt_d[18]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b1)) 
    \divided_output.cnt_d_reg[3] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(data0[3]),
        .Q(cnt_d[3]),
        .R(\divided_output.cnt_d[18]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b1)) 
    \divided_output.cnt_d_reg[4] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(data0[4]),
        .Q(cnt_d[4]),
        .R(\divided_output.cnt_d[18]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \divided_output.cnt_d_reg[5] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(data0[5]),
        .Q(cnt_d[5]),
        .R(\divided_output.cnt_d[18]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \divided_output.cnt_d_reg[6] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(data0[6]),
        .Q(cnt_d[6]),
        .R(\divided_output.cnt_d[18]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \divided_output.cnt_d_reg[7] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(data0[7]),
        .Q(cnt_d[7]),
        .R(\divided_output.cnt_d[18]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b1)) 
    \divided_output.cnt_d_reg[8] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(data0[8]),
        .Q(cnt_d[8]),
        .R(\divided_output.cnt_d[18]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \divided_output.cnt_d_reg[9] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(data0[9]),
        .Q(cnt_d[9]),
        .R(\divided_output.cnt_d[18]_i_1_n_0 ));
  CARRY4 plusOp_carry
       (.CI(1'b0),
        .CO({plusOp_carry_n_0,plusOp_carry_n_1,plusOp_carry_n_2,plusOp_carry_n_3}),
        .CYINIT(cnt_d[0]),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(data0[4:1]),
        .S(cnt_d[4:1]));
  CARRY4 plusOp_carry__0
       (.CI(plusOp_carry_n_0),
        .CO({plusOp_carry__0_n_0,plusOp_carry__0_n_1,plusOp_carry__0_n_2,plusOp_carry__0_n_3}),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(data0[8:5]),
        .S(cnt_d[8:5]));
  CARRY4 plusOp_carry__1
       (.CI(plusOp_carry__0_n_0),
        .CO({plusOp_carry__1_n_0,plusOp_carry__1_n_1,plusOp_carry__1_n_2,plusOp_carry__1_n_3}),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(data0[12:9]),
        .S(cnt_d[12:9]));
  CARRY4 plusOp_carry__2
       (.CI(plusOp_carry__1_n_0),
        .CO({plusOp_carry__2_n_0,plusOp_carry__2_n_1,plusOp_carry__2_n_2,plusOp_carry__2_n_3}),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(data0[16:13]),
        .S(cnt_d[16:13]));
  CARRY4 plusOp_carry__3
       (.CI(plusOp_carry__2_n_0),
        .CO({NLW_plusOp_carry__3_CO_UNCONNECTED[3:1],plusOp_carry__3_n_3}),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({NLW_plusOp_carry__3_O_UNCONNECTED[3:2],data0[18:17]}),
        .S({1'b0,1'b0,cnt_d[18:17]}));
endmodule

module counter_BCD
   (Q,
    \cnt_10m_reg[3]_0 ,
    led_o_OBUF,
    cnt_enable,
    clk_en_100Hz,
    SR,
    E,
    CLK);
  output [3:0]Q;
  output [3:0]\cnt_10m_reg[3]_0 ;
  output [7:0]led_o_OBUF;
  input cnt_enable;
  input clk_en_100Hz;
  input [0:0]SR;
  input [0:0]E;
  input CLK;

  wire CLK;
  wire [0:0]E;
  wire [3:0]Q;
  wire [0:0]SR;
  wire clk_en_100Hz;
  wire cnt_100m;
  wire \cnt_100m[0]_i_1_n_0 ;
  wire \cnt_100m[1]_i_1_n_0 ;
  wire \cnt_100m[2]_i_1_n_0 ;
  wire \cnt_100m[3]_i_2_n_0 ;
  wire \cnt_10m[0]_i_1_n_0 ;
  wire \cnt_10m[1]_i_1_n_0 ;
  wire \cnt_10m[2]_i_1_n_0 ;
  wire \cnt_10m[3]_i_2_n_0 ;
  wire [3:0]\cnt_10m_reg[3]_0 ;
  wire cnt_10s;
  wire \cnt_10s[0]_i_1_n_0 ;
  wire \cnt_10s[1]_i_1_n_0 ;
  wire \cnt_10s[2]_i_1_n_0 ;
  wire \cnt_10s[3]_i_2_n_0 ;
  wire \cnt_10s[3]_i_3_n_0 ;
  wire cnt_1s;
  wire \cnt_1s[0]_i_1_n_0 ;
  wire \cnt_1s[1]_i_1_n_0 ;
  wire \cnt_1s[2]_i_1_n_0 ;
  wire \cnt_1s[3]_i_2_n_0 ;
  wire cnt_enable;
  wire [7:0]led_o_OBUF;

  (* SOFT_HLUTNM = "soft_lutpair8" *) 
  LUT1 #(
    .INIT(2'h1)) 
    \cnt_100m[0]_i_1 
       (.I0(Q[0]),
        .O(\cnt_100m[0]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair3" *) 
  LUT4 #(
    .INIT(16'h0BF0)) 
    \cnt_100m[1]_i_1 
       (.I0(Q[2]),
        .I1(Q[3]),
        .I2(Q[1]),
        .I3(Q[0]),
        .O(\cnt_100m[1]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair8" *) 
  LUT3 #(
    .INIT(8'h6A)) 
    \cnt_100m[2]_i_1 
       (.I0(Q[2]),
        .I1(Q[1]),
        .I2(Q[0]),
        .O(\cnt_100m[2]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h0008000000000000)) 
    \cnt_100m[3]_i_1 
       (.I0(cnt_enable),
        .I1(clk_en_100Hz),
        .I2(\cnt_10m_reg[3]_0 [1]),
        .I3(\cnt_10m_reg[3]_0 [2]),
        .I4(\cnt_10m_reg[3]_0 [0]),
        .I5(\cnt_10m_reg[3]_0 [3]),
        .O(cnt_100m));
  (* SOFT_HLUTNM = "soft_lutpair3" *) 
  LUT4 #(
    .INIT(16'h6F80)) 
    \cnt_100m[3]_i_2 
       (.I0(Q[2]),
        .I1(Q[1]),
        .I2(Q[0]),
        .I3(Q[3]),
        .O(\cnt_100m[3]_i_2_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \cnt_100m_reg[0] 
       (.C(CLK),
        .CE(cnt_100m),
        .D(\cnt_100m[0]_i_1_n_0 ),
        .Q(Q[0]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \cnt_100m_reg[1] 
       (.C(CLK),
        .CE(cnt_100m),
        .D(\cnt_100m[1]_i_1_n_0 ),
        .Q(Q[1]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \cnt_100m_reg[2] 
       (.C(CLK),
        .CE(cnt_100m),
        .D(\cnt_100m[2]_i_1_n_0 ),
        .Q(Q[2]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \cnt_100m_reg[3] 
       (.C(CLK),
        .CE(cnt_100m),
        .D(\cnt_100m[3]_i_2_n_0 ),
        .Q(Q[3]),
        .R(SR));
  (* SOFT_HLUTNM = "soft_lutpair9" *) 
  LUT1 #(
    .INIT(2'h1)) 
    \cnt_10m[0]_i_1 
       (.I0(\cnt_10m_reg[3]_0 [0]),
        .O(\cnt_10m[0]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair2" *) 
  LUT4 #(
    .INIT(16'h0BF0)) 
    \cnt_10m[1]_i_1 
       (.I0(\cnt_10m_reg[3]_0 [2]),
        .I1(\cnt_10m_reg[3]_0 [3]),
        .I2(\cnt_10m_reg[3]_0 [1]),
        .I3(\cnt_10m_reg[3]_0 [0]),
        .O(\cnt_10m[1]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair9" *) 
  LUT3 #(
    .INIT(8'h6A)) 
    \cnt_10m[2]_i_1 
       (.I0(\cnt_10m_reg[3]_0 [2]),
        .I1(\cnt_10m_reg[3]_0 [1]),
        .I2(\cnt_10m_reg[3]_0 [0]),
        .O(\cnt_10m[2]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair2" *) 
  LUT4 #(
    .INIT(16'h6F80)) 
    \cnt_10m[3]_i_2 
       (.I0(\cnt_10m_reg[3]_0 [2]),
        .I1(\cnt_10m_reg[3]_0 [1]),
        .I2(\cnt_10m_reg[3]_0 [0]),
        .I3(\cnt_10m_reg[3]_0 [3]),
        .O(\cnt_10m[3]_i_2_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \cnt_10m_reg[0] 
       (.C(CLK),
        .CE(E),
        .D(\cnt_10m[0]_i_1_n_0 ),
        .Q(\cnt_10m_reg[3]_0 [0]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \cnt_10m_reg[1] 
       (.C(CLK),
        .CE(E),
        .D(\cnt_10m[1]_i_1_n_0 ),
        .Q(\cnt_10m_reg[3]_0 [1]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \cnt_10m_reg[2] 
       (.C(CLK),
        .CE(E),
        .D(\cnt_10m[2]_i_1_n_0 ),
        .Q(\cnt_10m_reg[3]_0 [2]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \cnt_10m_reg[3] 
       (.C(CLK),
        .CE(E),
        .D(\cnt_10m[3]_i_2_n_0 ),
        .Q(\cnt_10m_reg[3]_0 [3]),
        .R(SR));
  (* SOFT_HLUTNM = "soft_lutpair7" *) 
  LUT1 #(
    .INIT(2'h1)) 
    \cnt_10s[0]_i_1 
       (.I0(led_o_OBUF[4]),
        .O(\cnt_10s[0]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair6" *) 
  LUT4 #(
    .INIT(16'h23CC)) 
    \cnt_10s[1]_i_1 
       (.I0(led_o_OBUF[7]),
        .I1(led_o_OBUF[5]),
        .I2(led_o_OBUF[6]),
        .I3(led_o_OBUF[4]),
        .O(\cnt_10s[1]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair7" *) 
  LUT4 #(
    .INIT(16'h2CF0)) 
    \cnt_10s[2]_i_1 
       (.I0(led_o_OBUF[7]),
        .I1(led_o_OBUF[5]),
        .I2(led_o_OBUF[6]),
        .I3(led_o_OBUF[4]),
        .O(\cnt_10s[2]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h0000000000080000)) 
    \cnt_10s[3]_i_1 
       (.I0(Q[3]),
        .I1(Q[0]),
        .I2(Q[2]),
        .I3(Q[1]),
        .I4(cnt_100m),
        .I5(\cnt_10s[3]_i_3_n_0 ),
        .O(cnt_10s));
  (* SOFT_HLUTNM = "soft_lutpair6" *) 
  LUT4 #(
    .INIT(16'h6AAA)) 
    \cnt_10s[3]_i_2 
       (.I0(led_o_OBUF[7]),
        .I1(led_o_OBUF[5]),
        .I2(led_o_OBUF[6]),
        .I3(led_o_OBUF[4]),
        .O(\cnt_10s[3]_i_2_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair5" *) 
  LUT4 #(
    .INIT(16'hFFF7)) 
    \cnt_10s[3]_i_3 
       (.I0(led_o_OBUF[3]),
        .I1(led_o_OBUF[0]),
        .I2(led_o_OBUF[2]),
        .I3(led_o_OBUF[1]),
        .O(\cnt_10s[3]_i_3_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \cnt_10s_reg[0] 
       (.C(CLK),
        .CE(cnt_10s),
        .D(\cnt_10s[0]_i_1_n_0 ),
        .Q(led_o_OBUF[4]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \cnt_10s_reg[1] 
       (.C(CLK),
        .CE(cnt_10s),
        .D(\cnt_10s[1]_i_1_n_0 ),
        .Q(led_o_OBUF[5]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \cnt_10s_reg[2] 
       (.C(CLK),
        .CE(cnt_10s),
        .D(\cnt_10s[2]_i_1_n_0 ),
        .Q(led_o_OBUF[6]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \cnt_10s_reg[3] 
       (.C(CLK),
        .CE(cnt_10s),
        .D(\cnt_10s[3]_i_2_n_0 ),
        .Q(led_o_OBUF[7]),
        .R(SR));
  LUT1 #(
    .INIT(2'h1)) 
    \cnt_1s[0]_i_1 
       (.I0(led_o_OBUF[0]),
        .O(\cnt_1s[0]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair4" *) 
  LUT4 #(
    .INIT(16'h0BF0)) 
    \cnt_1s[1]_i_1 
       (.I0(led_o_OBUF[2]),
        .I1(led_o_OBUF[3]),
        .I2(led_o_OBUF[1]),
        .I3(led_o_OBUF[0]),
        .O(\cnt_1s[1]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair5" *) 
  LUT3 #(
    .INIT(8'h6A)) 
    \cnt_1s[2]_i_1 
       (.I0(led_o_OBUF[2]),
        .I1(led_o_OBUF[1]),
        .I2(led_o_OBUF[0]),
        .O(\cnt_1s[2]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'h02000000)) 
    \cnt_1s[3]_i_1 
       (.I0(cnt_100m),
        .I1(Q[1]),
        .I2(Q[2]),
        .I3(Q[0]),
        .I4(Q[3]),
        .O(cnt_1s));
  (* SOFT_HLUTNM = "soft_lutpair4" *) 
  LUT4 #(
    .INIT(16'h6F80)) 
    \cnt_1s[3]_i_2 
       (.I0(led_o_OBUF[2]),
        .I1(led_o_OBUF[1]),
        .I2(led_o_OBUF[0]),
        .I3(led_o_OBUF[3]),
        .O(\cnt_1s[3]_i_2_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \cnt_1s_reg[0] 
       (.C(CLK),
        .CE(cnt_1s),
        .D(\cnt_1s[0]_i_1_n_0 ),
        .Q(led_o_OBUF[0]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \cnt_1s_reg[1] 
       (.C(CLK),
        .CE(cnt_1s),
        .D(\cnt_1s[1]_i_1_n_0 ),
        .Q(led_o_OBUF[1]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \cnt_1s_reg[2] 
       (.C(CLK),
        .CE(cnt_1s),
        .D(\cnt_1s[2]_i_1_n_0 ),
        .Q(led_o_OBUF[2]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \cnt_1s_reg[3] 
       (.C(CLK),
        .CE(cnt_1s),
        .D(\cnt_1s[3]_i_2_n_0 ),
        .Q(led_o_OBUF[3]),
        .R(SR));
endmodule

module debouncer
   (s_btn_debounced_reg_0,
    CLK,
    clk_en_100Hz,
    D);
  output s_btn_debounced_reg_0;
  input CLK;
  input clk_en_100Hz;
  input [0:0]D;

  wire CLK;
  wire [0:0]D;
  wire clk_en_100Hz;
  wire [1:0]s_btn_buff;
  wire s_btn_debounced_i_1__0_n_0;
  wire s_btn_debounced_reg_0;

  FDRE #(
    .INIT(1'b0)) 
    \s_btn_buff_reg[0] 
       (.C(CLK),
        .CE(clk_en_100Hz),
        .D(D),
        .Q(s_btn_buff[0]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \s_btn_buff_reg[1] 
       (.C(CLK),
        .CE(clk_en_100Hz),
        .D(s_btn_buff[0]),
        .Q(s_btn_buff[1]),
        .R(1'b0));
  LUT4 #(
    .INIT(16'hE8AA)) 
    s_btn_debounced_i_1__0
       (.I0(s_btn_debounced_reg_0),
        .I1(s_btn_buff[1]),
        .I2(s_btn_buff[0]),
        .I3(clk_en_100Hz),
        .O(s_btn_debounced_i_1__0_n_0));
  FDRE #(
    .INIT(1'b0)) 
    s_btn_debounced_reg
       (.C(CLK),
        .CE(1'b1),
        .D(s_btn_debounced_i_1__0_n_0),
        .Q(s_btn_debounced_reg_0),
        .R(1'b0));
endmodule

(* ORIG_REF_NAME = "debouncer" *) 
module debouncer_1
   (s_btn_debounced_reg_0,
    D,
    s_btn_posedge_0,
    CLK,
    clk_en_100Hz,
    Q,
    \FSM_onehot_pres_state_reg[4] ,
    \FSM_onehot_pres_state_reg[4]_0 ,
    old_state_0,
    \s_btn_buff_reg[0]_0 );
  output s_btn_debounced_reg_0;
  output [0:0]D;
  output s_btn_posedge_0;
  input CLK;
  input clk_en_100Hz;
  input [0:0]Q;
  input \FSM_onehot_pres_state_reg[4] ;
  input \FSM_onehot_pres_state_reg[4]_0 ;
  input old_state_0;
  input [0:0]\s_btn_buff_reg[0]_0 ;

  wire CLK;
  wire [0:0]D;
  wire \FSM_onehot_pres_state_reg[4] ;
  wire \FSM_onehot_pres_state_reg[4]_0 ;
  wire [0:0]Q;
  wire clk_en_100Hz;
  wire old_state_0;
  wire [1:0]s_btn_buff;
  wire [0:0]\s_btn_buff_reg[0]_0 ;
  wire s_btn_debounced_i_1_n_0;
  wire s_btn_debounced_reg_0;
  wire s_btn_posedge_0;

  (* SOFT_HLUTNM = "soft_lutpair10" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \FSM_onehot_pres_state[3]_i_2 
       (.I0(s_btn_debounced_reg_0),
        .I1(\FSM_onehot_pres_state_reg[4] ),
        .O(s_btn_posedge_0));
  (* SOFT_HLUTNM = "soft_lutpair10" *) 
  LUT5 #(
    .INIT(32'h0000A200)) 
    \FSM_onehot_pres_state[4]_i_1 
       (.I0(Q),
        .I1(s_btn_debounced_reg_0),
        .I2(\FSM_onehot_pres_state_reg[4] ),
        .I3(\FSM_onehot_pres_state_reg[4]_0 ),
        .I4(old_state_0),
        .O(D));
  FDRE #(
    .INIT(1'b0)) 
    \s_btn_buff_reg[0] 
       (.C(CLK),
        .CE(clk_en_100Hz),
        .D(\s_btn_buff_reg[0]_0 ),
        .Q(s_btn_buff[0]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \s_btn_buff_reg[1] 
       (.C(CLK),
        .CE(clk_en_100Hz),
        .D(s_btn_buff[0]),
        .Q(s_btn_buff[1]),
        .R(1'b0));
  LUT4 #(
    .INIT(16'hEA8A)) 
    s_btn_debounced_i_1
       (.I0(s_btn_debounced_reg_0),
        .I1(s_btn_buff[0]),
        .I2(clk_en_100Hz),
        .I3(s_btn_buff[1]),
        .O(s_btn_debounced_i_1_n_0));
  FDRE #(
    .INIT(1'b0)) 
    s_btn_debounced_reg
       (.C(CLK),
        .CE(1'b1),
        .D(s_btn_debounced_i_1_n_0),
        .Q(s_btn_debounced_reg_0),
        .R(1'b0));
endmodule

module display_reg
   (Q,
    \second_BCD_L_reg_reg[3]_0 ,
    \hthsec_BCD_H_reg_reg[3]_0 ,
    \hthsec_BCD_L_reg_reg[3]_0 ,
    E,
    led_o_OBUF,
    CLK,
    D,
    \hthsec_BCD_L_reg_reg[3]_1 );
  output [3:0]Q;
  output [3:0]\second_BCD_L_reg_reg[3]_0 ;
  output [3:0]\hthsec_BCD_H_reg_reg[3]_0 ;
  output [3:0]\hthsec_BCD_L_reg_reg[3]_0 ;
  input [0:0]E;
  input [7:0]led_o_OBUF;
  input CLK;
  input [3:0]D;
  input [3:0]\hthsec_BCD_L_reg_reg[3]_1 ;

  wire CLK;
  wire [3:0]D;
  wire [0:0]E;
  wire [3:0]Q;
  wire [3:0]\hthsec_BCD_H_reg_reg[3]_0 ;
  wire [3:0]\hthsec_BCD_L_reg_reg[3]_0 ;
  wire [3:0]\hthsec_BCD_L_reg_reg[3]_1 ;
  wire [7:0]led_o_OBUF;
  wire [3:0]\second_BCD_L_reg_reg[3]_0 ;

  FDRE #(
    .INIT(1'b0)) 
    \hthsec_BCD_H_reg_reg[0] 
       (.C(CLK),
        .CE(E),
        .D(D[0]),
        .Q(\hthsec_BCD_H_reg_reg[3]_0 [0]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \hthsec_BCD_H_reg_reg[1] 
       (.C(CLK),
        .CE(E),
        .D(D[1]),
        .Q(\hthsec_BCD_H_reg_reg[3]_0 [1]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \hthsec_BCD_H_reg_reg[2] 
       (.C(CLK),
        .CE(E),
        .D(D[2]),
        .Q(\hthsec_BCD_H_reg_reg[3]_0 [2]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \hthsec_BCD_H_reg_reg[3] 
       (.C(CLK),
        .CE(E),
        .D(D[3]),
        .Q(\hthsec_BCD_H_reg_reg[3]_0 [3]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \hthsec_BCD_L_reg_reg[0] 
       (.C(CLK),
        .CE(E),
        .D(\hthsec_BCD_L_reg_reg[3]_1 [0]),
        .Q(\hthsec_BCD_L_reg_reg[3]_0 [0]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \hthsec_BCD_L_reg_reg[1] 
       (.C(CLK),
        .CE(E),
        .D(\hthsec_BCD_L_reg_reg[3]_1 [1]),
        .Q(\hthsec_BCD_L_reg_reg[3]_0 [1]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \hthsec_BCD_L_reg_reg[2] 
       (.C(CLK),
        .CE(E),
        .D(\hthsec_BCD_L_reg_reg[3]_1 [2]),
        .Q(\hthsec_BCD_L_reg_reg[3]_0 [2]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \hthsec_BCD_L_reg_reg[3] 
       (.C(CLK),
        .CE(E),
        .D(\hthsec_BCD_L_reg_reg[3]_1 [3]),
        .Q(\hthsec_BCD_L_reg_reg[3]_0 [3]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \second_BCD_H_reg_reg[0] 
       (.C(CLK),
        .CE(E),
        .D(led_o_OBUF[4]),
        .Q(Q[0]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \second_BCD_H_reg_reg[1] 
       (.C(CLK),
        .CE(E),
        .D(led_o_OBUF[5]),
        .Q(Q[1]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \second_BCD_H_reg_reg[2] 
       (.C(CLK),
        .CE(E),
        .D(led_o_OBUF[6]),
        .Q(Q[2]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \second_BCD_H_reg_reg[3] 
       (.C(CLK),
        .CE(E),
        .D(led_o_OBUF[7]),
        .Q(Q[3]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \second_BCD_L_reg_reg[0] 
       (.C(CLK),
        .CE(E),
        .D(led_o_OBUF[0]),
        .Q(\second_BCD_L_reg_reg[3]_0 [0]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \second_BCD_L_reg_reg[1] 
       (.C(CLK),
        .CE(E),
        .D(led_o_OBUF[1]),
        .Q(\second_BCD_L_reg_reg[3]_0 [1]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \second_BCD_L_reg_reg[2] 
       (.C(CLK),
        .CE(E),
        .D(led_o_OBUF[2]),
        .Q(\second_BCD_L_reg_reg[3]_0 [2]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \second_BCD_L_reg_reg[3] 
       (.C(CLK),
        .CE(E),
        .D(led_o_OBUF[3]),
        .Q(\second_BCD_L_reg_reg[3]_0 [3]),
        .R(1'b0));
endmodule

module edge_detector
   (old_state,
    old_state_reg_0,
    CLK);
  output old_state;
  input old_state_reg_0;
  input CLK;

  wire CLK;
  wire old_state;
  wire old_state_reg_0;

  FDRE #(
    .INIT(1'b0)) 
    old_state_reg
       (.C(CLK),
        .CE(1'b1),
        .D(old_state_reg_0),
        .Q(old_state),
        .R(1'b0));
endmodule

(* ORIG_REF_NAME = "edge_detector" *) 
module edge_detector_2
   (old_state,
    old_state_reg_0,
    old_state_reg_1,
    CLK,
    old_state_0,
    \FSM_onehot_pres_state_reg[1] );
  output old_state;
  output old_state_reg_0;
  input old_state_reg_1;
  input CLK;
  input old_state_0;
  input \FSM_onehot_pres_state_reg[1] ;

  wire CLK;
  wire \FSM_onehot_pres_state_reg[1] ;
  wire old_state;
  wire old_state_0;
  wire old_state_reg_0;
  wire old_state_reg_1;

  LUT4 #(
    .INIT(16'hB0BB)) 
    \FSM_onehot_pres_state[1]_i_2 
       (.I0(old_state),
        .I1(old_state_reg_1),
        .I2(old_state_0),
        .I3(\FSM_onehot_pres_state_reg[1] ),
        .O(old_state_reg_0));
  FDRE #(
    .INIT(1'b0)) 
    old_state_reg
       (.C(CLK),
        .CE(1'b1),
        .D(old_state_reg_1),
        .Q(old_state),
        .R(1'b0));
endmodule

module seg_disp_driver
   (clk,
    dig_1_i,
    dig_2_i,
    dig_3_i,
    dig_4_i,
    dp_i,
    dots_i,
    disp_seg_o,
    disp_dig_o);
  input clk;
  input [3:0]dig_1_i;
  input [3:0]dig_2_i;
  input [3:0]dig_3_i;
  input [3:0]dig_4_i;
  input [3:0]dp_i;
  input [2:0]dots_i;
  output [7:0]disp_seg_o;
  output [4:0]disp_dig_o;

  wire [3:0]BIN_value;
  wire \FSM_sequential_pres_st_seg_mux[0]_i_1_n_0 ;
  wire \FSM_sequential_pres_st_seg_mux[1]_i_1_n_0 ;
  wire \FSM_sequential_pres_st_seg_mux[2]_i_1_n_0 ;
  wire clk;
  wire clk_en_seg_reg_n_0;
  wire [0:0]cnt_clk_en_seg;
  wire \cnt_clk_en_seg[15]_i_1_n_0 ;
  wire \cnt_clk_en_seg[15]_i_3_n_0 ;
  wire \cnt_clk_en_seg[15]_i_4_n_0 ;
  wire \cnt_clk_en_seg[15]_i_5_n_0 ;
  wire \cnt_clk_en_seg_reg[12]_i_1_n_0 ;
  wire \cnt_clk_en_seg_reg[12]_i_1_n_1 ;
  wire \cnt_clk_en_seg_reg[12]_i_1_n_2 ;
  wire \cnt_clk_en_seg_reg[12]_i_1_n_3 ;
  wire \cnt_clk_en_seg_reg[15]_i_2_n_2 ;
  wire \cnt_clk_en_seg_reg[15]_i_2_n_3 ;
  wire \cnt_clk_en_seg_reg[4]_i_1_n_0 ;
  wire \cnt_clk_en_seg_reg[4]_i_1_n_1 ;
  wire \cnt_clk_en_seg_reg[4]_i_1_n_2 ;
  wire \cnt_clk_en_seg_reg[4]_i_1_n_3 ;
  wire \cnt_clk_en_seg_reg[8]_i_1_n_0 ;
  wire \cnt_clk_en_seg_reg[8]_i_1_n_1 ;
  wire \cnt_clk_en_seg_reg[8]_i_1_n_2 ;
  wire \cnt_clk_en_seg_reg[8]_i_1_n_3 ;
  wire \cnt_clk_en_seg_reg_n_0_[0] ;
  wire \cnt_clk_en_seg_reg_n_0_[10] ;
  wire \cnt_clk_en_seg_reg_n_0_[11] ;
  wire \cnt_clk_en_seg_reg_n_0_[12] ;
  wire \cnt_clk_en_seg_reg_n_0_[13] ;
  wire \cnt_clk_en_seg_reg_n_0_[14] ;
  wire \cnt_clk_en_seg_reg_n_0_[15] ;
  wire \cnt_clk_en_seg_reg_n_0_[1] ;
  wire \cnt_clk_en_seg_reg_n_0_[2] ;
  wire \cnt_clk_en_seg_reg_n_0_[3] ;
  wire \cnt_clk_en_seg_reg_n_0_[4] ;
  wire \cnt_clk_en_seg_reg_n_0_[5] ;
  wire \cnt_clk_en_seg_reg_n_0_[6] ;
  wire \cnt_clk_en_seg_reg_n_0_[7] ;
  wire \cnt_clk_en_seg_reg_n_0_[8] ;
  wire \cnt_clk_en_seg_reg_n_0_[9] ;
  wire [15:1]data0;
  wire [3:0]dig_1_i;
  wire [3:0]dig_2_i;
  wire [3:0]dig_3_i;
  wire [3:0]dig_4_i;
  wire [4:0]disp_dig_o;
  wire [4:0]disp_dig_s;
  wire [6:3]disp_seg_num;
  wire [7:0]disp_seg_o;
  wire \disp_seg_o[6]_i_6_n_0 ;
  wire \disp_seg_o[6]_i_7_n_0 ;
  wire \disp_seg_o[6]_i_8_n_0 ;
  wire \disp_seg_o[6]_i_9_n_0 ;
  wire \disp_seg_o[7]_i_1_n_0 ;
  wire [2:0]disp_seg_s;
  wire [2:0]dots_i;
  wire [3:0]dp_i;
  (* RTL_KEEP = "yes" *) wire [2:0]pres_st_seg_mux;
  wire [3:2]\NLW_cnt_clk_en_seg_reg[15]_i_2_CO_UNCONNECTED ;
  wire [3:3]\NLW_cnt_clk_en_seg_reg[15]_i_2_O_UNCONNECTED ;

  LUT4 #(
    .INIT(16'h0A3A)) 
    \FSM_sequential_pres_st_seg_mux[0]_i_1 
       (.I0(pres_st_seg_mux[0]),
        .I1(pres_st_seg_mux[0]),
        .I2(clk_en_seg_reg_n_0),
        .I3(pres_st_seg_mux[2]),
        .O(\FSM_sequential_pres_st_seg_mux[0]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'h06FF0600)) 
    \FSM_sequential_pres_st_seg_mux[1]_i_1 
       (.I0(pres_st_seg_mux[1]),
        .I1(pres_st_seg_mux[0]),
        .I2(pres_st_seg_mux[2]),
        .I3(clk_en_seg_reg_n_0),
        .I4(pres_st_seg_mux[1]),
        .O(\FSM_sequential_pres_st_seg_mux[1]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'h00AAC0AA)) 
    \FSM_sequential_pres_st_seg_mux[2]_i_1 
       (.I0(pres_st_seg_mux[2]),
        .I1(pres_st_seg_mux[0]),
        .I2(pres_st_seg_mux[1]),
        .I3(clk_en_seg_reg_n_0),
        .I4(pres_st_seg_mux[2]),
        .O(\FSM_sequential_pres_st_seg_mux[2]_i_1_n_0 ));
  (* FSM_ENCODED_STATES = "st_1:000,st_2:001,st_3:010,st_4:011,st_dp:100" *) 
  (* KEEP = "yes" *) 
  FDRE #(
    .INIT(1'b0)) 
    \FSM_sequential_pres_st_seg_mux_reg[0] 
       (.C(clk),
        .CE(1'b1),
        .D(\FSM_sequential_pres_st_seg_mux[0]_i_1_n_0 ),
        .Q(pres_st_seg_mux[0]),
        .R(1'b0));
  (* FSM_ENCODED_STATES = "st_1:000,st_2:001,st_3:010,st_4:011,st_dp:100" *) 
  (* KEEP = "yes" *) 
  FDRE #(
    .INIT(1'b0)) 
    \FSM_sequential_pres_st_seg_mux_reg[1] 
       (.C(clk),
        .CE(1'b1),
        .D(\FSM_sequential_pres_st_seg_mux[1]_i_1_n_0 ),
        .Q(pres_st_seg_mux[1]),
        .R(1'b0));
  (* FSM_ENCODED_STATES = "st_1:000,st_2:001,st_3:010,st_4:011,st_dp:100" *) 
  (* KEEP = "yes" *) 
  FDRE #(
    .INIT(1'b0)) 
    \FSM_sequential_pres_st_seg_mux_reg[2] 
       (.C(clk),
        .CE(1'b1),
        .D(\FSM_sequential_pres_st_seg_mux[2]_i_1_n_0 ),
        .Q(pres_st_seg_mux[2]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    clk_en_seg_reg
       (.C(clk),
        .CE(1'b1),
        .D(\cnt_clk_en_seg[15]_i_1_n_0 ),
        .Q(clk_en_seg_reg_n_0),
        .R(1'b0));
  LUT1 #(
    .INIT(2'h1)) 
    \cnt_clk_en_seg[0]_i_1 
       (.I0(\cnt_clk_en_seg_reg_n_0_[0] ),
        .O(cnt_clk_en_seg));
  LUT6 #(
    .INIT(64'h0000000040000000)) 
    \cnt_clk_en_seg[15]_i_1 
       (.I0(\cnt_clk_en_seg[15]_i_3_n_0 ),
        .I1(\cnt_clk_en_seg_reg_n_0_[1] ),
        .I2(\cnt_clk_en_seg_reg_n_0_[0] ),
        .I3(\cnt_clk_en_seg_reg_n_0_[3] ),
        .I4(\cnt_clk_en_seg_reg_n_0_[2] ),
        .I5(\cnt_clk_en_seg[15]_i_4_n_0 ),
        .O(\cnt_clk_en_seg[15]_i_1_n_0 ));
  LUT4 #(
    .INIT(16'hFFFE)) 
    \cnt_clk_en_seg[15]_i_3 
       (.I0(\cnt_clk_en_seg_reg_n_0_[5] ),
        .I1(\cnt_clk_en_seg_reg_n_0_[4] ),
        .I2(\cnt_clk_en_seg_reg_n_0_[7] ),
        .I3(\cnt_clk_en_seg_reg_n_0_[6] ),
        .O(\cnt_clk_en_seg[15]_i_3_n_0 ));
  LUT5 #(
    .INIT(32'hFFFFBFFF)) 
    \cnt_clk_en_seg[15]_i_4 
       (.I0(\cnt_clk_en_seg_reg_n_0_[11] ),
        .I1(\cnt_clk_en_seg_reg_n_0_[10] ),
        .I2(\cnt_clk_en_seg_reg_n_0_[8] ),
        .I3(\cnt_clk_en_seg_reg_n_0_[9] ),
        .I4(\cnt_clk_en_seg[15]_i_5_n_0 ),
        .O(\cnt_clk_en_seg[15]_i_4_n_0 ));
  LUT4 #(
    .INIT(16'hFFFD)) 
    \cnt_clk_en_seg[15]_i_5 
       (.I0(\cnt_clk_en_seg_reg_n_0_[13] ),
        .I1(\cnt_clk_en_seg_reg_n_0_[12] ),
        .I2(\cnt_clk_en_seg_reg_n_0_[15] ),
        .I3(\cnt_clk_en_seg_reg_n_0_[14] ),
        .O(\cnt_clk_en_seg[15]_i_5_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \cnt_clk_en_seg_reg[0] 
       (.C(clk),
        .CE(1'b1),
        .D(cnt_clk_en_seg),
        .Q(\cnt_clk_en_seg_reg_n_0_[0] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \cnt_clk_en_seg_reg[10] 
       (.C(clk),
        .CE(1'b1),
        .D(data0[10]),
        .Q(\cnt_clk_en_seg_reg_n_0_[10] ),
        .R(\cnt_clk_en_seg[15]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \cnt_clk_en_seg_reg[11] 
       (.C(clk),
        .CE(1'b1),
        .D(data0[11]),
        .Q(\cnt_clk_en_seg_reg_n_0_[11] ),
        .R(\cnt_clk_en_seg[15]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \cnt_clk_en_seg_reg[12] 
       (.C(clk),
        .CE(1'b1),
        .D(data0[12]),
        .Q(\cnt_clk_en_seg_reg_n_0_[12] ),
        .R(\cnt_clk_en_seg[15]_i_1_n_0 ));
  CARRY4 \cnt_clk_en_seg_reg[12]_i_1 
       (.CI(\cnt_clk_en_seg_reg[8]_i_1_n_0 ),
        .CO({\cnt_clk_en_seg_reg[12]_i_1_n_0 ,\cnt_clk_en_seg_reg[12]_i_1_n_1 ,\cnt_clk_en_seg_reg[12]_i_1_n_2 ,\cnt_clk_en_seg_reg[12]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(data0[12:9]),
        .S({\cnt_clk_en_seg_reg_n_0_[12] ,\cnt_clk_en_seg_reg_n_0_[11] ,\cnt_clk_en_seg_reg_n_0_[10] ,\cnt_clk_en_seg_reg_n_0_[9] }));
  FDRE #(
    .INIT(1'b0)) 
    \cnt_clk_en_seg_reg[13] 
       (.C(clk),
        .CE(1'b1),
        .D(data0[13]),
        .Q(\cnt_clk_en_seg_reg_n_0_[13] ),
        .R(\cnt_clk_en_seg[15]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \cnt_clk_en_seg_reg[14] 
       (.C(clk),
        .CE(1'b1),
        .D(data0[14]),
        .Q(\cnt_clk_en_seg_reg_n_0_[14] ),
        .R(\cnt_clk_en_seg[15]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \cnt_clk_en_seg_reg[15] 
       (.C(clk),
        .CE(1'b1),
        .D(data0[15]),
        .Q(\cnt_clk_en_seg_reg_n_0_[15] ),
        .R(\cnt_clk_en_seg[15]_i_1_n_0 ));
  CARRY4 \cnt_clk_en_seg_reg[15]_i_2 
       (.CI(\cnt_clk_en_seg_reg[12]_i_1_n_0 ),
        .CO({\NLW_cnt_clk_en_seg_reg[15]_i_2_CO_UNCONNECTED [3:2],\cnt_clk_en_seg_reg[15]_i_2_n_2 ,\cnt_clk_en_seg_reg[15]_i_2_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\NLW_cnt_clk_en_seg_reg[15]_i_2_O_UNCONNECTED [3],data0[15:13]}),
        .S({1'b0,\cnt_clk_en_seg_reg_n_0_[15] ,\cnt_clk_en_seg_reg_n_0_[14] ,\cnt_clk_en_seg_reg_n_0_[13] }));
  FDRE #(
    .INIT(1'b0)) 
    \cnt_clk_en_seg_reg[1] 
       (.C(clk),
        .CE(1'b1),
        .D(data0[1]),
        .Q(\cnt_clk_en_seg_reg_n_0_[1] ),
        .R(\cnt_clk_en_seg[15]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \cnt_clk_en_seg_reg[2] 
       (.C(clk),
        .CE(1'b1),
        .D(data0[2]),
        .Q(\cnt_clk_en_seg_reg_n_0_[2] ),
        .R(\cnt_clk_en_seg[15]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \cnt_clk_en_seg_reg[3] 
       (.C(clk),
        .CE(1'b1),
        .D(data0[3]),
        .Q(\cnt_clk_en_seg_reg_n_0_[3] ),
        .R(\cnt_clk_en_seg[15]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \cnt_clk_en_seg_reg[4] 
       (.C(clk),
        .CE(1'b1),
        .D(data0[4]),
        .Q(\cnt_clk_en_seg_reg_n_0_[4] ),
        .R(\cnt_clk_en_seg[15]_i_1_n_0 ));
  CARRY4 \cnt_clk_en_seg_reg[4]_i_1 
       (.CI(1'b0),
        .CO({\cnt_clk_en_seg_reg[4]_i_1_n_0 ,\cnt_clk_en_seg_reg[4]_i_1_n_1 ,\cnt_clk_en_seg_reg[4]_i_1_n_2 ,\cnt_clk_en_seg_reg[4]_i_1_n_3 }),
        .CYINIT(\cnt_clk_en_seg_reg_n_0_[0] ),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(data0[4:1]),
        .S({\cnt_clk_en_seg_reg_n_0_[4] ,\cnt_clk_en_seg_reg_n_0_[3] ,\cnt_clk_en_seg_reg_n_0_[2] ,\cnt_clk_en_seg_reg_n_0_[1] }));
  FDRE #(
    .INIT(1'b0)) 
    \cnt_clk_en_seg_reg[5] 
       (.C(clk),
        .CE(1'b1),
        .D(data0[5]),
        .Q(\cnt_clk_en_seg_reg_n_0_[5] ),
        .R(\cnt_clk_en_seg[15]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \cnt_clk_en_seg_reg[6] 
       (.C(clk),
        .CE(1'b1),
        .D(data0[6]),
        .Q(\cnt_clk_en_seg_reg_n_0_[6] ),
        .R(\cnt_clk_en_seg[15]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \cnt_clk_en_seg_reg[7] 
       (.C(clk),
        .CE(1'b1),
        .D(data0[7]),
        .Q(\cnt_clk_en_seg_reg_n_0_[7] ),
        .R(\cnt_clk_en_seg[15]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \cnt_clk_en_seg_reg[8] 
       (.C(clk),
        .CE(1'b1),
        .D(data0[8]),
        .Q(\cnt_clk_en_seg_reg_n_0_[8] ),
        .R(\cnt_clk_en_seg[15]_i_1_n_0 ));
  CARRY4 \cnt_clk_en_seg_reg[8]_i_1 
       (.CI(\cnt_clk_en_seg_reg[4]_i_1_n_0 ),
        .CO({\cnt_clk_en_seg_reg[8]_i_1_n_0 ,\cnt_clk_en_seg_reg[8]_i_1_n_1 ,\cnt_clk_en_seg_reg[8]_i_1_n_2 ,\cnt_clk_en_seg_reg[8]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(data0[8:5]),
        .S({\cnt_clk_en_seg_reg_n_0_[8] ,\cnt_clk_en_seg_reg_n_0_[7] ,\cnt_clk_en_seg_reg_n_0_[6] ,\cnt_clk_en_seg_reg_n_0_[5] }));
  FDRE #(
    .INIT(1'b0)) 
    \cnt_clk_en_seg_reg[9] 
       (.C(clk),
        .CE(1'b1),
        .D(data0[9]),
        .Q(\cnt_clk_en_seg_reg_n_0_[9] ),
        .R(\cnt_clk_en_seg[15]_i_1_n_0 ));
  LUT1 #(
    .INIT(2'h1)) 
    \disp_dig_o[0]_i_1 
       (.I0(pres_st_seg_mux[2]),
        .O(disp_dig_s[0]));
  LUT3 #(
    .INIT(8'h1E)) 
    \disp_dig_o[1]_i_1 
       (.I0(pres_st_seg_mux[0]),
        .I1(pres_st_seg_mux[1]),
        .I2(pres_st_seg_mux[2]),
        .O(disp_dig_s[1]));
  LUT3 #(
    .INIT(8'h1D)) 
    \disp_dig_o[2]_i_1 
       (.I0(pres_st_seg_mux[0]),
        .I1(pres_st_seg_mux[1]),
        .I2(pres_st_seg_mux[2]),
        .O(disp_dig_s[2]));
  LUT3 #(
    .INIT(8'h1D)) 
    \disp_dig_o[3]_i_1 
       (.I0(pres_st_seg_mux[1]),
        .I1(pres_st_seg_mux[0]),
        .I2(pres_st_seg_mux[2]),
        .O(disp_dig_s[3]));
  LUT3 #(
    .INIT(8'h17)) 
    \disp_dig_o[4]_i_1 
       (.I0(pres_st_seg_mux[1]),
        .I1(pres_st_seg_mux[2]),
        .I2(pres_st_seg_mux[0]),
        .O(disp_dig_s[4]));
  FDRE #(
    .INIT(1'b0)) 
    \disp_dig_o_reg[0] 
       (.C(clk),
        .CE(1'b1),
        .D(disp_dig_s[0]),
        .Q(disp_dig_o[0]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \disp_dig_o_reg[1] 
       (.C(clk),
        .CE(1'b1),
        .D(disp_dig_s[1]),
        .Q(disp_dig_o[1]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \disp_dig_o_reg[2] 
       (.C(clk),
        .CE(1'b1),
        .D(disp_dig_s[2]),
        .Q(disp_dig_o[2]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \disp_dig_o_reg[3] 
       (.C(clk),
        .CE(1'b1),
        .D(disp_dig_s[3]),
        .Q(disp_dig_o[3]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \disp_dig_o_reg[4] 
       (.C(clk),
        .CE(1'b1),
        .D(disp_dig_s[4]),
        .Q(disp_dig_o[4]),
        .R(1'b0));
  LUT6 #(
    .INIT(64'h4474444474474744)) 
    \disp_seg_o[0]_i_1 
       (.I0(dots_i[0]),
        .I1(pres_st_seg_mux[2]),
        .I2(BIN_value[3]),
        .I3(BIN_value[2]),
        .I4(BIN_value[0]),
        .I5(BIN_value[1]),
        .O(disp_seg_s[0]));
  LUT6 #(
    .INIT(64'h7474474477447444)) 
    \disp_seg_o[1]_i_1 
       (.I0(dots_i[1]),
        .I1(pres_st_seg_mux[2]),
        .I2(BIN_value[3]),
        .I3(BIN_value[2]),
        .I4(BIN_value[1]),
        .I5(BIN_value[0]),
        .O(disp_seg_s[1]));
  LUT6 #(
    .INIT(64'h7474447444474444)) 
    \disp_seg_o[2]_i_1 
       (.I0(dots_i[2]),
        .I1(pres_st_seg_mux[2]),
        .I2(BIN_value[3]),
        .I3(BIN_value[0]),
        .I4(BIN_value[1]),
        .I5(BIN_value[2]),
        .O(disp_seg_s[2]));
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT4 #(
    .INIT(16'hC214)) 
    \disp_seg_o[3]_i_1 
       (.I0(BIN_value[3]),
        .I1(BIN_value[2]),
        .I2(BIN_value[0]),
        .I3(BIN_value[1]),
        .O(disp_seg_num[3]));
  (* SOFT_HLUTNM = "soft_lutpair1" *) 
  LUT4 #(
    .INIT(16'h5710)) 
    \disp_seg_o[4]_i_1 
       (.I0(BIN_value[3]),
        .I1(BIN_value[1]),
        .I2(BIN_value[2]),
        .I3(BIN_value[0]),
        .O(disp_seg_num[4]));
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT4 #(
    .INIT(16'h5190)) 
    \disp_seg_o[5]_i_1 
       (.I0(BIN_value[3]),
        .I1(BIN_value[2]),
        .I2(BIN_value[0]),
        .I3(BIN_value[1]),
        .O(disp_seg_num[5]));
  (* SOFT_HLUTNM = "soft_lutpair1" *) 
  LUT4 #(
    .INIT(16'h4025)) 
    \disp_seg_o[6]_i_1 
       (.I0(BIN_value[3]),
        .I1(BIN_value[0]),
        .I2(BIN_value[2]),
        .I3(BIN_value[1]),
        .O(disp_seg_num[6]));
  LUT3 #(
    .INIT(8'hB8)) 
    \disp_seg_o[6]_i_2 
       (.I0(dig_4_i[3]),
        .I1(pres_st_seg_mux[2]),
        .I2(\disp_seg_o[6]_i_6_n_0 ),
        .O(BIN_value[3]));
  LUT3 #(
    .INIT(8'hB8)) 
    \disp_seg_o[6]_i_3 
       (.I0(dig_4_i[0]),
        .I1(pres_st_seg_mux[2]),
        .I2(\disp_seg_o[6]_i_7_n_0 ),
        .O(BIN_value[0]));
  LUT3 #(
    .INIT(8'hB8)) 
    \disp_seg_o[6]_i_4 
       (.I0(dig_4_i[2]),
        .I1(pres_st_seg_mux[2]),
        .I2(\disp_seg_o[6]_i_8_n_0 ),
        .O(BIN_value[2]));
  LUT3 #(
    .INIT(8'hB8)) 
    \disp_seg_o[6]_i_5 
       (.I0(dig_4_i[1]),
        .I1(pres_st_seg_mux[2]),
        .I2(\disp_seg_o[6]_i_9_n_0 ),
        .O(BIN_value[1]));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \disp_seg_o[6]_i_6 
       (.I0(dig_4_i[3]),
        .I1(dig_3_i[3]),
        .I2(pres_st_seg_mux[1]),
        .I3(dig_2_i[3]),
        .I4(pres_st_seg_mux[0]),
        .I5(dig_1_i[3]),
        .O(\disp_seg_o[6]_i_6_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \disp_seg_o[6]_i_7 
       (.I0(dig_4_i[0]),
        .I1(dig_3_i[0]),
        .I2(pres_st_seg_mux[1]),
        .I3(dig_2_i[0]),
        .I4(pres_st_seg_mux[0]),
        .I5(dig_1_i[0]),
        .O(\disp_seg_o[6]_i_7_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \disp_seg_o[6]_i_8 
       (.I0(dig_4_i[2]),
        .I1(dig_3_i[2]),
        .I2(pres_st_seg_mux[1]),
        .I3(dig_2_i[2]),
        .I4(pres_st_seg_mux[0]),
        .I5(dig_1_i[2]),
        .O(\disp_seg_o[6]_i_8_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \disp_seg_o[6]_i_9 
       (.I0(dig_4_i[1]),
        .I1(dig_3_i[1]),
        .I2(pres_st_seg_mux[1]),
        .I3(dig_2_i[1]),
        .I4(pres_st_seg_mux[0]),
        .I5(dig_1_i[1]),
        .O(\disp_seg_o[6]_i_9_n_0 ));
  LUT6 #(
    .INIT(64'h505F3030505F3F3F)) 
    \disp_seg_o[7]_i_1 
       (.I0(dp_i[3]),
        .I1(dp_i[2]),
        .I2(pres_st_seg_mux[1]),
        .I3(dp_i[1]),
        .I4(pres_st_seg_mux[0]),
        .I5(dp_i[0]),
        .O(\disp_seg_o[7]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \disp_seg_o_reg[0] 
       (.C(clk),
        .CE(1'b1),
        .D(disp_seg_s[0]),
        .Q(disp_seg_o[0]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \disp_seg_o_reg[1] 
       (.C(clk),
        .CE(1'b1),
        .D(disp_seg_s[1]),
        .Q(disp_seg_o[1]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \disp_seg_o_reg[2] 
       (.C(clk),
        .CE(1'b1),
        .D(disp_seg_s[2]),
        .Q(disp_seg_o[2]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \disp_seg_o_reg[3] 
       (.C(clk),
        .CE(1'b1),
        .D(disp_seg_num[3]),
        .Q(disp_seg_o[3]),
        .R(pres_st_seg_mux[2]));
  FDRE #(
    .INIT(1'b0)) 
    \disp_seg_o_reg[4] 
       (.C(clk),
        .CE(1'b1),
        .D(disp_seg_num[4]),
        .Q(disp_seg_o[4]),
        .R(pres_st_seg_mux[2]));
  FDRE #(
    .INIT(1'b0)) 
    \disp_seg_o_reg[5] 
       (.C(clk),
        .CE(1'b1),
        .D(disp_seg_num[5]),
        .Q(disp_seg_o[5]),
        .R(pres_st_seg_mux[2]));
  FDRE #(
    .INIT(1'b0)) 
    \disp_seg_o_reg[6] 
       (.C(clk),
        .CE(1'b1),
        .D(disp_seg_num[6]),
        .Q(disp_seg_o[6]),
        .R(pres_st_seg_mux[2]));
  FDRE #(
    .INIT(1'b0)) 
    \disp_seg_o_reg[7] 
       (.C(clk),
        .CE(1'b1),
        .D(\disp_seg_o[7]_i_1_n_0 ),
        .Q(disp_seg_o[7]),
        .R(pres_st_seg_mux[2]));
endmodule

module stopwatch_FSM
   (cnt_enable,
    SR,
    E,
    Q,
    clk_IBUF_BUFG,
    s_btn_posedge_0,
    \FSM_onehot_pres_state_reg[1]_0 ,
    old_state,
    \FSM_onehot_pres_state_reg[2]_0 ,
    old_state_0,
    \FSM_onehot_pres_state_reg[2]_1 ,
    D);
  output cnt_enable;
  output [0:0]SR;
  output [0:0]E;
  output [0:0]Q;
  input clk_IBUF_BUFG;
  input s_btn_posedge_0;
  input \FSM_onehot_pres_state_reg[1]_0 ;
  input old_state;
  input \FSM_onehot_pres_state_reg[2]_0 ;
  input old_state_0;
  input \FSM_onehot_pres_state_reg[2]_1 ;
  input [0:0]D;

  wire [0:0]D;
  wire [0:0]E;
  wire \FSM_onehot_pres_state[0]_i_1_n_0 ;
  wire \FSM_onehot_pres_state[1]_i_1_n_0 ;
  wire \FSM_onehot_pres_state[2]_i_1_n_0 ;
  wire \FSM_onehot_pres_state[3]_i_1_n_0 ;
  wire \FSM_onehot_pres_state_reg[1]_0 ;
  wire \FSM_onehot_pres_state_reg[2]_0 ;
  wire \FSM_onehot_pres_state_reg[2]_1 ;
  wire \FSM_onehot_pres_state_reg_n_0_[1] ;
  wire \FSM_onehot_pres_state_reg_n_0_[2] ;
  wire \FSM_onehot_pres_state_reg_n_0_[4] ;
  wire [0:0]Q;
  wire [0:0]SR;
  wire clk_IBUF_BUFG;
  wire cnt_enable;
  wire old_state;
  wire old_state_0;
  wire s_btn_posedge_0;
  wire s_cnt_enable;
  wire s_cnt_reset;
  wire s_disp_enable;

  LUT6 #(
    .INIT(64'hBA00BABAAA00AAAA)) 
    \FSM_onehot_pres_state[0]_i_1 
       (.I0(s_cnt_reset),
        .I1(old_state_0),
        .I2(\FSM_onehot_pres_state_reg[2]_1 ),
        .I3(old_state),
        .I4(\FSM_onehot_pres_state_reg[2]_0 ),
        .I5(\FSM_onehot_pres_state_reg_n_0_[2] ),
        .O(\FSM_onehot_pres_state[0]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFE00FE00FE00)) 
    \FSM_onehot_pres_state[1]_i_1 
       (.I0(Q),
        .I1(\FSM_onehot_pres_state_reg_n_0_[2] ),
        .I2(s_cnt_reset),
        .I3(s_btn_posedge_0),
        .I4(\FSM_onehot_pres_state_reg_n_0_[1] ),
        .I5(\FSM_onehot_pres_state_reg[1]_0 ),
        .O(\FSM_onehot_pres_state[1]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hEF20EFEF20202020)) 
    \FSM_onehot_pres_state[2]_i_1 
       (.I0(\FSM_onehot_pres_state_reg_n_0_[1] ),
        .I1(old_state),
        .I2(\FSM_onehot_pres_state_reg[2]_0 ),
        .I3(old_state_0),
        .I4(\FSM_onehot_pres_state_reg[2]_1 ),
        .I5(\FSM_onehot_pres_state_reg_n_0_[2] ),
        .O(\FSM_onehot_pres_state[2]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hAFAFAEAFAAAAAEAA)) 
    \FSM_onehot_pres_state[3]_i_1 
       (.I0(\FSM_onehot_pres_state_reg_n_0_[4] ),
        .I1(\FSM_onehot_pres_state_reg_n_0_[1] ),
        .I2(s_btn_posedge_0),
        .I3(\FSM_onehot_pres_state_reg[2]_1 ),
        .I4(old_state_0),
        .I5(Q),
        .O(\FSM_onehot_pres_state[3]_i_1_n_0 ));
  (* FSM_ENCODED_STATES = "st_lap:01000,st_refresh:10000,st_run:00010,st_stop:00100,st_idle:00001" *) 
  FDRE #(
    .INIT(1'b1)) 
    \FSM_onehot_pres_state_reg[0] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(\FSM_onehot_pres_state[0]_i_1_n_0 ),
        .Q(s_cnt_reset),
        .R(1'b0));
  (* FSM_ENCODED_STATES = "st_lap:01000,st_refresh:10000,st_run:00010,st_stop:00100,st_idle:00001" *) 
  FDRE #(
    .INIT(1'b0)) 
    \FSM_onehot_pres_state_reg[1] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(\FSM_onehot_pres_state[1]_i_1_n_0 ),
        .Q(\FSM_onehot_pres_state_reg_n_0_[1] ),
        .R(1'b0));
  (* FSM_ENCODED_STATES = "st_lap:01000,st_refresh:10000,st_run:00010,st_stop:00100,st_idle:00001" *) 
  FDRE #(
    .INIT(1'b0)) 
    \FSM_onehot_pres_state_reg[2] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(\FSM_onehot_pres_state[2]_i_1_n_0 ),
        .Q(\FSM_onehot_pres_state_reg_n_0_[2] ),
        .R(1'b0));
  (* FSM_ENCODED_STATES = "st_lap:01000,st_refresh:10000,st_run:00010,st_stop:00100,st_idle:00001" *) 
  FDRE #(
    .INIT(1'b0)) 
    \FSM_onehot_pres_state_reg[3] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(\FSM_onehot_pres_state[3]_i_1_n_0 ),
        .Q(Q),
        .R(1'b0));
  (* FSM_ENCODED_STATES = "st_lap:01000,st_refresh:10000,st_run:00010,st_stop:00100,st_idle:00001" *) 
  FDRE #(
    .INIT(1'b0)) 
    \FSM_onehot_pres_state_reg[4] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(D),
        .Q(\FSM_onehot_pres_state_reg_n_0_[4] ),
        .R(1'b0));
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT3 #(
    .INIT(8'hFE)) 
    cnt_enable_i_1
       (.I0(Q),
        .I1(\FSM_onehot_pres_state_reg_n_0_[1] ),
        .I2(\FSM_onehot_pres_state_reg_n_0_[4] ),
        .O(s_cnt_enable));
  FDRE #(
    .INIT(1'b0)) 
    cnt_enable_reg
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(s_cnt_enable),
        .Q(cnt_enable),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    cnt_reset_reg
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(s_cnt_reset),
        .Q(SR),
        .R(1'b0));
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT4 #(
    .INIT(16'hFFFE)) 
    disp_enable_i_1
       (.I0(\FSM_onehot_pres_state_reg_n_0_[4] ),
        .I1(\FSM_onehot_pres_state_reg_n_0_[2] ),
        .I2(s_cnt_reset),
        .I3(\FSM_onehot_pres_state_reg_n_0_[1] ),
        .O(s_disp_enable));
  FDRE #(
    .INIT(1'b0)) 
    disp_enable_reg
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(s_disp_enable),
        .Q(E),
        .R(1'b0));
endmodule

module sync_reg
   (D,
    in0,
    CLK);
  output [0:0]D;
  input in0;
  input CLK;

  wire CLK;
  wire [0:0]D;
  (* async_reg = "true" *) (* shreg_extract = "no" *) wire Q1;
  (* async_reg = "true" *) (* shreg_extract = "no" *) wire Q2;
  wire in0;

  (* ASYNC_REG *) 
  (* KEEP = "yes" *) 
  (* SHREG_EXTRACT = "no" *) 
  FDRE #(
    .INIT(1'b0)) 
    Q1_reg
       (.C(CLK),
        .CE(1'b1),
        .D(in0),
        .Q(Q1),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "yes" *) 
  (* SHREG_EXTRACT = "no" *) 
  FDRE #(
    .INIT(1'b0)) 
    Q2_reg
       (.C(CLK),
        .CE(1'b1),
        .D(Q1),
        .Q(Q2),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    q_o_reg
       (.C(CLK),
        .CE(1'b1),
        .D(Q2),
        .Q(D),
        .R(1'b0));
endmodule

(* ORIG_REF_NAME = "sync_reg" *) 
module sync_reg_3
   (q_o_reg_0,
    in0,
    CLK);
  output [0:0]q_o_reg_0;
  input in0;
  input CLK;

  wire CLK;
  (* async_reg = "true" *) (* shreg_extract = "no" *) wire Q1;
  (* async_reg = "true" *) (* shreg_extract = "no" *) wire Q2;
  wire in0;
  wire [0:0]q_o_reg_0;

  (* ASYNC_REG *) 
  (* KEEP = "yes" *) 
  (* SHREG_EXTRACT = "no" *) 
  FDRE #(
    .INIT(1'b0)) 
    Q1_reg
       (.C(CLK),
        .CE(1'b1),
        .D(in0),
        .Q(Q1),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "yes" *) 
  (* SHREG_EXTRACT = "no" *) 
  FDRE #(
    .INIT(1'b0)) 
    Q2_reg
       (.C(CLK),
        .CE(1'b1),
        .D(Q1),
        .Q(Q2),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    q_o_reg
       (.C(CLK),
        .CE(1'b1),
        .D(Q2),
        .Q(q_o_reg_0),
        .R(1'b0));
endmodule
`ifndef GLBL
`define GLBL
`timescale  1 ps / 1 ps

module glbl ();

    parameter ROC_WIDTH = 100000;
    parameter TOC_WIDTH = 0;

//--------   STARTUP Globals --------------
    wire GSR;
    wire GTS;
    wire GWE;
    wire PRLD;
    tri1 p_up_tmp;
    tri (weak1, strong0) PLL_LOCKG = p_up_tmp;

    wire PROGB_GLBL;
    wire CCLKO_GLBL;
    wire FCSBO_GLBL;
    wire [3:0] DO_GLBL;
    wire [3:0] DI_GLBL;
   
    reg GSR_int;
    reg GTS_int;
    reg PRLD_int;

//--------   JTAG Globals --------------
    wire JTAG_TDO_GLBL;
    wire JTAG_TCK_GLBL;
    wire JTAG_TDI_GLBL;
    wire JTAG_TMS_GLBL;
    wire JTAG_TRST_GLBL;

    reg JTAG_CAPTURE_GLBL;
    reg JTAG_RESET_GLBL;
    reg JTAG_SHIFT_GLBL;
    reg JTAG_UPDATE_GLBL;
    reg JTAG_RUNTEST_GLBL;

    reg JTAG_SEL1_GLBL = 0;
    reg JTAG_SEL2_GLBL = 0 ;
    reg JTAG_SEL3_GLBL = 0;
    reg JTAG_SEL4_GLBL = 0;

    reg JTAG_USER_TDO1_GLBL = 1'bz;
    reg JTAG_USER_TDO2_GLBL = 1'bz;
    reg JTAG_USER_TDO3_GLBL = 1'bz;
    reg JTAG_USER_TDO4_GLBL = 1'bz;

    assign (strong1, weak0) GSR = GSR_int;
    assign (strong1, weak0) GTS = GTS_int;
    assign (weak1, weak0) PRLD = PRLD_int;

    initial begin
	GSR_int = 1'b1;
	PRLD_int = 1'b1;
	#(ROC_WIDTH)
	GSR_int = 1'b0;
	PRLD_int = 1'b0;
    end

    initial begin
	GTS_int = 1'b1;
	#(TOC_WIDTH)
	GTS_int = 1'b0;
    end

endmodule
`endif
