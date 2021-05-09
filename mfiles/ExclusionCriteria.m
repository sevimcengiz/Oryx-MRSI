%% This function is written for spectra quality module. 
% This helps to create a display for voxels included in the 1H-MRSI data analysis for each metabolite.
% Main Page of Oryx asks user to define some exclusion criteria values for  the FWHM, SNR, CRLB, and fCSF.
% This function uses those information to create a binary mask of spectral
% quality at each voxel. 
% Author: Sevim Cengiz. Bogazici University, 2020
% Contact: sevim_cengiz@icloud.com

function [includedvoxels]=ExclusionCriteria(Pinfo,AllFWHM,Allsnr,AllNumStd,Metname,Metabolites,outmat,Exc_struct);

fcsf=Pinfo.frac_CSF;
Naa_no=Metabolites(1,9).no;
Lip13a_no=Metabolites(1,6).no;
Lip13b_no=Metabolites(1,7).no;
Lip13comp_no=Metabolites(1,8).no;

cutoff_fcsf=Exc_struct.value(1,1);
cutoff_snr=Exc_struct.value(1,2);
cutoff_fwhm=Exc_struct.value(1,3);
cutoff_crlb=Exc_struct.value(1,4);

includedvoxels=ones(size(fcsf));
[sli row col]=size(Pinfo.littlevoxels);

%Exlusion criteria:  SNR<8 & FWHM>0.10 excluded -- (Recommended values)
for isli=1:sli
    for irow=1:row
        for icol=1:col
            
            if Allsnr(isli,irow,icol)<cutoff_snr
                includedvoxels(:,isli,irow,icol)=0;
            end
            
            if AllFWHM(isli,irow,icol)>cutoff_fwhm
                includedvoxels(:,isli,irow,icol)=0;
            end 
        end
    end
end

% Exclusion criteria: (Fraction of csf >0.30) AND (std of NAA>30 & std of
% LIPID<30) excluded -- (Recommended Values)

for n=1:numel(Metname)
    
    for isli=1:sli
        for irow=1:row
            for icol=1:col
                
                
                if fcsf(n,isli,irow,icol)>cutoff_fcsf
                    includedvoxels(n,isli,irow,icol)=0;
                end
                
                if AllNumStd(n,isli,irow,icol)>cutoff_crlb
                    includedvoxels(n,isli,irow,icol)=0;
                end
                
                if AllNumStd(Naa_no,isli,irow,icol)>cutoff_crlb & (AllNumStd(Lip13comp_no,isli,irow,icol)<cutoff_crlb  | AllNumStd(Lip13a_no,isli,irow,icol)<cutoff_crlb | AllNumStd(Lip13b_no,isli,irow,icol)<cutoff_crlb)
                    
                    includedvoxels(n,isli,irow,icol)=0;
                end
                
            end
        end
    end
end
outincludedvox=[outmat,filesep,Pinfo.sparname,'_includedvoxels.mat'];
save(outincludedvox, 'includedvoxels');
end

