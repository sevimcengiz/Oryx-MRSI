% This function is written for visualization of raw MRSI file. 
% It reads .spar file and shows spectral visualization considering number
% of slices, rows and columns.
% Author: Sevim Cengiz, Bogazici University, 2021
% Contact: sevim_cengiz@icloud.com

% Input: sparfilepath
% Outputs: raw data

% Credits: 
% This code is based on functions from the FID-A toolbox by
%       Dr. Jamie Near (McGill University)
%       https://github.com/CIC-methods/FID-A
%       Simpson et al., Magn Reson Med 77:23-33 (2017)
function [raw_data]=RawDataVisual(sparfilepath)

[sig,Fe,Fref,B0]=Multivoxel_readPhilips_Sdat(sparfilepath); %Read raw MRSI data
raw_data=fftshift(fft(sig,[],4),4);

end