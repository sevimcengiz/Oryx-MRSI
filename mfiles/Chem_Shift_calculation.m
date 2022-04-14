%% This function computes the gradient strengths for the calculation of chemical shift amounts
% given the RF bandwidths for the Philips 3T Achieva system.

% The code was written for 3D-MRSI.
% Inputs: shifted metabolite ppm, Gradient ex, echo and echo2, and
% referance metabolite name.
% Outputs: Chemical shift ex, echo and echo 2.

% (For the given dataset in the GitHub)
% - Chemical shift direction = Anterior,Left,Foot(Inferior)
% For 3D acquisition:
% - Slice orientation = transverse
% - RFOV direction = RL
% M_ori (ex) = AP
% P_ori (echo) = RL
% S_ori (echo2) = FH
% In this setup, Lactate/Lipid box shifts towards Anterior,Left,Foot(Inferior), and Cretine box shifts towards Posterior,Right,Head(Superior)
% Please verify the directions of the the chemical shifts on your system.

% Authors: Sevim Cengiz & Esin Ozturk Isik & Muhammed Yildirim, Bogazici University , 2020
function [chem_shift_ex,chem_shift_echo,chem_shift_echo2]=Chem_Shift_calculation(shifted_met_ppm,GR_ex,GR_echo,GR_echo2,ReferenceMetabolite2,userrefmetppm)
 
GAMMA_1H = 42577.46778;
Resonance_fq = 127732403;

switch ReferenceMetabolite2
    case 'H2O'
        ref_met_ppm=4.7; % H2O ppm
    case 'NAA'
        ref_met_ppm=2.02; % NAA ppm
    case 'Cr'
        ref_met_ppm=3.03; % Cr ppm
    case 'Cho'
        ref_met_ppm=3.2; % Cho ppm
    case 'LacLip'
        ref_met_ppm=1.3; % Lac/Lip ppm
    otherwise
        ref_met_ppm=userrefmetppm;
end

delta_ppm= (shifted_met_ppm - ref_met_ppm);

chem_shift_ex = -delta_ppm * 0.000001 *  Resonance_fq / (GAMMA_1H *GR_ex * 0.001);
chem_shift_echo =  -delta_ppm * 0.000001 * Resonance_fq / (GAMMA_1H *GR_echo * 0.001);
chem_shift_echo2 =  -delta_ppm * 0.000001 * Resonance_fq / (GAMMA_1H *GR_echo2 * 0.001);
end