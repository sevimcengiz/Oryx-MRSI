% This function is written by Abdullah Bas, Bogazici University 2021
% Author: Abdullah Bas, Bogazici University, 2021
function [tabledata,metabs,corrMatrix,sp,bg,fit,coord_filename]= load_lcmodel(root,file,slice,row,col)
coordname=sprintf('_sl%d_%d-%d.coord', slice, str2num(row), str2num(col));
dir_coord=[root filesep file coordname];
for i=1:1
    %dirs=dir([folder '\*']) 
    %irs=dirs((~[dirs(:).isdir]))
    splitted=strsplit((dir_coord),'.coord');
    %directories=strsplit([dirs(1).folder '\' dirs(1).name],'.coord')
    %x=zeros(1,272), x(1:2:end)=1, x2=vec2mat(x,17),x3=x2(1:16,1:16)
    mainText=[splitted{1}];
    tabledata{i}=mrs_readLcmodelTABLE(strcat(mainText,'.table'));  
    %dirs=dir([folder,'\1\35ms\sl' int2str(x(1,i)) '_' int2str(x(2,i)) '-' int2str(x(3,i)) '.coord'])   
    figurelist=''; % Define patient protocol numbers
    %vox_name=sprintf('sl1_%d-%d',slx,sly);
    %vox={vox_name};
    PID=(figurelist);
    %voxname=char(vox(m));
    %cd(PID);
    % coord_filename=strcat(PID,'.coord');
    % output_filename=strcat(PID,'.print');
    coord_filename{i}=[mainText '.coord'];
    output_filename=strcat(mainText,'.print');    
    % Read metabolite details and correlation coefficients table
    [metabs{i},corrMatrix{i}]=io_loadlcmdetail(output_filename);   
    [bg{i}]=io_readlcmcoord_getBackground(coord_filename{i},'bg');
    ppm=bg{i}.ppm;
    ind=1;
    [fit{i}]=io_readlcmcoord_getBackground(coord_filename{i},'fit');
    fit{i}.specs=fit{i}.specs-bg{i}.specs;
    [sp{i}]=io_readlcmcoord_getBackground(coord_filename{i},'sp');    
    tabledata{i}=mrs_readLcmodelTABLE(strcat(mainText,'.table'));
    %table_res{1,tot_vox}=tabledata;
    %%
    % Create a line plot of all metabolites minus the background
    %figx=figure('units','centimeters','outerposition',[0 0 50 30]);  
end
end