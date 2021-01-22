function [alltable_mean, alltable_median, alltable_std]=ScriptAnalyze(Pinfo,atlaspath,exclusionval)
Sch_atlas=load_untouch_nii(atlaspath);


max_val=max(max(max(Sch_atlas.img)));
alltable_mean(1,1)={'Patient Name'};
alltable_median(1,1)={'Patient Name'};
alltable_std(1,1)={'Patient Name'};
alltable_mean(1,2)={'Metric'};
alltable_median(1,2)={'Metric'};
alltable_std(1,2)={'Metric'};


for j=1:max_val
    alltablename=sprintf('%d. Region/Network',j);
    alltable_mean(1,j+2)={alltablename};
    alltable_median(1,j+2)={alltablename};
    alltable_std(1,j+2)={alltablename};
end

[table_mean table_median table_std volno ]= ROI_Analyze_V2(Pinfo, Sch_atlas.img, max_val,exclusionval);
alltable_mean(2:volno+1,:)= table_mean;
alltable_median(2:volno+1,:)= table_median;
alltable_std(2:volno+1,:)= table_std;

% alltable_mean=cell2mat(alltable_mean);
warning('off','MATLAB:xlswrite:AddSheet'); %optional
atlasname = strsplit(atlaspath,'.nii.gz');

writecell(alltable_mean,([Pinfo.sparname,'_Table_Mean_',atlasname{1,1},'_',num2str(exclusionval),'_perc.xlsx']),'Sheet',1);
writecell(alltable_median,([Pinfo.sparname,'_Table_Median_',atlasname{1,1},'_',num2str(exclusionval),'_perc.xlsx']),'Sheet',1);
writecell(alltable_std,([Pinfo.sparname,'_Table_Std_',atlasname{1,1},'_',num2str(exclusionval),'_perc.xlsx']),'Sheet',1);
end

