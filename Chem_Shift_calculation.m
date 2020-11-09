function [chem_shift_ex,chem_shift_echo,chem_shift_echo2]=Chem_Shift_calculation(shifted_met_ppm,GR_ex,GR_echo,GR_echo2)

% This code calculates the chemical shift amount for a given metabolite
% ppm. Gradient strengths are calculated in gradient_strength_calc.m.
% The imaging format is Left,Posterior,Head(Superior). (The pixel values increase as one traverses toward LPH.)
% Chemical shift directions= A,L,F (A,L,Inferior)
% The plan scan reference metabolite = NAA
% In this setup, Lactate/Lipid box shifts towards Anterior,Left,Foot(Inferior), and Cretine box shifts towards Posterior,Right,Head(Superior)

% Sevim Cengiz & Esin Ozturk Isik & Muhammed Yildirim, Bogazici University,
% 2020

GAMMA_1H = 42577.46778;
PPM= 0.000001;
MM = 0.001;
Resonance_fq = 127732403;



ref_met_ppm=2.02; % NAA ppm
 
chem_shift_ex = -(shifted_met_ppm - ref_met_ppm) * PPM * Resonance_fq / (GAMMA_1H *GR_ex * MM);
chem_shift_echo =  -(shifted_met_ppm - ref_met_ppm) * PPM * Resonance_fq / (GAMMA_1H *GR_echo * MM);
chem_shift_echo2 =  -(shifted_met_ppm - ref_met_ppm) * PPM * Resonance_fq / (GAMMA_1H *GR_echo2 * MM);
end