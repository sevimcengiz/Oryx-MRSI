% This function is written to register anatomical reference images onto
% MNI152 brain atlas. FSL-Flirt is a requirement. 
% Please, make sure that check_fsl_usage_from_matlab works without error.
% Inputs: Pinfo struct, MRSI acquisition information. 
% Outpus: All volumes of the images will be saved under
% ~spectra/nifti/MNI_regist folder as  nifti files.
% Author: Sevim Cengiz, Bogazici University, 2021
% Contact: sevim_cengiz@icloud.com
function MNI_brain_Registration(Pinfo,app_MRSIacquiredafterButtonGroup_SelectedObject_Text)
ref_MNI=([filesep,'usr',filesep,'local',filesep,'fsl',filesep,'data',filesep,'standard',filesep,'MNI152_T1_2mm_brain.nii.gz']);

out_MNIRegst=[Pinfo.mainpath,'exam_1',filesep,'spectra',filesep,'nifti',filesep,'MNI_regist'];
if ~exist(out_MNIRegst,'dir')
    mkdir(out_MNIRegst);
end

matrix_o_path=[out_MNIRegst,filesep,'mat_reg_MNI.mat'];
output_file=[out_MNIRegst,filesep,'reg_to_MNI.nii.gz'];

switch app_MRSIacquiredafterButtonGroup_SelectedObject_Text
    case 'T1w-MRI' %where "Button1" is the name of the first radio button
        T1=[Pinfo.mainpath,'exam_1',filesep,'images',filesep,'T1',filesep,'nifti',filesep,Pinfo.name,'_Bet.nii.gz'];
        system(['flirt ', '-in ', T1, ' -ref ', ref_MNI, ' -out ', output_file, ' -omat ', matrix_o_path, ' -bins 256 -cost corratio -searchrx -90 90 -searchry -90 90 -searchrz -90 90 -dof 12  -interp trilinear']);
    otherwise %'T2w-MRI'
        T1ontoT2=[Pinfo.mainpath,'exam_1',filesep,'images',filesep,'T1',filesep,'nifti',filesep,'Regist_T1_to_T2',filesep,Pinfo.name,'_reg_T1_to_T2.nii.gz'];
        system(['flirt ', '-in ', T1ontoT2, ' -ref ', ref_MNI, ' -out ', output_file, ' -omat ', matrix_o_path, ' -bins 256 -cost corratio -searchrx -90 90 -searchry -90 90 -searchrz -90 90 -dof 12  -interp trilinear']);
end

%% Coregbinary mask Registration
out_mask2=[Pinfo.mainpath,'exam_1',filesep,'spectra',filesep,'nifti',filesep,'coreg_binary_mask',filesep];
fold_out_mask2=dir([out_mask2,Pinfo.sparname,'*PressBox_mask.nii']);

for n=1:numel(fold_out_mask2)
    otherfiles= [fold_out_mask2(n).folder,filesep,fold_out_mask2(n).name];
    
    filename=strsplit(fold_out_mask2(n).name,'.nii');
    shadow_o_path = [out_MNIRegst,filesep,filename{1,1},'_reg_MNI.nii.gz'];
    
    %     shadow_o_path = [out_MNIRegst,filesep,'regMNI_',fold_out_mask2(n).name];
    system(['flirt ', '-in ', otherfiles, ' -ref ',ref_MNI, ' -out ', shadow_o_path, ' -applyxfm ', ' -init ', matrix_o_path,  ' -interp trilinear']);
end

%% MetaboliteMaps Registration
out_mask3=[Pinfo.mainpath,'exam_1',filesep,'spectra',filesep,'nifti',filesep,'conc_maps',filesep];
fold_out_mask3=dir([out_mask3,Pinfo.sparname,'*conc.nii']);

for n=1:numel(fold_out_mask3)
    otherfiles= [fold_out_mask3(n).folder,filesep,fold_out_mask3(n).name];
    filename=strsplit(fold_out_mask3(n).name,'.nii');
    shadow_o_path = [out_MNIRegst,filesep,filename{1,1},'_reg_MNI.nii.gz'];
    %     shadow_o_path = [out_MNIRegst,filesep,'regMNI_',fold_out_mask3(n).name];
    system(['flirt ', '-in ', otherfiles, ' -ref ',ref_MNI, ' -out ', shadow_o_path, ' -applyxfm ', ' -init ', matrix_o_path,  ' -interp trilinear']);
end


%% MetMaps to /CrPCr Registration
out_mask4=[Pinfo.mainpath,'exam_1',filesep,'spectra',filesep,'nifti',filesep,'conc_maps_to_tCr_ratio',filesep];
fold_out_mask4=dir([out_mask4,Pinfo.sparname,'*ratio.nii']);

for n=1:numel(fold_out_mask4)
    otherfiles= [fold_out_mask4(n).folder,filesep,fold_out_mask4(n).name];
    filename=strsplit(fold_out_mask4(n).name,'.nii');
    shadow_o_path = [out_MNIRegst,filesep,filename{1,1},'_reg_MNI.nii.gz'];
    %     shadow_o_path = [out_MNIRegst,filesep,'regMNI_',fold_out_mask4(n).name];
    system(['flirt ', '-in ', otherfiles, ' -ref ',ref_MNI, ' -out ', shadow_o_path, ' -applyxfm ', ' -init ', matrix_o_path,  ' -interp trilinear']);
