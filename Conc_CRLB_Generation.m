%% This function generates NIfTI volumes which keeps CRLB values of all metabolites. 
% Inputs: P info struct, All concentration values parsed from LCModel output files.
% All maps will be saved under ~nifti/CRLB_maps folder as a nifti file.
% Author: Sevim Cengiz,  Bogazici University , 2022 - For revision
% Contact: sevim_cengiz@icloud.com

function Conc_CRLB_Generation(Pinfo,AllNumStd,coreg_path,Metabolites,referancemetabolite)

[sli row col]=size(Pinfo.littlevoxels);
fcsf=Pinfo.frac_CSF;
includedvoxels=ones(1,sli,row,col);
litvox_pixloc=Pinfo.metab;
metno=size(Metabolites);
for n=1:metno(1,2)
if referancemetabolite=='NAA'
 refmetpressname='NAA+NAAG';
elseif referancemetabolite=='Cr'
    refmetpressname='Cr+PCr';
elseif referancemetabolite=='Cho'
    refmetpressname='GPC+PCh'
elseif referancemetabolite=='Lac'
    refmetpressname='Lac'
else
    refmetpressname=referancemetabolite;
end




 MRIFOVMask_file=load_untouch_nii([coreg_path,filesep,Pinfo.sparname,'_FOV_mask.nii']);
 im_size=size(MRIFOVMask_file.img);
 MRIFOVMask_file.img=zeros(im_size);
 %MRIpressMask_file=load_untouch_nii([coreg_path,filesep,Pinfo.sparname,'_',Metabolites(n).name,'_PressBox_mask.nii']);
 MRIpressMask_file=load_untouch_nii([coreg_path,filesep,Pinfo.sparname,'_',refmetpressname,'_PressBox_mask.nii']);

 %% LCModel concentration results are used after exclusion criteria.
 
    for isli=1:sli
        for irow=1:row
            for icol=1:col                
                if includedvoxels(1,isli,irow,icol)==1 || includedvoxels(1,isli,irow,icol)==0
                    loc=litvox_pixloc(1).littlevoxels(isli,irow,icol).loc;
                    [xx,yy] =size(loc);
                    
                    for kk=1:xx
                        locations=loc(kk,:);
                        lx=locations(1,1);
                        ly=locations(1,2);
                        lz=locations(1,3);
                        MRIFOVMask_file.img(lx,ly,lz)=AllNumStd(n,isli,irow,icol);
                    end
                    
                end
                
            end
        end
    end
    
    out_mask=[Pinfo.spectrapath,filesep,'nifti',filesep,'CRLB_maps'];
    if ~exist(out_mask,'dir')
        mkdir(out_mask);
    end
    
    Mask_path=[out_mask,filesep,Pinfo.sparname,'_',Metabolites(n).name,'_CRLB.nii'];
    mask=(MRIFOVMask_file.img.*MRIpressMask_file.img);
    MRIFOVMask_file.img=mask;
    MRIFOVMask_file.img=MRIFOVMask_file.img; 
   MRIFOVMask_file.untouch=1;
    MRIFOVMask_file.fileprefix= Mask_path;
    save_untouch_nii(MRIFOVMask_file, Mask_path)
 
end
%% kk