% This function is written for Distribution Box plot module. 
% Inputs: Pinfo struct, selected atlas image, max number of the regions in
% the atlas, exclusion value for the analysis of the region.
% Author: Sevim Cengiz, Bogazici University, 2022 - For revison
% Contact: sevim_cengiz@icloud.com

function [ROI]=dist_boxplot(Pinfo, Sch_atlas_img,whichregion,WhichMetabNo,button2,button1)
Sch_atlas=load_untouch_nii(Sch_atlas_img);
max_val=max(max(max(Sch_atlas.img)));


out_Analysis=[Pinfo.spectrapath,filesep,'nifti',filesep,'MNI_Regist_Probabilistic',filesep,Pinfo.sparname,'_'];
vol_list1=dir([out_Analysis,'*.nii.gz']);
vol_list=vol_list1;

volno=WhichMetabNo;
vis_map='NAA+NAAG_conc_reg_MNI_prob_9.00e-01.nii.gz';

  switch button2
                case 'concentration'
                vis_map=sprintf('%s_conc_reg_MNI_prob_9.00e-01.nii.gz',button1);
                case 'concentration to Ins ratio'
                    if   WhichMetabNo==4
                        app.concentrationmap.Value=1;
                        app.DistributionsButtonPushed(app);
                    else
                        vis_map=sprintf('%s_conc_to_Ins_ratio_reg_MNI_prob_9.00e-01.nii.gz',button1);
                    end
                case 'concentration to tCr ratio'
                    if   WhichMetabNo==4
                        app.concentrationmap.Value=1;
                        app.DistributionsButtonPushed(app);
                    else
                        vis_map=sprintf('%s_conc_to_tCr_ratio_reg_MNI_prob_9.00e-01.nii.gz',button1);
                    end
                case 'CSF corrected concentration'
                    vis_map=sprintf('%s_conc_corrected_reg_MNI_prob_9.00e-01.nii.gz',button1);
                case 'CSF corrected concentration to Ins ratio'
                    if   WhichMetabNo==4
                        app.concentrationmap.Value=1;
                        app.DistributionsButtonPushed(app);
                    else
                        vis_map=sprintf('%s_conc_to_Ins_ratio_corrected_reg_MNI_prob_9.00e-01.nii.gz',button1);
                    end
                case 'CSF corrected concetration to tCr ratio'
                    if   WhichMetabNo==1
                        app.concentrationmap.Value=1;
                        app.DistributionsButtonPushed(app);
                    else
                        vis_map=sprintf('%s_conc_to_tCr_ratio_corrected_reg_MNI_prob_9.00e-01.nii.gz',button1);
                    end
            end


   Volumepath=[out_Analysis,vis_map];
   Volume=load_untouch_nii(Volumepath);

  region=Sch_atlas.img;
        region(find(region~=whichregion))=0;
        region(find(region>0))=1;
        ROI=double(Volume.img).*double(region);
        ROI=ROI(find(ROI>0)); 

end
 