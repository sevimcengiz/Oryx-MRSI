function MNI_brain_Registration(Pinfo,MRSIacquiredafterNo)
ref_MNI=('/usr/local/fsl/data/standard/MNI152_T1_2mm_brain.nii.gz');

out_MNIRegst=[Pinfo.mainpath,'exam_1',filesep,'spectra',filesep,'nifti',filesep,'MNI_regist'];
if ~exist(out_MNIRegst,'dir')
    mkdir(out_MNIRegst);
end

matrix_o_path=[out_MNIRegst,filesep,'mat_reg_MNI.mat'];
output_file=[out_MNIRegst,filesep,'reg_to_MNI.nii.gz'];


if MRSIacquiredafterNo == 1
    T1=[Pinfo.mainpath,'exam_1',filesep,'images',filesep,'T1',filesep,'nifti',filesep,Pinfo.name,'_Bet.nii.gz'];
    system(['flirt ', '-in ', T1, ' -ref ', ref_MNI, ' -out ', output_file, ' -omat ', matrix_o_path, ' -bins 256 -cost corratio -searchrx -90 90 -searchry -90 90 -searchrz -90 90 -dof 12  -interp trilinear']);

else
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

end