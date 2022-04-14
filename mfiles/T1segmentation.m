%-------------Script to perform FSL FAST segmentation-------------%
% This function is written to perform segmentation via FSL FAST .
% If segmentation has been performed already, it skips segmentation.
% If you reperform segmentation, please delete Bet_seg.nii.gz file
% in T1/nifti folder of each patient.
% Author: Sevim Cengiz, Bogazici University, 2021
% Contact: sevim_cengiz@icloud.com
function T1segmentation(Pinfo)
segfile= [Pinfo.mainpath,'exam_1', filesep, 'images', filesep,'T1',filesep,'nifti',filesep,Pinfo.name,'_Bet_seg.nii.gz'];

if  isfile(segfile)
    sprintf('Segmentation done before! %s',Pinfo.name)
else
    sprintf('FSL Fast is running for segmentation')
    T1nii=[Pinfo.mainpath,'exam_1', filesep, 'images', filesep,'T1',filesep,'nifti',filesep,Pinfo.name,'_Bet.nii.gz'];
    system(['fast ',T1nii]); %instead of onlt fast
end