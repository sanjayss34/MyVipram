////////////////////////////////////////////////////////////////////////////////
//   ____  ____ 
//  /   /\/   / 
// /___/  \  /    Vendor: Xilinx 
// \   \   \/     Version : 2.5
//  \   \         Application : 7 Series FPGAs Transceivers Wizard 
//  /   /         Filename : gtwizard_v2_5_gbe_gtx_adapt_starter.v
// /___/   /\     
// \   \  /  \ 
//  \___\/\___\ 
//
//
// Module gtwizard_v2_5_gbe_gtx_adapt_starter
// Generated by Xilinx 7 Series FPGAs Transceivers Wizard
// 
// 
// (c) Copyright 2010-2012 Xilinx, Inc. All rights reserved.
// 
// This file contains confidential and proprietary information
// of Xilinx, Inc. and is protected under U.S. and
// international copyright and other intellectual property
// laws.
// 
// DISCLAIMER
// This disclaimer is not a license and does not grant any
// rights to the materials distributed herewith. Except as
// otherwise provided in a valid license issued to you by
// Xilinx, and to the maximum extent permitted by applicable
// law: (1) THESE MATERIALS ARE MADE AVAILABLE "AS IS" AND
// WITH ALL FAULTS, AND XILINX HEREBY DISCLAIMS ALL WARRANTIES
// AND CONDITIONS, EXPRESS, IMPLIED, OR STATUTORY, INCLUDING
// BUT NOT LIMITED TO WARRANTIES OF MERCHANTABILITY, NON-
// INFRINGEMENT, OR FITNESS FOR ANY PARTICULAR PURPOSE; and
// (2) Xilinx shall not be liable (whether in contract or tort,
// including negligence, or under any other theory of
// liability) for any loss or damage of any kind or nature
// related to, arising under or in connection with these
// materials, including for any direct, or any indirect,
// special, incidental, or consequential loss or damage
// (including loss of data, profits, goodwill, or any type of
// loss or damage suffered as a result of any action brought
// by a third party) even if such damage or loss was
// reasonably foreseeable or Xilinx had been advised of the
// possibility of the same.
// 
// CRITICAL APPLICATIONS
// Xilinx products are not designed or intended to be fail-
// safe, or for use in any application requiring fail-safe
// performance, such as life-support or safety devices or
// systems, Class III medical devices, nuclear facilities,
// applications related to the deployment of airbags, or any
// other applications that could lead to death, personal
// injury, or severe property or environmental damage
// (individually and collectively, "Critical
// Applications"). Customer assumes the sole risk and
// liability of any use of Xilinx products in Critical
// Applications, subject only to applicable laws and
// regulations governing limitations on product liability.
// 
// THIS COPYRIGHT NOTICE AND DISCLAIMER MUST BE RETAINED AS
// PART OF THIS FILE AT ALL TIMES. 


`timescale 1ns / 1ps
`define DLY #1
module gtwizard_v2_5_gbe_gtx_adapt_starter #(
	parameter WAIT_CYC = 4'd10
)
(
	input  RST,
	input  CLK,
	input  [15:0] DO,
	input  DRDY,
	output [8:0] DADDR,
	output DEN,
	output DWE,
	output reg READY,
	output [3:0] curr_state_debug,
	output [2:0] counter_debug,
	output rst_int_debug
);

parameter DFE_RSTB_ADDR = 9'd257; //GTX
parameter DFE_RSTB_BIT = 14; //GTX

parameter IDLE       = 4'b0001;
parameter NOT_IN_RST = 4'b0011;
parameter READ1      = 4'b0010;
parameter WAIT1      = 4'b0110;
parameter DONE       = 4'b0100;

reg [1:0] rst_s;
reg [3:0] curr_state;
reg [3:0] next_state;
reg dfe_rst_b_s;
reg drdy_s;
reg [3:0] counter;
wire rst_int_b;

wire rst_int;
wire done_state;
wire enable, enable_b;

reg den_pre;
reg [8:0] daddr_pre;
reg ready_pre;

assign rst_int_debug = rst_int;
assign curr_state_debug = curr_state;
assign counter_debug = counter[2:0];

assign enable = ~enable_b;
assign DEN = den_pre;
assign DADDR = daddr_pre;
assign done_state = (curr_state == DONE);

assign DWE = 1'b0;
assign rst_int = ~rst_int_b;


