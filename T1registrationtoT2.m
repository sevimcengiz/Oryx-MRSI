%% This function is written to register T1 bet extracted file and T1 segmentation files onto T2 reference image.
% If registration has been performed already, it skips registration
% If you reperform registration, please delete T1/nifti/RegistontoT2 folder of each patient.
function T1registrationtoT2(Pinfo)
T1betfile= [Pinfo.mainpath,'exam_1', filesep, 'images', filesep,'T1',filesep,'nifti',filesep,Pinfo.name,'_Bet.nii.gz'];
T2betfile= [Pinfo.mainpath,'exam_1', filesep, 'images', filesep,'T2',filesep,'nifti',filesep,Pinfo.name,'_Bet.nii.gz'];
T1files=dir([Pinfo.mainpath,'exam_1', filesep, 'images', filesep,'T1',filesep,'nifti',filesep,Pinfo.name,'_Bet_pve*.nii.gz']);
output_path=[Pinfo.mainpath,'exam_1', filesep, 'images', filesep,'T1',filesep,'nifti',filesep,'Regist_T1_to_T2'];

if ~exist(output_path,'dir')
    mkdir(output_path);
end

output_file= [output_path,filesep,Pinfo.name,'_reg_T1_to_T2.nii.gz'];
if  isfile(output_file)
    sprintf('T1 registration onto T2 done before! %s',Pinfo.name)
else
    sprintf('FSL Flirt is running for registration %s',Pinfo.name)
    matrix_o_path = [output_path,filesep,'mat_reg_T1_to_T2.mat'];
    system(['flirt ', '-in ', T1betfile, ' -ref ', T2betfile, ' -out ', output_file, ' -omat ', matrix_o_path, ' -bins 256 -cost corratio -searchrx -90 90 -searchry -90 90 -searchrz -90 90 -dof 12  -interp trilinear']);
    
    for n=1:numel(T1files)
        T1otherfile= [T1files(n).folder,filesep,T1files(n).name];
        T1filename=strsplit(T1files(n).name,'.nii.gz');
        shadow_o_path = [output_path,filesep,T1filename{1,1},'_reg_T1_to_T2.nii.gz'];
        system(['flirt ', '-in ', T1otherfile, ' -ref ',T2betfile, ' -out ', shadow_o_path, ' -applyxfm ', ' -init ', matrix_o_path,  ' -interp trilinear']);
    end
end
end
