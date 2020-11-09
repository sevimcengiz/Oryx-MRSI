function [sig,Fe,Fref,B0]=Multivoxel_readPhilips_Sdat(rootname);

%rootname='~E1_press_1_raw_act';
%[sig,Fe,Fref,B0]=Multivoxel_readPhilips_Sdat(rootname);
% a=fftshift(fft(sig,[],4),4);
%overlay(a,3,14,14);

% example usage [sig,Fe,Fref,B0]=readPhilips_Sdat_multivoxel('c:\\your directory');
%
% INPUT rootname = contains the root name of the .sdat /spar so don't write
% ''.sdat/spar'' at the end of the directory
%
% OUTPUT sig = the complex time domain spectroscopic signals
% READ the .SPAR FILE
% Edited by Sevim C.

[DW,TF,nbPts,nbSignals,nrow,ncol,nslice]=readSPAR(rootname);
Fe=1000/DW;
Fref=TF;
B0 = TF * 4.6975 / (200 * 1E6);
fid=fopen(strcat((rootname),'.SDAT'),'r','ieee-le');
raw=freadVAXG(fid,nbPts*nbSignals*nslice*2,'float32');

if(nrow*ncol>1)
    for hs=1:1:nslice

        for k=1:1:nrow
            for j=1:1:ncol
                %
                sigR(hs,k,j,:)=raw(((hs-1)*nrow*ncol+(k-1)*ncol+ j-1)*2*nbPts+1:2:((hs-1)*nrow*ncol+(k-1)*ncol+j)*2*nbPts);
                sigI(hs,k,j,:)=raw(((hs-1)*nrow*ncol+(k-1)*ncol+ j-1)*2*nbPts+2:2:((hs-1)*nrow*ncol+(k-1)*ncol+j)*2*nbPts);
                
            end
        end
        
        
    end
    
else
    for k=1:nbSignals
        sigR(k,:)=raw((k-1)*2*nbPts+1:2:k*2*nbPts);
        sigI(k,:)=raw((k-1)*2*nbPts+2:2:k*2*nbPts);
    end
end

sig=sigR+1i*sigI;
save(rootname, 'sig');