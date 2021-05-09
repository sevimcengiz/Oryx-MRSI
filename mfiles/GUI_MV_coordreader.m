%% It reads multivoxel LCModel coord files and visualize them considering
% slice, row and column numbers. 
% LCmodel outputs are named according to the columns are increasing from R to L and the rows are increasing from A to P. 
% Ex: The Slice# (only for 3D sets) and Row# & Col# ----> 
% For Slice#2, Row#3 & Column#4, the default identifier is sl2 3-4.
% Author: Sevim Cengiz, Bogazici University, 2020 
% Contact: sevim_cengiz@icloud.com
function [allvoxels]=GUI_MV_coordreader(Pinfo)

folders = dir([Pinfo.coordpath,'*.coord']);
[seperatepath,matches]=strsplit(folders(1,1).name,'sl');
name=char(seperatepath(1,1));

nslice=Pinfo(1).nsli;
nrow=Pinfo(1).nrow;
ncol=Pinfo(1).ncol;

for slice=1:nslice
    for row=1:nrow
        for col=1:ncol
            coordname=sprintf('sl%d_%d-%d.coord', slice, row, col);
            dir_coord=[Pinfo.coordpath filesep name coordname];
            if exist(dir_coord,'file')
                [ spectra, spectra_metabolites, x_ppm, info ] = mrs_readLcmodelCOORD(dir_coord);
                allvoxels(slice,row,col).spectra=spectra;
                allvoxels(slice,row,col).x_ppm=x_ppm;
            else
                allvoxels(slice,row,col).spectra=zeros(498,3);
                allvoxels(slice,row,col).x_ppm=zeros(498,1);
            end
        end
    end
    
end