end

%% MetMaps to /Ins Registration
out_mask5=[Pinfo.mainpath,'exam_1',filesep,'spectra',filesep,'nifti',filesep,'conc_maps_to_Ins_ratio',filesep];
fold_out_mask5=dir([out_mask5,Pinfo.sparname,'*ratio.nii']);

for n=1:numel(fold_out_mask5)
    otherfiles= [fold_out_mask5(n).folder,filesep,fold_out_mask5(n).name];
    filename=strsplit(fold_out_mask5(n).name,'.nii');
    shadow_o_path = [out_MNIRegst,filesep,filename{1,1},'_reg_MNI.nii.gz'];
    %     shadow_o_path = [out_MNIRegst,filesep,'regMNI_',fold_out_mask5(n).name];
    system(['flirt ', '-in ', otherfiles, ' -ref ',ref_MNI, ' -out ', shadow_o_path, ' -applyxfm ', ' -init ', matrix_o_path,  ' -interp trilinear']);
end

%% Corrected Metabolite Maps Registration
out_mask6=[Pinfo.mainpath,'exam_1',filesep,'spectra',filesep,'nifti',filesep,'corrected_conc_maps',filesep];
fold_out_mask6=dir([out_mask6,Pinfo.sparname,'*corrected.nii']);

for n=1:numel(fold_out_mask6)
    otherfiles= [fold_out_mask6(n).folder,filesep,fold_out_mask6(n).name];
    filename=strsplit(fold_out_mask6(n).name,'.nii');
    shadow_o_path = [out_MNIRegst,filesep,filename{1,1},'_reg_MNI.nii.gz'];
    %     shadow_o_path = [out_MNIRegst,filesep,'regMNI_',fold_out_mask6(n).name];
    system(['flirt ', '-in ', otherfiles, ' -ref ',ref_MNI, ' -out ', shadow_o_path, ' -applyxfm ', ' -init ', matrix_o_path,  ' -interp trilinear']);
end

%% Corrected Metabolite Maps /CrPCr Registration
out_mask7=[Pinfo.mainpath,'exam_1',filesep,'spectra',filesep,'nifti',filesep,'corrected_conc_maps_to_tCr_ratio',filesep];
fold_out_mask7=dir([out_mask7,Pinfo.sparname,'*corrected.nii']);

for n=1:numel(fold_out_mask7)
    otherfiles= [fold_out_mask7(n).folder,filesep,fold_out_mask7(n).name];
    filename=strsplit(fold_out_mask7(n).name,'.nii');
    shadow_o_path = [out_MNIRegst,filesep,filename{1,1},'_reg_MNI.nii.gz'];
    %     shadow_o_path = [out_MNIRegst,filesep,'regMNI_',fold_out_mask7(n).name];
    system(['flirt ', '-in ', otherfiles, ' -ref ',ref_MNI, ' -out ', shadow_o_path, ' -applyxfm ', ' -init ', matrix_o_path,  ' -interp trilinear']);
end

%% Corrected Metabolite Maps /Ins Registration

out_mask8=[Pinfo.mainpath,'exam_1',filesep,'spectra',filesep,'nifti',filesep,'corrected_conc_maps_to_Ins_ratio',filesep];
fold_out_mask8=dir([out_mask8,Pinfo.sparname,'*corrected.nii']);

for n=1:numel(fold_out_mask8)
    otherfiles= [fold_out_mask8(n).folder,filesep,fold_out_mask8(n).name];
    filename=strsplit(fold_out_mask8(n).name,'.nii');
    shadow_o_path = [out_MNIRegst,filesep,filename{1,1},'_reg_MNI.nii.gz'];
    %     shadow_o_path = [out_MNIRegst,filesep,'regMNI_',fold_out_mask8(n).name];
    system(['flirt ', '-in ', otherfiles, ' -ref ',ref_MNI, ' -out ', shadow_o_path, ' -applyxfm ', ' -init ', matrix_o_path,  ' -interp trilinear']);
end
%% GM / WM / CSF registration onto MNI brain atlas

switch app_MRSIacquiredafterButtonGroup_SelectedObject_Text
    case 'T1w-MRI'
        out_mask9=[Pinfo.mainpath,'exam_1',filesep,'images',filesep,'T1',filesep,'nifti',filesep];
    otherwise % 'T2w-MRI'
        out_mask9=[Pinfo.mainpath,'exam_1',filesep,'images',filesep,'T1',filesep,'nifti',filesep,'Regist_T1_to_T2',filesep];
end
        fold_out_mask9=dir([out_mask9,Pinfo.name,'_Bet_pve_*.nii.gz']);
        
        for n=1:numel(fold_out_mask9)
            otherfiles= [fold_out_mask9(n).folder,filesep,fold_out_mask9(n).name];
            filename=strsplit(fold_out_mask9(n).name,'.nii');
            shadow_o_path = [out_mask9,filename{1,1},'_reg_MNI.nii.gz'];
            system(['flirt ', '-in ', otherfiles, ' -ref ',ref_MNI, ' -out ', shadow_o_path, ' -applyxfm ', ' -init ', matrix_o_path,  ' -interp trilinear']);
        end
end
