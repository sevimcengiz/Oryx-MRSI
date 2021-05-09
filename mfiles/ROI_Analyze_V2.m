% This function is written for ROI analyze of CSF, WM, and GM maps.
% Inputs: Pinfo struct, selected atlas image, max number of the regions in
% the atlas, exclusion value for the analysis of the region.
% Outputs: Mean, median, and STD values of all metrics.
% Author: Sevim Cengiz, Bogazici University, 2021
% Contact: sevim_cengiz@icloud.com
function [table_mean table_median table_std volno ]= ROI_Analyze_V2(Pinfo, Sch_atlas_img, max_val,exclusionval)

out_Analysis=[Pinfo.spectrapath,filesep,'nifti',filesep,'MNI_Regist_Probabilistic',filesep];
% out_Analysis=[Pinfo.spectrapath,filesep,'nifti',filesep,'MNI_Regist_Probabilistic_Anlyz',filesep];
vol_list1=dir([out_Analysis,'*.nii.gz']);
vol_list2=dir([Pinfo.spectrapath,filesep,'nifti',filesep,'csf_wm_gm_pressbox_prob_files',filesep,'*.nii.gz']);
vol_list=vol_list1;

for nummell=1:numel(vol_list2)
vol_list(nummell+numel(vol_list1),:)=vol_list2(nummell,1);
end

table_mean=cell(numel(vol_list),max_val+2);
table_median=cell(numel(vol_list),max_val+2);
table_std=cell(numel(vol_list),max_val+2);

    table_mean(1,1)={Pinfo.name};
    table_median(1,1)={Pinfo.name};
    table_std(1,1)={Pinfo.name};

for volno=1:numel(vol_list)
    Volumepath=[vol_list(volno).folder,filesep,vol_list(volno).name];
    Volume=load_untouch_nii(Volumepath);
%     table_mean(volno,1)={vol_list(volno).name};
%     table_median(volno,1)={vol_list(volno).name};
%     table_std(volno,1)={vol_list(volno).name};
 
    splitname=strsplit(vol_list(volno).name,[Pinfo.sparname,'_']);
    splitmetric=strsplit(splitname{1,2},{'_reg_MNI'});
    table_mean(volno,2)={splitmetric{1,1}};
    table_median(volno,2)={splitmetric{1,1}};
    table_std(volno,2)={splitmetric{1,1}};
    
    for i=1:max_val
        region=Sch_atlas_img;
        region(find(region~=i))=0;
        region(find(region>0))=1;
        ROI=double(Volume.img).*double(region);
        ROI=ROI(find(ROI>0));
       if length(ROI)>(floor(length(region(find(region>0))).*(exclusionval/100)))
            
            patient_mean=mean(ROI);
            table_mean(volno,i+2)={patient_mean};
            
            patient_median= median(ROI);
            table_median(volno,i+2)={patient_median};
            
            patient_std=std(ROI);
            table_std(volno,i+2)={patient_std};
            
       end
        
    end
end
end