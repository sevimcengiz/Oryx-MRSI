function [Pinfo]=VolFracCal(Pinfo,sli,row,col,met,csf_img,gm_img,wm_img)


mask_csf=(csf_img(:,:,:).*Pinfo.metab(met).littlevoxels(sli,row,col).littlemask(:,:,:));
mask_gm=(gm_img(:,:,:).*Pinfo.metab(met).littlevoxels(sli,row,col).littlemask(:,:,:));
mask_wm=(wm_img(:,:,:).*Pinfo.metab(met).littlevoxels(sli,row,col).littlemask(:,:,:));

% mask_csf=(csf_img(:,:,:).*Pinfo(ii).sparinfo(j).littlevoxels(isli,irow,icol).metab(met).littlemask(:,:,:));
% mask_gm=(gm_img(:,:,:).*Pinfo(ii).sparinfo(j).littlevoxels(isli,irow,icol).metab(met).littlemask(:,:,:));
% mask_wm=(wm_img(:,:,:).*Pinfo(ii).sparinfo(j).littlevoxels(isli,irow,icol).metab(met).littlemask(:,:,:));


CSFsum = sum(sum(sum(mask_csf(:,:,:))));
GMsum  = sum(sum(sum(mask_gm(:,:,:))));
WMsum  = sum(sum(sum(mask_wm(:,:,:))));

% Normalize
frac_GM = GMsum / (GMsum + WMsum + CSFsum);
frac_WM = WMsum / (GMsum + WMsum + CSFsum);
frac_CSF= CSFsum / (GMsum + WMsum + CSFsum);

% Pinfo(ii).sparinfo(j).littlevoxels(isli,irow,icol).metab(met).frac_GM=frac_GM;
% Pinfo(ii).sparinfo(j).littlevoxels(isli,irow,icol).metab(met).frac_WM=frac_WM;
% Pinfo(ii).sparinfo(j).littlevoxels(isli,irow,icol).metab(met).frac_CSF=frac_CSF;


Pinfo.frac_GM(met,sli,row,col)=frac_GM;
Pinfo.frac_WM(met,sli,row,col)=frac_WM;
Pinfo.frac_CSF(met,sli,row,col)=frac_CSF;
end