always @ (posedge CLK)
begin
	if(rst_int)
	begin
		ready_pre <= `DLY 1'b0;
		READY <= `DLY  1'b0; 
	end
	else
	begin
		ready_pre <= `DLY done_state;
		READY <= `DLY  ready_pre; 
	end
end


//Logic runs when RST is 0. It runs until hits DONE state and stays there.
//When user resets RXRESET, etc, state machine starts again from beginning.
//Thus there's an issue for first RST. We don't want logic to start until RST goes high then low.
//To circumvent, add another SR latch to detect first RST pulse. This latch's output remains HIGH after first RST pulse.
//Before first RST, the latch output is low and gates the set of the 2nd latch


//SR latch to guarantee width of reset. CLR dominant.
//rst asserted immediately by RST.  Deasserted 2 CLK cycles later if RST width is less than DCLK cycle.  Deasserted when RST goes low when RST width greater than DCLK cycle.

//Logic not enabled until first pulse of RST detected
FDCE #(
	.INIT(1'b1) // Initial value of register (1'b0 or 1'b1)
) FIRST_PULSE_SR_FF (
	.Q(enable_b),
	.C(CLK),
	.CE(1'b0),
	.CLR(RST),
	.D(1'b1)
);

FDCE #(
	.INIT(1'b0) // Initial value of register (1'b0 or 1'b1)
) RST_B_SR_FF (
	.Q(rst_int_b),
	.C(CLK),
	.CE(rst_s[1] & enable),
	.CLR(RST),
	.D(1'b1)
);

always @ (posedge CLK)
begin
	rst_s[0] <= `DLY  ~rst_int_b;
	rst_s[1] <= `DLY  rst_s[0];
	
	drdy_s <= `DLY  DRDY;
	
	dfe_rst_b_s <= `DLY  DO[DFE_RSTB_BIT];

	curr_state <= `DLY  next_state;
end

always @ (posedge CLK)
begin
	case(curr_state)
		IDLE: begin
			counter <= `DLY  4'd0;
		end
		NOT_IN_RST: begin
			counter <= `DLY  counter + 1;
		end
		default: begin
			counter <= `DLY  counter;
		end
	endcase
end

//Counter
always @ (curr_state)
begin
	case(curr_state)
		IDLE: begin
			den_pre <= `DLY  1'b0;
      daddr_pre = 9'd0;
		end
		READ1: begin
			den_pre <= `DLY  1'b1;
      daddr_pre = DFE_RSTB_ADDR;
		end
		WAIT1: begin
			den_pre <= `DLY  1'b0;
      daddr_pre = DFE_RSTB_ADDR;
		end
		NOT_IN_RST: begin
			den_pre <= `DLY  1'b0;
      daddr_pre = DFE_RSTB_ADDR;
		end
		DONE: begin
			den_pre <= `DLY  1'b0;
      daddr_pre = 9'd0;
		end
		default: begin
			den_pre <= `DLY  1'b0;
      daddr_pre = 9'd0;
		end
	endcase	

end

//State Machine
always @ (*)
begin
	if(rst_int)
		next_state <= `DLY  IDLE;
	else
	begin
		case(curr_state)
			IDLE: begin
				next_state <= `DLY  READ1;
			end
			READ1: begin
				next_state <= `DLY  WAIT1;
			end
			WAIT1: begin
				if(drdy_s)
					if(dfe_rst_b_s) //Out of DFE reset
						next_state <= `DLY  NOT_IN_RST;
					else
						next_state <= `DLY  IDLE; //Reset counter if see 0 in midst of 1's.  Keep reading until see in reset state
				else
					next_state <= `DLY  WAIT1;
			end
			NOT_IN_RST: begin //Wait for WAIT_CYC+1 reads non-reset since counter delayed by 1 cyc
				if(counter == WAIT_CYC)
					next_state <= `DLY  DONE;
				else
					next_state <= `DLY  READ1;
			end
			DONE: begin
				next_state <= `DLY  DONE;
			end
			default: begin
				next_state <= `DLY  IDLE;
			end
		endcase
	end
end

endmodule


/*
//For sim: LDCE as SR latch
module LDCE #(
  parameter INIT = 1'b0
)
(
  output reg Q,
  input CLR,
  input D,
  input G,
  input GE
);

  initial
  begin
    Q <= `DLY INIT;
  end

  always @ (CLR or G)
  begin
    if(CLR)
      Q <= `DLY 1'b0;
    else if(G)
      Q <= `DLY 1'b1;
  end

endmodule 
*/

