% Metabolite_Map.m file shows you a colorful metabolite map 
% It takes the metabolite information from the jmrui reader steps. 
% If you want to see the metabolite map using LCModel concentration results, 
% go to LCModel_Metabolite_Map.m file
%
% This shows you NAA metabolite and we assume that the NAA peak position is
% at the 339.
%
%%%%%%%%% Example Usage:%%%%%%%%%%%%%%%%%%% 
% addpath 'C:\Users\USER01\Documents\spm\external\multi_voxel_spar_reader';
% [sig,Fe,Fref,B0]=Multivoxel_readPhilips_Sdat('C:\Users\USER01\Documents\Patients\PD_11\PD_11_MRS\SPECT1_6_1_raw_act');
% a=fftshift(fft(sig,[],4),4);
% jMRUI_Metabolite_Map
% overlay(a,3,14,14)
%
%
% for sh=1:3
%     metabolitename='NAA'; 
%     figure,imagesc(squeeze(real(a(sh,:,:,339))));
%     title(sprintf('%s Map-Number of Slice %d',metabolitename,sh));
%     colorbar;
%   end

metabolite='NAA';
figure (1),FigureMap1=imagesc(squeeze(real(a(1,:,:,339)))); title(sprintf('%s Map-Number of Slice 1',metabolite)); axis image; colorbar; hold on;
figure (2),FigureMap2=imagesc(squeeze(real(a(2,:,:,339)))); title(sprintf('%s Map-Number of Slice 2',metabolite)); axis image; colorbar; hold on;
figure (3),FigureMap3=imagesc(squeeze(real(a(3,:,:,339)))); title(sprintf('%s Map-Number of Slice 3',metabolite)); axis image; colorbar; hold on;

%If you don't want to save your results as a dicom file, you comment the
%following codes:

DicomMask1=zeros(14,14);
DicomMask2=zeros(14,14);
DicomMask3=zeros(14,14);
for s=1:14
    for p=1:14
    DicomMask1(s,p)=FigureMap1.CData(s,p);
    DicomMask2(s,p)=FigureMap2.CData(s,p);
    DicomMask3(s,p)=FigureMap3.CData(s,p);
    end
end
FigureMapDicom1=uint16(DicomMask1);
dicomwrite(FigureMapDicom1, 'FigureMapDicom1.dcm');
FigureMapDicom2=uint16(DicomMask2);
dicomwrite(FigureMapDicom2, 'FigureMapDicom2.dcm');
FigureMapDicom3=uint16(DicomMask3);
dicomwrite(FigureMapDicom3, 'FigureMapDicom3.dcm');


