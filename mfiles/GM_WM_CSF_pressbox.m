%% This function is written to create CSF, WM and GM pressbox volumes.
% It enables us to evaluate ROI analysis of CSF, WM and GM fractions of pressbox.
% Author: Sevim Cengiz, Bogazici University, 2020
% Contact: sevim_cengiz@icloud.com
% Inputs: Pinfo struct,  MRSI acquired after T1w-MRI or T2w-MRI
% Outputs: Output files will be saved under ~spectra/nifti/csf_wm_gm_pressbox_prob_files

function GM_WM_CSF_pressbox(Pinfo,Metabolites,MRSIacquiredafterButtonGroup_SelectedObject_Text)

pressboxmaskpathprob=[Pinfo.spectrapath,filesep,'nifti',filesep,'Pressbox_prob_files']; 
maskvol_list=dir([Pinfo.spectrapath,filesep,'nifti',filesep,'Pressbox_prob_files',filesep,'*.nii.gz']);
out_Analysis=[Pinfo.spectrapath,filesep,'nifti',filesep,'csf_wm_gm_pressbox_prob_files']; 
if ~exist(out_Analysis,'dir')
    mkdir(out_Analysis);
end

switch MRSIacquiredafterButtonGroup_SelectedObject_Text
    case 'T1w-MRI'
        
        csf_path=[Pinfo.mainpath,'exam_1',filesep,'images',filesep,'T1',filesep,'nifti',filesep,Pinfo.name,'_Bet_pve_0_reg_MNI.nii.gz'];
        gm_path=[Pinfo.mainpath,'exam_1',filesep,'images',filesep,'T1',filesep,'nifti',filesep,Pinfo.name,'_Bet_pve_1_reg_MNI.nii.gz'];
        wm_path=[Pinfo.mainpath,'exam_1',filesep,'images',filesep,'T1',filesep,'nifti',filesep,Pinfo.name,'_Bet_pve_2_reg_MNI.nii.gz'];
        
    otherwise % case: 'T2w-MRI '
        
        csf_path=[Pinfo.mainpath,'exam_1',filesep,'images',filesep,'T1',filesep,'nifti',filesep,'Regist_T1_to_T2',filesep,Pinfo.name,'_Bet_pve_0_reg_T1_to_T2_reg_MNI.nii.gz'];
        gm_path=[Pinfo.mainpath,'exam_1',filesep,'images',filesep,'T1',filesep,'nifti',filesep,'Regist_T1_to_T2',filesep,Pinfo.name,'_Bet_pve_1_reg_T1_to_T2_reg_MNI.nii.gz'];
        wm_path=[Pinfo.mainpath,'exam_1',filesep,'images',filesep,'T1',filesep,'nifti',filesep,'Regist_T1_to_T2',filesep,Pinfo.name,'_Bet_pve_2_reg_T1_to_T2_reg_MNI.nii.gz'];
        
end
csf=load_untouch_nii(csf_path);
gm=load_untouch_nii(gm_path);
wm=load_untouch_nii(wm_path);


for i=1:numel(maskvol_list)
    pressbox=load_untouch_nii([maskvol_list(i,1).folder,filesep,maskvol_list(i,1).name]);
    pressbox_csf=pressbox.img.*csf.img;
    pressbox_wm=pressbox.img.*wm.img;
    pressbox_gm=pressbox.img.*gm.img;
    
    filename=strsplit(maskvol_list(i,1).name,'_mask_reg_MNI');
    %CSF press box mask save
    pressbox_csf_vol=pressbox;
    pressbox_csf_vol.img=pressbox_csf;
    outfilenew= [out_Analysis,filesep,filename{1,1},'_csf_mask_reg_MNI',filename{1,2}];
    pressbox_csf_vol.fileprefix=outfilenew;
    pressbox_csf_vol.untouch=1;
    save_untouch_nii(pressbox_csf_vol, outfilenew);
    
    %wm press box mask save
    pressbox_wm_vol=pressbox;
    pressbox_wm_vol.img=pressbox_wm;
    outfilenew= [out_Analysis,filesep,filename{1,1},'_wm_mask_reg_MNI',filename{1,2}];
    pressbox_wm_vol.fileprefix=outfilenew;
    pressbox_wm_vol.untouch=1;
    save_untouch_nii(pressbox_wm_vol, outfilenew);
    %gm press box mask save
    pressbox_gm_vol=pressbox;
    pressbox_gm_vol.img=pressbox_gm;
    outfilenew= [out_Analysis,filesep,filename{1,1},'_gm_mask_reg_MNI',filename{1,2}];
    pressbox_gm_vol.fileprefix=outfilenew;
    pressbox_gm_vol.untouch=1;
    save_untouch_nii(pressbox_gm_vol, outfilenew);
    
end

end