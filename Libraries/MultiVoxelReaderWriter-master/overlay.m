%This m file overlays the spectra read in Multivoxel_readPhilips_Sdat 
%and then applied fftshift/fft.
%
%usage:first readme.txt and write the command line:
% >> overlay(a,nslice,nrow,ncol)
%%%%%%%%% Example Usage:%%%%%%%%%%%%%%%%%%% 
% addpath 'your directory';
% [sig,Fe,Fref,B0]=Multivoxel_readPhilips_Sdat('~/E1_SPECT1_6_1_raw_act');
% a=fftshift(fft(sig,[],4),4);
% jMRUI_Metabolite_Map
% overlay(a,3,14,14)
%Edited Sevim C.


function overlay(a,nslice,nrow,ncol,rootname)
for sh=1:nslice
%   figure('units','normalized','outerposition',[0 0 1 1]),title(rootname);
   figure('units','normalized','outerposition',[0 0 10000 10000], 'innerposition',[0 0 100000 100000]);
    % figure;
   n=1;
    for k=1:nrow
        for j=1:ncol
            subplot(nrow,ncol,n);
            % plot(squeeze(real(a(sh,k,j,:))),'r','LineWidth',2.3);
               plot(squeeze(real(flip(a(sh,k,j,:)))),'k' );% flipdim'de kullanilabilir
               axis ([1 1024 -100000 100000]);
               %plot(squeeze(real(flipdim(a(sh,k,j,:)))),'k' );% flipdim'de kullanilabilir
               %axis ([100 1024 min(real(a(sh,k,j,:))) max(real(a(sh,k,j,:)))])     
%axis ([400 800 -30000 30000]); %%Sevimmin orjinal kodundaki yer.
            box on;
            axis off;
            n=n+1;
        end
    end
end
       %%%NAA,Cho,mI locationlari 
       %%%NAA 687.point
       %%%Cr 620.point
       %%%mI 562.point
%%%%%figure,   plot(squeeze(real(flip(a(3,8,8,:)))),'k' );axis ([400 800 -30000 30000]); 