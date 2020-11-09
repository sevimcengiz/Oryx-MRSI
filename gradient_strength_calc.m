function [GR_ex, GR_echo,GR_echo2]=gradient_strength_calc(AP_VOI,RL_VOI,FH_VOI,varargin)

% - This function computes the gradient strengths for the calculation of chemical shift amounts
% given the RF bandwidths for the Philips 3T Achieva system.
% - The code was written for 3D-MRSI.
% - The imaging format is Left,Posterior,Head(Superior). (The pixel values increase as one traverses toward LPH.)
% - Chemical shift direction = Anterior,Left,Foot(Inferior)
% - Slice orientation = transverse
% - RFOV direction = RL
% - The plan scan reference metabolite = NAA
% - In this setup, Lactate/Lipid box shifts towards Anterior,Left,Foot(Inferior), and Cretine box shifts towards Posterior,Right,Head(Superior)

% For 3D acquisition:
% M_ori (ex) = AP
% P_ori (echo) = RL
% S_ori (echo2) = FH

% Example values for  VOI size RL=110, AP=110, FH=36,
% GR_ex= -0.9081 (on AP direction -- AP size = 110)
% GR_echo= -0.2710 (on RL direction -- RL size=110)
% GR_echo2= -0.8279 (on FH direction -- FH size=36)

% Sevim Cengiz & Esin Ozturk Isik & Muhammed Yildirim, Bogazici University , 2020

if nargin>3
    RF_ex_bw = varargin{1,1};
    RF_echo_bw=varargin{1,2};
    RF_echo2_bw=varargin{1,3};
    
else
    %Please check for your system's RF bandwidth values and change these values as needed.
    RF_ex_bw = 4253; %---ex_str
    RF_echo_bw = 1269; %---- echo
    RF_echo2_bw = 1269; %---- echo 2
end
% Please verify the directions of the the chemical shifts on your system.
Chem_Shift_Dir = [1 -1 1];

GAMMA_1H = 42577.46778;
MM = 0.001;


gamma_voithickness_ex = GAMMA_1H * AP_VOI * MM ; % Ex -- A
gamma_voithickness_echo   = GAMMA_1H * RL_VOI * MM ; % Echo   -- RL
gamma_voithickness_echo2  = GAMMA_1H * FH_VOI * MM ; % Echo2  -- FH

GR_ex = -RF_ex_bw / gamma_voithickness_ex*Chem_Shift_Dir(1);
GR_echo = -RF_echo_bw / gamma_voithickness_echo*Chem_Shift_Dir(2);
GR_echo2 = -RF_echo2_bw / gamma_voithickness_echo2*Chem_Shift_Dir(3);
end





