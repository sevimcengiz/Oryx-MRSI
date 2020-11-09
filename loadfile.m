function [Pinfo]= loadfile()
% It asks user to select a .spar file path to creates Pinfo struct. 

% Pinfo = struct
% sparname: 'PD_24_press_2_raw_act'
% coordpath: '~/Dataset/P24/exam_1/spectra/lcmodel_outputs/PD_24_press_2_raw_act/'
% spectrapath: '~/Dataset/P24/exam_1/spectra'
% sparfilepath: '~/Dataset/P24/exam_1/spectra/PD_24_press_2_raw_act'
% mainpath: '~/Dataset/P24/'
% ncol: 12
% nrow: 12
% nsli: 3
% voxoffap: 34.5913
% voxofflr: 0.1391
% voxoffcc: -14.5807
% voxangap: 0
% voxanglr: 0
% voxangcc: 0
% apVOI: 80
% lrVOI: 110
% ccVOI: 36
% FOV: 120
% slidistance: 12
% slithickness: 36
% littlevoxels: [3×12×12 struct] 

% littlevoxels struct calculates each little voxel's location in anatomical position.
% It calculates each voxel location on LR way.
% The imaging format is Left,Posterior,Head(Superior)
% Therefore, the location values increase as one traverses toward left.)
% Ascending sort is need on LR way.

% Sevim Cengiz, Bogazici University, Turkey (2020-11-27)
% sevim_cengiz@icloud.com 

[filename, pathname] = uigetfile('*.spar', 'Pick a .spar file ');
[fpath,fname,extfile] = fileparts([pathname,filename]);
sparfilepath=[fpath,filesep,fname];
coordfilespath= [fpath,filesep,'lcmodel_outputs',filesep,fname,filesep];

Pinfo.sparname=fname;
Pinfo.coordpath=coordfilespath;
Pinfo.spectrapath=fpath;
Pinfo.sparfilepath=sparfilepath;
exam1=strsplit(Pinfo.spectrapath,'exam_1');
Pinfo.mainpath=exam1{1,1};
patientno=strsplit(Pinfo.mainpath,filesep);
Pinfo.name=patientno{1,(end-1)};



% Get slice, row, column info from .spar file.
sparheadinfo = textread([pathname,filename], '%s');

finderinfo=find(ismember(sparheadinfo, 'dim2_pnts')==1); % col == LR way --mm
Pinfo.ncol= str2double(sparheadinfo{finderinfo+2});
finderinfo=find(ismember(sparheadinfo, 'dim3_pnts')==1); % row == AP way --mm
Pinfo.nrow= str2double(sparheadinfo{finderinfo+2});
finderinfo=find(ismember(sparheadinfo, 'dim4_pnts')==1); % slice == cc way --mm
Pinfo.nsli= str2double(sparheadinfo{finderinfo+2});
finderinfo=find(ismember(sparheadinfo, 'ap_off_center')==1);
Pinfo.voxoffap = str2num(sparheadinfo{finderinfo+2});
finderinfo=find(ismember(sparheadinfo, 'lr_off_center')==1);
Pinfo.voxofflr = str2num(sparheadinfo{finderinfo+2});
finderinfo=find(ismember(sparheadinfo, 'cc_off_center')==1);
Pinfo.voxoffcc = str2num(sparheadinfo{finderinfo+2});
finderinfo=find(ismember(sparheadinfo, 'ap_angulation')==1);
Pinfo.voxangap= str2num(sparheadinfo{finderinfo+2});
finderinfo=find(ismember(sparheadinfo, 'lr_angulation')==1);
Pinfo.voxanglr = str2num(sparheadinfo{finderinfo+2});
finderinfo=find(ismember(sparheadinfo, 'cc_angulation')==1);
Pinfo.voxangcc = str2num(sparheadinfo{finderinfo+2});
finderinfo=find(ismember(sparheadinfo, 'ap_size')==1); % ap voi size
Pinfo.apVOI = str2num(sparheadinfo{finderinfo+2});
finderinfo=find(ismember(sparheadinfo, 'lr_size')==1); % lr voi size
Pinfo.lrVOI = str2num(sparheadinfo{finderinfo+2});
finderinfo=find(ismember(sparheadinfo, 'cc_size')==1); % cc voi size
Pinfo.ccVOI = str2num(sparheadinfo{finderinfo+2});
finderinfo=find(ismember(sparheadinfo, 'phase_encoding_fov')==1); % FOV --mm
Pinfo.FOV = str2num(sparheadinfo{finderinfo+2});
finderinfo=find(ismember(sparheadinfo, 'slice_distance')==1); %slice distance --mm
Pinfo.slidistance = str2num(sparheadinfo{finderinfo+2});
finderinfo=find(ismember(sparheadinfo, 'slice_thickness')==1); %slice thickness --mm
Pinfo.slithickness = str2num(sparheadinfo{finderinfo+2});

