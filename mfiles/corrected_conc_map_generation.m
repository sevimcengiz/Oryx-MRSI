%% This function generates CSF corrected concentration Maps of all metabolites. 
% Inputs: P info struct, All concentration values parsed from LCModel output files.
% CSF corrected concentration map results will be under
% ~nifti/corrected_conc_maps folder as a nifti format.
% CSF correction is done using this formula: C=C0(1/(1-Vcsf),
% where C0 is concentration value parsed from LCModel outputs, Vcsf is the
% fraction value of CSF.
% Author: Sevim Cengiz,  Bogazici University , 2020
% Contact: sevim_cengiz@icloud.com
function corrected_conc_map_generation(Pinfo,AllConc,coreg_path,Metabolites,includedvoxels)

[sli row col]=size(Pinfo.littlevoxels);
fcsf=Pinfo.frac_CSF;
litvox_pixloc=Pinfo.metab;
metno=size(Metabolites);
for n=1:metno(1,2)
    
 %MRIFOVMask_file=load_untouch_nii([coreg_path,filesep,Pinfo.sparname,'_',Metabolites(n).name,'_FOV_mask.nii']);
 MRIFOVMask_file=load_untouch_nii([coreg_path,filesep,Pinfo.sparname,'_FOV_mask.nii']);
 im_size=size(MRIFOVMask_file.img);
 MRIFOVMask_file.img=zeros(im_size);
 MRIpressMask_file=load_untouch_nii([coreg_path,filesep,Pinfo.sparname,'_',Metabolites(n).name,'_PressBox_mask.nii']);
 
    %% Corrected metabolite concentration maps were generated using this formula
    % C=C0(1/(1-Vcsf) 
    
     for isli=1:sli
        for irow=1:row
            for icol=1:col
                
                if includedvoxels(n,isli,irow,icol)==1
                    loc=litvox_pixloc(n).littlevoxels(isli,irow,icol).loc;
                    [xx,yy] =size(loc);
                    
                    
                    C0=AllConc(n,isli,irow,icol);
                    Vcsf=fcsf(n,isli,irow,icol);
                    CorrMetConc=C0*(1/(1-Vcsf));
 
                    for kk=1:xx
                        locations=loc(kk,:);
                        lx=locations(1,1);
                        ly=locations(1,2);
                        lz=locations(1,3);
                        MRIFOVMask_file.img(lx,ly,lz)=CorrMetConc;
                    end
                    
                end
                
            end
        end
    end
    
    out_mask2=[Pinfo.spectrapath,filesep,'nifti',filesep,'corrected_conc_maps'];
    if ~exist(out_mask2,'dir')
        mkdir(out_mask2);
    end
    
    Mask_path=[out_mask2,filesep,Pinfo.sparname,'_',Metabolites(n).name,'_conc_corrected.nii'];
    mask=(MRIFOVMask_file.img.*MRIpressMask_file.img);
    MRIFOVMask_file.img=mask;
    MRIFOVMask_file.untouch=1;
    MRIFOVMask_file.fileprefix= Mask_path;
    save_untouch_nii(MRIFOVMask_file, Mask_path)
    
    
end