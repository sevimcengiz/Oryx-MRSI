function GM_WM_CSF(Pinfo,Metabolites,MRSIacquiredafterButtonGroup_SelectedObject_Text)

pressboxmaskpathprob=[Pinfo.spectrapath,filesep,'nifti',filesep,'Pressbox_prob_files'];
maskvol_list=dir([Pinfo.spectrapath,filesep,'nifti',filesep,'Pressbox_prob_files',filesep,'*.nii.gz']);

switch MRSIacquiredafterButtonGroup_SelectedObject_Text
    case 'T1w-MRI'
        
        csf_path=[Pinfo.mainpath,'exam_1',filesep,'images',filesep,'T1',filesep,'nifti',filesep,Pinfo.name,'_Bet_pve_0_reg_MNI.nii.gz']
        gm_path=[Pinfo.mainpath,'exam_1',filesep,'images',filesep,'T1',filesep,'nifti',filesep,Pinfo.name,'_Bet_pve_1_reg_MNI.nii.gz'];
        wm_path=[Pinfo.mainpath,'exam_1',filesep,'images',filesep,'T1',filesep,'nifti',filesep,Pinfo.name,'_Bet_pve_2_reg_MNI.nii.gz'];
        
    otherwise % case: 'T2w-MRI '
        
        csf_path=[Pinfo.mainpath,'exam_1',filesep,'images',filesep,'T1',filesep,'nifti',filesep,'Regist_T1_to_T2',filesep,Pinfo.name,'_Bet_pve_0_reg_T1_to_T2_reg_MNI.nii.gz'];
        gm_path=[Pinfo.mainpath,'exam_1',filesep,'images',filesep,'T1',filesep,'nifti',filesep,'Regist_T1_to_T2',filesep,Pinfo.name,'_Bet_pve_1_reg_T1_to_T2_reg_MNI.nii.gz'];
        wm_path=[Pinfo.mainpath,'exam_1',filesep,'images',filesep,'T1',filesep,'nifti',filesep,'Regist_T1_to_T2',filesep,Pinfo.name,'_Bet_pve_2_reg_T1_to_T2_reg_MNI.nii.gz'];
        
end













end