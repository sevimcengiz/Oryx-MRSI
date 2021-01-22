function [table_mean table_median table_std volno ]= ROI_Analyze(Pinfo, Sch_atlas_img, max_val)

out_Analysis=[Pinfo.spectrapath,filesep,'nifti',filesep,'MNI_Regist_Probabilistic',filesep];
% out_Analysis=[Pinfo.spectrapath,filesep,'nifti',filesep,'MNI_Regist_Probabilistic_Anlyz',filesep];
vol_list=dir([out_Analysis,'*.nii.gz']);
table_mean=cell(numel(vol_list),max_val+1);
table_median=cell(numel(vol_list),max_val+1);
table_std=cell(numel(vol_list),max_val+1);
% table_mean(2,2:end)={0};
% table_median(2,2:end)={0};
% table_std(2,2:end)={0};

for volno=1:numel(vol_list)
    Volumepath=[vol_list(volno).folder,filesep,vol_list(volno).name];
    Volume=load_untouch_nii(Volumepath);
    table_mean(volno,1)={vol_list(volno).name};
    table_median(volno,1)={vol_list(volno).name};
    table_std(volno,1)={vol_list(volno).name};
    
    for i=1:max_val
        region=Sch_atlas_img;
        region(find(region~=i))=0;
        region(find(region>0))=1;
        ROI=double(Volume.img).*double(region);
        ROI=ROI(find(ROI>0));
       if length(ROI)>(floor(length(region(find(region>0))).*(30/100)))
            
            patient_mean=mean(ROI);
            table_mean(volno,i+1)={patient_mean};
            
            patient_median= median(ROI);
            table_median(volno,i+1)={patient_median};
            
            patient_std=std(ROI);
            table_std(volno,i+1)={patient_std};
            
       end
        
    end
end
end