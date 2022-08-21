# Jtag_verliog_rtl
 jtag tap_controller_fsm Verilog code
 # TAP CONTROLLER
 In this design have following input and output signal- 

 **inputs**

![image](https://user-images.githubusercontent.com/72481400/185791320-994219bd-8eed-43d7-92a2-8e7499e2e05c.png)

**outputs** - all output have 1 bit-

![image](https://user-images.githubusercontent.com/72481400/185791288-786b7425-3468-470e-b1ec-9e3750de8148.png)


and have 16 states in fsm which given below with define constant value - 

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
 
localparam  PAUSE_IR=4'hF;

and define one 4 bit register type varible for state.

# FSM flow chart 

**working**

 When trst have negative edage then all output have zero and state value equal to TEST_LOGIC_RESET(initial state).

For tms signal value apply succesive 5 cycle as 1 then it reached initial state from any state here have all output 0.

At CAPTURE_DR state cdr1 siganl reflecting high and other five as low.

At SHIFT_DR state sdr1 siganl reflecting high and other five as low.

At UPDATE_DR state udr1 siganl reflecting high and other five as low.

At CAPTURE_DR state cir1 siganl reflecting high and other five as low.

At SHIFT_DR state sir1 siganl reflecting high and other five as low.

At UPDATE_DR state uir1 siganl reflecting high and other five as low.

![image](https://user-images.githubusercontent.com/72481400/185790272-d5d10c38-6f98-4b9f-a77f-cfd67a2de2b9.png)

# WAVEFORM-

![tap_controller_output](https://user-images.githubusercontent.com/72481400/185790363-2623fee2-4d19-456d-9cae-8a9a474fb9b5.JPG)
