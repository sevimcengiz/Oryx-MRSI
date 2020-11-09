
function [img]=ext_unzip(file)

[pathnii,namenii,extnii] = fileparts(file);
if extnii==sprintf('.gz')
    gunzip(file,pathnii)
    file=[pathnii,filesep,namenii];
end

  nii=spm_vol(file);
  img=spm_read_vols(nii);
end