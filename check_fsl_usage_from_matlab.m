% FSL usage from Matlab command window installation check
% If this script gives an error, please go to this website and make sure
% that you have complete fsl-installation properly. 
% If you use MAC, check this link : https://fsl.fmrib.ox.ac.uk/fsl/fslwiki/FslInstallation/MacOsX (Advance Usage part-Using FSL from MATLAB)
% If you use LINUX, check this link :
% https://fsl.fmrib.ox.ac.uk/fsl/fslwiki/FslInstallation/Linux (Using FSL
% from MATLAB)

function check_fsl_usage_from_matlab()

currentFolder = pwd;
datapath=[currentFolder, filesep, 'Dataset',filesep,'K_01',filesep,'exam_1',filesep,'images',filesep,'T1', filesep,'nifti',filesep,'K_01.nii.gz'];
outputpath=[currentFolder, filesep, 'Dataset',filesep,'K_01',filesep,'exam_1',filesep,'images',filesep,'T1', filesep,'nifti',filesep,'K_01_Bet.nii.gz'];
sprintf('FSL usage from matlab is checking by using FSL BET');
system(['bet ',datapath,' ',outputpath,' -m -f 0.35']);
sprintf('FSL usage from matlab is working.');

end


%%% For MacOsX, it might be helpful. Copied from https://fsl.fmrib.ox.ac.uk/fsl/fslwiki/FslInstallation/MacOsX (Advance Usage part-Using FSL from MATLAB)
% If you have installed FSL somewhere
% other than  /usr/local/fsl/, change
% this first line accordingly.
%fsldir = '/usr/local/fsl/; 
%fsldirmpath = sprintf('%s/etc/matlab',fsldir);
%setenv('FSLDIR', fsldir);
%setenv('FSLOUTPUTTYPE', 'NIFTI_GZ');
%path(path, fsldirmpath);
%clear fsldir fsldirmpath; 
