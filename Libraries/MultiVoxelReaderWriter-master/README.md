# MultiVoxelReaderWriter

for multivoxel spectroscopic data reader,you follow the following steps:

 1.) run multivoxel_readPhilips_Sdat.m file
 2.) a=fftshift(fft(sig,[],4),4);
 3.) overlay(a,number of slice, number of row, number of column
 4.) jMRUI_Metabolite_Map

rootname='/Users/sevimcengiz/Documents/CIL_LAB/PD_Analyze/PD_Patients/K_04/exam_1/spectra/K_04_press_1_raw_act';
[sig,Fe,Fref,B0]=Multivoxel_readPhilips_Sdat(rootname);
 a=fftshift(fft(sig,[],4),4);
%overlay(a,3,14,14);

An example usage:

[sig,Fe,Fref,B0]=Multivoxel_readPhilips_Sdat('your directory'); % It doesn't consis of .sdat/spar file extension at the end of the your directory.
a=fftshift(fft(sig,[],4),4);
overlay(a,3,14,14) % slice=3, row=14, column=14

Note 1.) If you want to look at a specific spectra with a determined row or column, you run the following code:
figure,plot(squeeze(real(a(row,column,:)))) %figure,plot(squeeze(real(a(2,2,:))))
 
Note 2.) If you want to change the line color or linewidth of the spectra figured, you got to overlay.m and change the color and linewidth.

Note 3.) If you want to see the metabolite map using LCModel concentration results, you go to LCModel_Metabolite_Map.m file.