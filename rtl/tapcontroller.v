`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Teekam chand Khandelwal
// 
// Create Date:    22:44:49 08/20/2022 
// Design Name: Tap_controller_asm
// Module Name:    tap_controller 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module tap_controller(input tck,tms,trst, output   cdr1, sdr1, udr1, cir1,sir1,uir1
    );

/*where -
c= capture
u= update
s= shift
dr= data register
ir= instruction register
tck = input clock
tms = state mode signal
trst= reset signal

*/
localparam TEST_LOGIC_RESET = 4'h0; 
localparam RUN_TEST_IDLE = 4'h1;
localparam SELECT_DR=4'h2;
 localparam CAPTURE_DR=4'h3;
 localparam SHIFT_DR=4'h4;
localparam  EXIT1_DR=4'h5; 
 localparam EXIT2_DR=4'h6;
localparam  UPDATE_DR=4'h7;
localparam PAUSE_DR=4'h8;
localparam  SELECT_IR=4'h9;
localparam  CAPTURE_IR=4'hA;
localparam  SHIFT_IR=4'hB; 
 localparam EXIT1_IR=4'hC;
localparam  EXIT2_IR=4'hD;
 localparam UPDATE_IR=4'hE; 
localparam  PAUSE_IR=4'hf;

reg [3:0] state ; // next_state;
//reg cdr1, sdr1, udr1, cir1,sir1,uir1;

assign  cdr1=(state == CAPTURE_DR);
assign  sdr1=(state == SHIFT_DR); 
assign  udr1=(state == UPDATE_DR); 
assign  cir1=(state == CAPTURE_IR);
assign  sir1=(state == SHIFT_IR);
assign uir1=(state== UPDATE_IR);

always@(posedge tck or negedge trst)begin
if(~trst)begin 
state <= TEST_LOGIC_RESET;
end
else begin
/*
state <= next_state;
end
end

always@(*)begin */
case(state)
 TEST_LOGIC_RESET : 
 if(tms)
state <= TEST_LOGIC_RESET;
else 
state <= RUN_TEST_IDLE;
 
 RUN_TEST_IDLE :
if(tms)
state <= SELECT_DR;
else 
state <= RUN_TEST_IDLE;

SELECT_DR :
if(tms)
state <= SELECT_IR;
else 
state <= CAPTURE_DR;
 
 CAPTURE_DR  :
 if(tms)begin
state <= EXIT1_DR;
end
else 
state <= SHIFT_DR;
 
 
 SHIFT_DR   :
 if(tms) begin
state <= EXIT1_DR;
end
else 
state <= SHIFT_DR;
 
 
 EXIT1_DR  :
if(tms)
state <= UPDATE_DR;
else 
state <= PAUSE_DR;
 

 PAUSE_DR :
if(tms)
state <= EXIT2_DR;
else
state <= PAUSE_DR;
 
 
 EXIT2_DR  : 
 if(tms)
state <= UPDATE_DR;
else 
state <= SHIFT_DR;

 
 UPDATE_DR: 
if(tms)begin
state <= SELECT_DR;

end
else 
state <= RUN_TEST_IDLE;
 
 //Instruction 
 
 SELECT_IR  :
 if(tms)
state <= TEST_LOGIC_RESET;
else 
state <= CAPTURE_IR;

 
 CAPTURE_IR  :
 if(tms) begin
state <= EXIT1_IR;

end
else 
state <= SHIFT_IR;
 
 SHIFT_IR :
if(tms) begin
state <= EXIT1_IR;

end
else 
state <= SHIFT_IR;
 
 EXIT1_IR  :
 if(tms)
state <= UPDATE_IR;
else 
state <= PAUSE_IR;
 
 
 PAUSE_IR  :
 if(tms)
state <= EXIT2_IR;
else 
state <= PAUSE_IR;
 
 
 EXIT2_IR  :
 if(tms)
 state <= UPDATE_IR;
 else 
 state <= SHIFT_IR;
 
 
 UPDATE_IR :
if(tms) begin
state <= SELECT_DR;
end
else 
state <= RUN_TEST_IDLE;

 //default : next_state = TEST_LOGIC_RESET;
endcase

end

end



endmodule
