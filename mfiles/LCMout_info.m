% This function is written to read FWHM and SNR values parsed from LCModel output files.
% If any Coord or Table file of multivoxel LCModel analysis isn't produced, 'NaN' is assiged to them.
% Author: Sevim Cengiz, Bogazici University, Turkey (2020-11-27)
% sevim_cengiz@icloud.com
% Contact: sevim_cengiz@icloud.com

function [FWHM,SNR]=LCMout_info(tableinfo)

tableidx=find(ismember(tableinfo,'FWHM')==1);
if tableidx > 0
    FWHM=str2num(tableinfo{tableidx+2});
    
else
    FWHM=str2num('NaN');
end

tableidx=find(ismember(tableinfo,'S/N')==1);
if tableidx > 0
    SNR=str2num(tableinfo{tableidx+2});
    
else
    SNR=str2num('NaN');
end
end
