%% This function computes the gradient strengths for the calculation of chemical shift amounts
%% given the RF bandwidths for the Philips 3T Achieva system.
% - The code was written for 3D-MRSI.
% - The imaging format is Left,Posterior,Head(Superior). (The pixel values increase as one traverses toward LPH.)

% (For the given dataset in the GitHub)
% - Chemical shift direction = Anterior,Left,Foot(Inferior)
% - Slice orientation = transverse
% - RFOV direction = RL
% For 3D transverse acquisition: RFOV=RL
% M_ori (ex) = AP
% P_ori (echo) = RL
% S_ori (echo2) = FH
% For 3D transverse acquisition: RFOV=AP
% M_ori (ex) = RL
% P_ori (echo) = AP
% S_ori (echo2) = FH
% In this setup, Lactate/Lipid box shifts towards Anterior,Right,Foot(Inferior), and Cretine box shifts towards Posterior,Left,Head(Superior)
% Please verify the directions of the the chemical shifts on your system.

% Authors: Sevim Cengiz & Esin Ozturk Isik & Muhammed Yildirim, Bogazici University , 2020
% Contact: sevim_cengiz@icloud.com
function [GR_ex, GR_echo,GR_echo2]=gradient_strength_calc(VOI_ex,VOI_echo,VOI_echo2,Chem_Shift_Dir,varargin)

if nargin>3
    RF_ex_bw = varargin{1,1};
    RF_echo_bw=varargin{1,2};
    RF_echo2_bw=varargin{1,3};
else
    %Please check for the system's RF bandwidth values and change these values as needed (For the dataset given in GitHub).
    RF_ex_bw = 4253; %---ex_str
    RF_echo_bw = 1269; %---- echo
    RF_echo2_bw = 1269; %---- echo 2
end

GAMMA_1H = 42577.46778; %(kHZ/T)
    
GR_ex = -RF_ex_bw / (GAMMA_1H*VOI_ex*0.001*Chem_Shift_Dir(1));
GR_echo =-RF_echo_bw /( GAMMA_1H*VOI_echo*0.001*Chem_Shift_Dir(2));
GR_echo2 =-RF_echo2_bw / (GAMMA_1H*VOI_echo2*0.001*Chem_Shift_Dir(3));
        
end





