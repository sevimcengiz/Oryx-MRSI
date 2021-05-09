% This function is written to unzip files and read the volumes with spm12. 
% Author: Sevim Cengiz, Sevim Cengiz, Bogazici University, 2020
% Contact: sevim_cengiz@icloud.com
% Inputs: Unzip file path.
% Output: image.

function [img]=ext_unzip(file)

[pathnii,namenii,extnii] = fileparts(file);
if extnii==sprintf('.gz')
    gunzip(file,pathnii)
    file=[pathnii,filesep,namenii];
end

  nii=spm_vol(file);
  img=spm_read_vols(nii);
end