little_vox_dim_lr= (Pinfo.FOV) /  (Pinfo.ncol); % --mm
little_vox_dim_ap= (Pinfo.FOV) /  (Pinfo.nrow); % --mm
little_vox_dim_cc= (Pinfo.slithickness) / (Pinfo.nsli); %--mm

% -It calculates each little voxel's location in anatomical
% position.
% -It calculates the coordinates of each voxel from center location of FOV.
% -Calculation is need for negative and positive side of center location
% of FOV that we obtained from spar file to find each voxels' location.
% -It calculates each voxel location on LR way.
% -The imaging format is Left,Posterior,Head(Superior)
% -Therefore, the location values increase as one traverses toward left.)
% -Ascending sort is need on LR way.
clear ncol
count=1;
for npoint=0:((Pinfo.ncol/2)-1)
    ncol(1,count)=(-little_vox_dim_lr*npoint)+(Pinfo.voxofflr)-(little_vox_dim_lr/2);
    count=count+1;
end
clear pcol
count=1;
for npoint=1:((Pinfo.ncol/2))
    pcol(1,count)=(little_vox_dim_lr*npoint)+(Pinfo.voxofflr)-(little_vox_dim_lr/2);
    count=count+1;
end
clear loc_col
loc_col=[pcol ncol];
loc_col= sort( loc_col);

% -It calculates each voxel location on AP way.
% -The imaging format is Left,Posterior,Head(Superior)
% -Therefore, the location values decrease as one traverses toward inferior.)
% -Descending sort is need on AP way.
clear prow
count=1;
for npoint=0:((Pinfo.nrow/2)-1)
    prow(1,count)=(little_vox_dim_ap*npoint)+(Pinfo.voxoffap)+(little_vox_dim_ap/2);
    count=count+1;
end
clear nrow
count=1;
for npoint=1:((Pinfo.nrow/2))
    nrow(1,count)=(-little_vox_dim_ap*npoint)+(Pinfo.voxoffap)+(little_vox_dim_ap/2);
    count=count+1;
end
clear loc_row
loc_row=[prow nrow];
loc_row = sort( loc_row);

% -It calculates each voxel location on FH way.
% -The imaging format is Left,Posterior,Head(Superior)
% -Therefore, the location values increase as one traverses toward left.)
% -Ascending sort is need on FH CC way.

clear psli
count=1;
for npoint=0:(Pinfo.nsli/2)
    psli(1,count)=(little_vox_dim_cc*npoint)+(Pinfo.voxoffcc);
    count=count+1;
end
clear nsli
count=1;
for npoint=1:((Pinfo.nsli/2))
    nsli(1,count)=(-little_vox_dim_cc*npoint)+(Pinfo.voxoffcc);
    count=count+1;
end
clear loc_sli
loc_sli=[psli nsli];
loc_sli= sort( loc_sli);

for isli=1: Pinfo.nsli
    for irow=1:Pinfo.nrow
        for icol=1:Pinfo.ncol
            Pinfo.littlevoxels(isli,irow,icol).name= sprintf('litvox_sl%d_r%d_c%d',isli,irow, icol);
            Pinfo.littlevoxels(isli,irow,icol).loc= [loc_sli(1,isli) loc_row(1,irow) loc_col(1,icol)] ;
            
        end
    end
end

end